@echo off
set /p Destination=<System_Path.txt
copy General_Template.SchDot "%Destination%"
echo "send complete"
pause