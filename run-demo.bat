:: path of Bits dir
set bits=%~dp0.
:: path of DS installation
set ds=%DungeonSiege%

:: Compile resource file
call "%bits%\build.bat" %*

:: Compile map file
set copyright=CC-BY-SA 2025
set author=Johannes Förstner
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\maps\halloween-demo" "%tmp%\Bits\world\maps\halloween-demo" /E
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\halloween-demo.dsmap" -copyright "%copyright%" -title "%map_cs%" -author "%author%"
if %errorlevel% neq 0 pause

::pause

:: Run it!
"%ds%\DSLOA.exe" nointro=true map=halloween-demo

:: Cleanup resources so as not to confuse Siege Editor
call "%bits%\cleanup.bat" %*
