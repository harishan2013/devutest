@echo off

setlocal EnableDelayedExpansion

for /f %%v in ('git describe --tags --abbrev^=0') do (
set version=%%v
)
echo "one!"
echo %version%

SET /p buildtag=<versiontag.txt
echo %buildtag%
if %buildtag% == %version% (echo "Tag is Equal")

if %buildtag% lss %version% (echo "Tag is Less")

if %buildtag% gtr %version% (set version=%buildtag%)


for /f "tokens=1-3 delims=." %%a in ("%version%") do (
  set /a build=%%c+1
  set version=%%a.%%b.!build!
)

echo "two"
echo %version%

git remote -v 
git remote set-url origin https://hariharan:bgx8xs9PiEDJgpG-UQwT@gitlab.com/branch-icx/projecticx4.git
git config --global user.email 'harsha.link@gmail.com'
git config --global user.name 'hariharan'
git push origin %version% 

