:: name of mod
set mod=halloween
:: name of mod, case-sensitive
set mod_cs=A Halloween Mod

:: path of Bits dir
set bits=%~dp0.
:: path of DS installation
set ds=%DungeonSiege%

:: Compile resource file
call "%bits%\build.bat" %*

::pause

:: Run it!
"%ds%\DSLOA.exe" nointro=true map=%mod%-demo

:: Cleanup resources so as not to confuse Siege Editor
call "%bits%\cleanup.bat" %*
