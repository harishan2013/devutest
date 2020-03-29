@echo off

setlocal EnableDelayedExpansion

SET  version=1.0.1

for /f "tokens=1-3 delims=." %%a in ("%version%") do (
  set /a build=%%c+1
  set version=%%a.%%b.!build!
)
echo %version%
git tag -a %version% -m ""
git push origin --tags
echo "Deployed" %version% to Release
