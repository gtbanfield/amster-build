@echo off
SETLOCAL EnableDelayedExpansion

rem
rem  Copyright 2016-2021 ForgeRock AS. All Rights Reserved
rem
rem  Use of this code requires a commercial software license with ForgeRock AS.
rem  or with one of its affiliates. All use shall be exclusively subject
rem  to such license between the licensee and ForgeRock AS.
rem

set debug_suspend="n"
set debug_port="*:6006"
set debug=

rem check environment
for /f %%f in ('dir amster*.jar /b') do set amster_jar=%%f
if not defined amster_jar (
    echo Could not find amster jar
    exit /B
)
if not DEFINED JAVA_HOME (
    echo "JAVA_HOME not set"
    exit /B
)

rem check args
for %%x in (%*) do (
    if "%%x" == "-d" set debug="-agentlib:jdwp=transport=dt_socket,server=y,suspend=%debug_suspend%,address=%debug_port% -Dorg.slf4j.simpleLogger.defaultLogLevel=DEBUG"
)


"!JAVA_HOME!\bin\java.exe" %debug% -Djava.awt.headless=true -jar %amster_jar% %*
