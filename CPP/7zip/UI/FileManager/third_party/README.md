# Third-party code

## win32-darkmodelib (Git submodule)

The folder `win32-darkmodelib/` is a **Git submodule** pointing at  
<https://github.com/ozone10/darkmodelib>.

**First-time clone of this repo** — include submodules:

```bash
git clone --recurse-submodules <URL-of-your-7zip-fork>
```

**If you already cloned without submodules:**

```bash
git submodule update --init --recursive
```

**Pull upstream darkmodelib updates** (then commit the new submodule pointer in your fork):

```bash
cd CPP/7zip/UI/FileManager/third_party/win32-darkmodelib
git fetch origin
git checkout main
git pull
cd ../../../../../../
git add CPP/7zip/UI/FileManager/third_party/win32-darkmodelib
git commit -m "Bump win32-darkmodelib submodule"
```

Use a release tag instead of `main` if you prefer pinned versions.
