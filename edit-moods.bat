:: path of Bits dir
set bits=%~dp0.

robocopy "%bits%\world\global\git-ignore\moods" "%bits%\world\global\moods" /S

pushd %gaspy%
venv\Scripts\python -m landscaping.edit_moods --edit-from-file mood-edits.txt --bits "%bits%"
if %errorlevel% neq 0 pause
popd
