@echo off
setlocal enabledelayedexpansion
echo MarkItDown Windows Builder
echo ==========================
echo Requirements: Python 3.10+ and Git
echo.

REM Quick checks
python3.13.exe --version >nul 2>&1 || (echo ERROR: Python not found. Install from python.org && pause && exit /b 1)
git --version >nul 2>&1 || (echo ERROR: Git not found. Install from git-scm.com && pause && exit /b 1)

REM Check Python version (requires 3.10+)
echo Checking Python version...

REM Get Python version
for /f "tokens=2" %%i in ('python3.13.exe --version 2^>^&1') do set PYTHON_VERSION=%%i

REM Simple version check using findstr
echo %PYTHON_VERSION% | findstr /r /c:"3\.[0-9]*" >nul
if errorlevel 1 (
    echo ERROR: Could not parse Python version: %PYTHON_VERSION%
    pause && exit /b 1
)

REM Extract major and minor versions
for /f "tokens=1,2 delims=." %%a in ("%PYTHON_VERSION%") do (
    set /a MAJOR=%%a
    set /a MINOR=%%b
)

REM Check if version is 3.10 or higher
if %MAJOR% lss 3 (
    goto :version_warning
)
if %MAJOR% equ 3 if %MINOR% lss 10 (
    goto :version_warning
)
goto :version_ok

:version_warning
echo WARNING: Python %PYTHON_VERSION% found, but MarkItDown requires Python 3.10 or higher
echo This may cause issues during build or runtime.
echo Please install Python 3.10+ from python.org for best results.
echo.
set /p CONTINUE=Do you wish to continue anyway? (y/N):
if /i "%CONTINUE%"=="y" goto :version_ok
if /i "%CONTINUE%"=="yes" goto :version_ok
echo Build cancelled.
pause && exit /b 1

:version_ok
echo Python %PYTHON_VERSION% is approved.

REM Setup
if exist markitdown_build rmdir /s /q markitdown_build
mkdir markitdown_build && cd markitdown_build

REM Clone and build
echo Cloning repository...
git clone --depth 1 https://github.com/microsoft/markitdown.git
cd markitdown\packages\markitdown

echo Setting up environment...
python3.13.exe -m venv venv
call venv\Scripts\activate.bat
python -m pip install --upgrade pip --quiet

echo Installing dependencies...
python -m pip install ".[all]"
echo Installing PyInstaller...
python -m pip install pyinstaller

echo Verifying PyInstaller installation...
python -c "import PyInstaller; print('PyInstaller version:', PyInstaller.__version__)" || (echo ERROR: PyInstaller installation failed && pause && exit /b 1)

echo Testing installation...
python -c "import markitdown; print('markitdown imported successfully')"

echo Creating main entry script...
echo import sys > main.py
echo import markitdown.__main__ >> main.py
echo if __name__ == "__main__": >> main.py
echo     markitdown.__main__.main() >> main.py

echo Creating PyInstaller spec file...
echo # -*- mode: python ; coding: utf-8 -*- > markitdown.spec
echo import os >> markitdown.spec
echo from PyInstaller.utils.hooks import collect_data_files >> markitdown.spec
echo. >> markitdown.spec
echo a = Analysis( >> markitdown.spec
echo     ['main.py'], >> markitdown.spec
echo     pathex=[], >> markitdown.spec
echo     binaries=[], >> markitdown.spec
echo     datas=[ >> markitdown.spec
echo         ^('venv/Lib/site-packages/magika/models', 'magika/models'^), >> markitdown.spec
echo         ^('venv/Lib/site-packages/markitdown', 'markitdown'^) >> markitdown.spec
echo     ] + collect_data_files('magika'^), >> markitdown.spec
echo     hiddenimports=[ >> markitdown.spec
echo         'markitdown', >> markitdown.spec
echo         'markitdown.converters', >> markitdown.spec
echo         'markitdown._markitdown', >> markitdown.spec
echo         'markitdown.__main__', >> markitdown.spec
echo         'requests', >> markitdown.spec
echo         'urllib3', >> markitdown.spec
echo         'certifi', >> markitdown.spec
echo         'charset_normalizer', >> markitdown.spec
echo         'idna', >> markitdown.spec
echo         'mammoth', >> markitdown.spec
echo         'openpyxl', >> markitdown.spec
echo         'beautifulsoup4', >> markitdown.spec
echo         'lxml', >> markitdown.spec
echo         'html5lib', >> markitdown.spec
echo         'webencodings', >> markitdown.spec
echo         'six', >> markitdown.spec
echo         'defusedxml', >> markitdown.spec
echo         'et_xmlfile', >> markitdown.spec
echo         'markdownify', >> markitdown.spec
echo         'magika', >> markitdown.spec
echo         'numpy', >> markitdown.spec
echo         'onnxruntime' >> markitdown.spec
echo     ], >> markitdown.spec
echo     hookspath=[], >> markitdown.spec
echo     hooksconfig={}, >> markitdown.spec
echo     runtime_hooks=[], >> markitdown.spec
echo     excludes=[ >> markitdown.spec
echo         'tkinter', >> markitdown.spec
echo         'matplotlib', >> markitdown.spec
echo         'scipy', >> markitdown.spec
echo         'pandas' >> markitdown.spec
echo     ], >> markitdown.spec
echo     win_no_prefer_redirects=False, >> markitdown.spec
echo     win_private_assemblies=False, >> markitdown.spec
echo     cipher=None, >> markitdown.spec
echo     noarchive=False, >> markitdown.spec
echo ^) >> markitdown.spec
echo. >> markitdown.spec
echo pyz = PYZ(a.pure, a.zipped_data, cipher=None^) >> markitdown.spec
echo. >> markitdown.spec
echo exe = EXE( >> markitdown.spec
echo     pyz, >> markitdown.spec
echo     a.scripts, >> markitdown.spec
echo     a.binaries, >> markitdown.spec
echo     a.zipfiles, >> markitdown.spec
echo     a.datas, >> markitdown.spec
echo     [], >> markitdown.spec
echo     name='markitdown', >> markitdown.spec
echo     debug=False, >> markitdown.spec
echo     bootloader_ignore_signals=False, >> markitdown.spec
echo     strip=False, >> markitdown.spec
echo     upx=True, >> markitdown.spec
echo     upx_exclude=[], >> markitdown.spec
echo     runtime_tmpdir=None, >> markitdown.spec
echo     console=True, >> markitdown.spec
echo     disable_windowing_subsystem=False, >> markitdown.spec
echo ^) >> markitdown.spec

echo Building executable using spec file...
echo Current directory: %CD%
echo Python executable: 
python -c "import sys; print(sys.executable)"
echo Checking PyInstaller availability:
python -c "import PyInstaller; print('PyInstaller found at:', PyInstaller.__file__)"
echo Trying direct PyInstaller execution:
venv\Scripts\pyinstaller.exe --clean --noconfirm markitdown.spec

REM Copy to root
copy dist\markitdown.exe ..\..\..\markitdown.exe

echo.
echo SUCCESS! Executable created: %CD%\..\..\..\markitdown.exe
echo.
echo Creating Inno Setup installer (if available)...
cd ..\..\..\..\

REM Check if Inno Setup is available
where /q iscc
if errorlevel 1 (
    echo Inno Setup not found in PATH. Skipping installer creation.
    echo You can manually compile markitdown-installer.iss with Inno Setup if needed.
) else (
    echo Compiling installer with Inno Setup...
    iscc markitdown-installer.iss
    if errorlevel 1 (
        echo WARNING: Installer compilation failed
    ) else (
        echo SUCCESS! Installer created in dist folder
    )
)

echo.
echo Build complete!
echo Executable: markitdown.exe
echo Usage: markitdown.exe file.pdf -o output.md
echo.
pause
