#!/usr/bin/env pwsh
# 7-Zip quality gate: MSVC nmake PLATFORM=x64 (requires Developer Command Prompt / MSVC action).
$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
Push-Location $repoRoot
try {
    if (-not (Test-Path LATEST.VER)) {
        throw 'LATEST.VER is missing'
    }
    if (-not (Get-Command nmake -ErrorAction SilentlyContinue)) {
        throw 'nmake not found. Run from an MSVC Developer Command Prompt or use actions-msvc-dev-cmd in CI.'
    }

    Write-Host '==> nmake PLATFORM=x64 (CPP/7zip)'
    Push-Location CPP/7zip
    nmake PLATFORM=x64
    if ($LASTEXITCODE -ne 0) { throw 'nmake failed' }
    Pop-Location

    Write-Host '==> validate passed'
}
finally {
    Pop-Location
}
