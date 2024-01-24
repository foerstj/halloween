:: This script is supposed to be executed from your DS installation folder.
:: TankCreator is expected to be in sibling dirs.

:: name of mod
set mod=halloween
:: name of mod, case-sensitive
set mod_cs=Halloween
:: namespace of resources
set doc_dsloa=%USERPROFILE%\Documents\Dungeon Siege LoA
:: path of DS installation
set ds=.
:: path of TankCreator
set tc=..\TankCreator

set copyright=CC-BY-SA 2024
set author=Johannes Förstner

:: Compile main resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%doc_dsloa%\Bits\art" "%tmp%\Bits\art" /E /xf .gitignore /xf *.psd
robocopy "%doc_dsloa%\Bits\sound" "%tmp%\Bits\sound" /E
robocopy "%doc_dsloa%\Bits\world\contentdb\templates" "%tmp%\Bits\world\contentdb\templates" /E /xd git-ignore
robocopy "%doc_dsloa%\Bits\world\global\moods" "%tmp%\Bits\world\global\moods" /E
robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" /E
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%mod_cs%.dsres" -copyright "%copyright%" -title "%mod_cs%" -author "%author%"
if %errorlevel% neq 0 pause

:: Compile German translation resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%doc_dsloa%\Bits\language" "%tmp%\Bits\language" *.de.gas /E
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%mod_cs%.de.dsres" -copyright "%copyright%" -title "%mod_cs%" -author "%author%"
if %errorlevel% neq 0 pause

:: Cleanup
rmdir /S /Q "%tmp%\Bits"
