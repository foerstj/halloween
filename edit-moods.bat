:: path of Bits dir
set bits=%~dp0.

pushd %gaspy%
venv\Scripts\python -m landscaping.edit_moods --src "%bits%\source\moods" --edit-from-file mood-edits.txt --bits "%bits%"
if %errorlevel% neq 0 pause
popd
