@echo off
set winrar=%ProgramFiles%\WinRAR\UnRAR.exe
set dirE "C:\temp\gact\Ext"
set dirC "C:\temp\gact\Arc"
FOR %%i IN (*.ZIP) do (
winrar e "%%~ni.ZIP" "%dirE%"
move "%%~ni.rar" "%dirC%"
echo completed uncompressing "%%i" and moved archives or archive to "%dirC%"
)
pause
