#Requires -Version 5.1
<#
.SYNOPSIS
  Build 7-Zip Windows binaries (7z.dll, 7z.exe, 7zG.exe, 7zFM.exe) and copy them to one folder.

.DESCRIPTION
  Each target is built from its own makefile directory with nmake. Run from a normal PowerShell
  prompt; the script locates vcvars*.bat when needed. For dark mode (7zFM / 7zG), initialize
  the win32-darkmodelib submodule first (done automatically unless -SkipSubmodule).

.PARAMETER Platform
  CPU target passed to nmake as PLATFORM= (default: x64).

.PARAMETER OutputDir
  Folder that receives the built binaries (default: bin\windows-<Platform> under repo root).

.PARAMETER Clean
  Run "nmake clean" in each build directory before building.

.PARAMETER SkipSubmodule
  Do not run "git submodule update --init" for win32-darkmodelib.

.EXAMPLE
  .\build-windows.ps1

.EXAMPLE
  .\build-windows.ps1 -Platform x64 -OutputDir D:\dist\7zip -Clean
#>
[CmdletBinding()]
param(
    [ValidateSet('x64', 'x86', 'arm64')]
    [string] $Platform = 'x64',

    [string] $OutputDir = '',

    [switch] $Clean,

    [switch] $SkipSubmodule
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$RepoRoot = $PSScriptRoot
$Cpp7zip = Join-Path $RepoRoot 'CPP\7zip'

if (-not $OutputDir) {
    $OutputDir = Join-Path $RepoRoot "bin\windows-$Platform"
}

$BuildTargets = @(
    @{
        Name = '7z.dll (codec plugin)'
        RelativeDir = 'Bundles\Format7zF'
        Artifact = '7z.dll'
    },
    @{
        Name = '7z.exe (console)'
        RelativeDir = 'UI\Console'
        Artifact = '7z.exe'
    },
    @{
        Name = '7zG.exe (GUI)'
        RelativeDir = 'UI\GUI'
        Artifact = '7zG.exe'
    },
    @{
        Name = '7zFM.exe (file manager)'
        RelativeDir = 'Bundles\Fm'
        Artifact = '7zFM.exe'
    }
)

function Find-VcVarsBat {
    param([string] $PlatformName)

    $vcVarsLeaf = switch ($PlatformName) {
        'x64' { 'vcvars64.bat' }
        'x86' { 'vcvarsamd64_x86.bat' }
        'arm64' { 'vcvarsamd64_arm64.bat' }
    }

    $vswhere = Join-Path ${env:ProgramFiles(x86)} 'Microsoft Visual Studio\Installer\vswhere.exe'
    if (Test-Path -LiteralPath $vswhere) {
        $installPath = & $vswhere -latest -products * -requires Microsoft.Component.MSBuild -property installationPath 2>$null
        if ($installPath) {
            $candidate = Join-Path $installPath "VC\Auxiliary\Build\$vcVarsLeaf"
            if (Test-Path -LiteralPath $candidate) {
                return $candidate
            }
        }
    }

    $years = @('2026', '2022', '2019')
    $editions = @('Enterprise', 'Professional', 'Community', 'BuildTools')
    foreach ($year in $years) {
        foreach ($edition in $editions) {
            $candidate = "C:\Program Files\Microsoft Visual Studio\$year\$edition\VC\Auxiliary\Build\$vcVarsLeaf"
            if (Test-Path -LiteralPath $candidate) {
                return $candidate
            }
        }
    }

    return $null
}

function Test-BuildToolsAvailable {
    return [bool](Get-Command nmake -ErrorAction SilentlyContinue) -and
           [bool](Get-Command cl -ErrorAction SilentlyContinue)
}

function Invoke-NMake {
    param(
        [string] $BuildDir,
        [string] $PlatformName,
        [string] $VcVarsBat,
        [string] $Target = ''
    )

    $nmakeArgs = "PLATFORM=$PlatformName"
    if ($Target) {
        $nmakeArgs += " $Target"
    }

    if ($VcVarsBat) {
        $cmdLine = "call `"$VcVarsBat`" >nul && cd /d `"$BuildDir`" && nmake -nologo $nmakeArgs"
        Write-Verbose $cmdLine
        & cmd.exe /c $cmdLine
    }
    else {
        Push-Location $BuildDir
        try {
            & nmake -nologo $nmakeArgs.Split(' ', [System.StringSplitOptions]::RemoveEmptyEntries)
        }
        finally {
            Pop-Location
        }
    }

    if ($LASTEXITCODE -ne 0) {
        throw "nmake failed in $BuildDir (exit code $LASTEXITCODE)."
    }
}

function Initialize-DarkModeSubmodule {
    $submodulePath = Join-Path $RepoRoot 'CPP\7zip\UI\FileManager\third_party\win32-darkmodelib'
    if (Test-Path -LiteralPath (Join-Path $submodulePath '.git')) {
        return
    }

    Write-Host 'Initializing win32-darkmodelib submodule (required for dark mode in 7zFM / 7zG)...'
    Push-Location $RepoRoot
    try {
        & git submodule update --init --recursive 'CPP/7zip/UI/FileManager/third_party/win32-darkmodelib'
        if ($LASTEXITCODE -ne 0) {
            throw 'git submodule update failed.'
        }
    }
    finally {
        Pop-Location
    }
}

if (-not (Test-Path -LiteralPath $Cpp7zip)) {
    throw "Expected 7-Zip sources at $Cpp7zip"
}

if (-not $SkipSubmodule) {
    Initialize-DarkModeSubmodule
}

$vcVars = $null
if (-not (Test-BuildToolsAvailable)) {
    $vcVars = Find-VcVarsBat -PlatformName $Platform
    if (-not $vcVars) {
        throw @"
Could not find Visual Studio build tools for PLATFORM=$Platform.

Install Visual Studio with "Desktop development with C++", or open an
"x64 Native Tools Command Prompt for VS" and run this script again.
"@
    }
    Write-Host "Using Visual Studio environment: $vcVars"
}
else {
    Write-Host 'Using nmake/cl from the current environment.'
}

New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null

$built = 0
foreach ($target in $BuildTargets) {
    $buildDir = Join-Path $Cpp7zip $target.RelativeDir
    if (-not (Test-Path -LiteralPath $buildDir)) {
        throw "Build directory not found: $buildDir"
    }

    Write-Host ""
    Write-Host "=== Building $($target.Name) ==="
    Write-Host "    Directory: $buildDir"

    if ($Clean) {
        Write-Host '    Cleaning...'
        Invoke-NMake -BuildDir $buildDir -PlatformName $Platform -VcVarsBat $vcVars -Target 'clean'
    }

    Invoke-NMake -BuildDir $buildDir -PlatformName $Platform -VcVarsBat $vcVars

    $artifactPath = Join-Path $buildDir "$Platform\$($target.Artifact)"
    if (-not (Test-Path -LiteralPath $artifactPath)) {
        throw "Expected output not found: $artifactPath"
    }

    Copy-Item -LiteralPath $artifactPath -Destination (Join-Path $OutputDir $target.Artifact) -Force
    $built++
    Write-Host "    -> copied $($target.Artifact)"
}

Write-Host ""
Write-Host "Done. $built binaries in:"
Write-Host "  $OutputDir"
Get-ChildItem -LiteralPath $OutputDir -File | Sort-Object Name | ForEach-Object {
    Write-Host ("  {0,-12} {1,10:N0} bytes" -f $_.Name, $_.Length)
}
