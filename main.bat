@echo off

setlocal EnableDelayedExpansion

git remote -v 
git remote set-url origin https://hariharan:bgx8xs9PiEDJgpG-UQwT@gitlab.com/branch-icx/projecticx4.git
git config --global user.email 'harsha.link@gmail.com'
git config --global user.name 'hariharan'

echo "Check the latest tag from the global listsss"

for /f %%a in ('git describe --abbrev^=0') do (
set version0=%%a
)
echo %version0% 

for /f %%b in ('git describe --abbrev^=0 origin/TEST') do (
set version1=%%b
)
echo %version1% 

for /f %%c in ('git describe --abbrev^=0 origin/uat') do (
set version2=%%c
)
echo %version2% 


for /f %%d in ('git describe --abbrev^=0 origin/development') do (
set version3=%%d
)
echo %version3%

for /f %%e in ('git describe --abbrev^=0 origin/prod') do (
set version4=%%e
)
echo %version4%


echo %version0% > new.txt
echo %version1% >> new.txt
echo %version2% >> new.txt
echo %version3% >> new.txt
echo %version4% >> new.txt
echo "done"

for /f %%a in ('sort new.txt') do set version=%%a
echo %version%

SET /p buildtag=<versiontag.txt

if %buildtag% == %version% (echo "Tag is Equal")

if %buildtag% lss %version% (echo "Tag is Less")

echo "file"
set bversion=%version%
echo %bversion%

for /f "tokens=1-3 delims=." %%a in ("%version%") do (
  set /a build=%%c+1
  set version=%%a.%%b.!build!
)

echo %version%

if %buildtag% gtr %bversion% (set version=%buildtag%)
echo %buildtag%
echo %version%

echo "Push the new tag"

git tag -a %version% -m ""
git push origin %version%