:-----------------------------------------------------------------------------------------------------------------------
: Program : hideUnhide.BAT
:
: Command to execute this script : Call D:\hideUnhide.bat "Arg1" "Arg2" "Arg3" "Arg4" 
:
: Note : 1. Arg1 and Arg2 are mandatory, Arg3 and Arg4 are optional. 
:
:       Arg1 : Folder Name.................. - Folder must be fully qualified.
:       Arg2 : Attribute.................... - Attribute allowed to modify -> [+H | -H]
:       Arg3 : Exception file name ......... - Extension is must, to consider files with same extension use "*.<extn>"
:       Arg4 : Process sub folders as well.. - If "/S" then subfolders are also considered.     
:-----------------------------------------------------------------------------------------------------------------------
:-----------------------------------------------------------------------------------------------------------------------

set folder=%~1

if not "%folder:~1,2%" == ":\" ( 
   echo Folder must be fully qualified. - %folder%
   GOTO Ender 
)

if "%~2" == "" (
   echo Invalid ATTRIB option specified. - "%~2"
   GOTO Ender
)

cd\

set opr1=%~2
set opr2=
set file=%~3
set subfldr=%~4
set sbfldr=
set drive=%folder:~0,2%

%drive%

if /I not "%opr1:~1,1%" == "H"  ( 
   echo Invalid ATTRIB option specified. "%opr1%"
   GOTO Ender 
)
if /I "%opr1%" == "-H"  ( set opr2=+H )
if /I "%opr1%" == "+H"  ( set opr2=-H )

if "%subfldr%" == "" ( 
   set sbfldr= 
)else (
       if /I "%subfldr%" == "/S" ( 
          set sbfldr=/S /D 
       ) else (
               echo Invalid Sub folder option specified. - "%subfldr%"
               GOTO Ender
         ) 
)

echo folder= %folder%, ATTRIBUTE= %opr1%, Exception file= %file%, ATTRIBUTE(for exception file)=%opr2%, sub folder option=%sbfldr%

cd %folder%

ATTRIB %opr1% *.* %sbfldr%

if not "%~3" == "" ( 
   ATTRIB %opr2% %file%
)

:Ender 
Exit
