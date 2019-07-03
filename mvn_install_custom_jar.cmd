@echo off
  cls
  set M2_HOME=C:\tools\apache-maven-3.3.9
 
  set jarPath=h:\jars\scala-compiler-2.10.5.jar
  set grpid=org.scala-lang
  set artifactid=scala-compiler
  set version=2.10.5



  call :install 

  

:install
  echo %M2_HOME%\bin\mvn install:install-file -Dfile=%jarPath% -DgroupId=%grpid% -DartifactId=%artifactid% -Dversion=%version% -Dpackaging=jar -s %M2_HOME%\..\settings.xml

  echo .
  echo .
  echo .

  %M2_HOME%\bin\mvn install:install-file  -Dfile="%jarPath%" -DgroupId="%grpid%" -DartifactId="%artifactid%" -Dversion="%version%" -Dpackaging="jar" -DgeneratePom=true  -s "%M2_HOME%\..\settings.xml"



GOTO:EOF
