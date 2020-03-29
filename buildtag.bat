@echo off

setlocal EnableDelayedExpansion

SET  version=1.0.0

for /f "tokens=1-3 delims=." %%a in ("%version%") do (
  set /a build=%%c+1
  set version=%%a.%%b.!build!
)
echo %version%
git config --global user.name "harsha.s shanmugam"
git config --global user.email "harsha.link@gmail.com"
git tag -a %version% -m ""
git push origin --tags
echo "Deployed" %version% to Release
