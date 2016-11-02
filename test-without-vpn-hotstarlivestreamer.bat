@echo off
call set /p link=paste the link:
call set last=%%link:~-1,1%% 
rem call set folder="%~dp0\videos\\"
set folder=M:\\LiveStreamer
If Not Exist %folder% MD %folder%
call set livestreamer="%~dp0\tools\livestreamer\\"
call "%~dp0\tools\php5.4\php.exe" hotstarlivestreamer.php "%%link%%"
IF  %last% NEQ c GOTO:nocollection
call set /p id=enter the Id of the video (example write 1000021386):
call "%~dp0\tools\php5.4\php.exe" hotstarlivestreamer.php "%%link%%" "%%id%%"
call set /p quality=write quality (example write 720p):
call "%~dp0\tools\php5.4\php.exe" hotstarlivestreamer.php "%%link%%" "%%id%%" "%%quality%%" "%%folder%%" "%%livestreamer%%"
GOTO end1
:nocollection
rem call set /p quality=write quality (example write 720p):
Set quality=720p
rem call set /p choice=play or download? (write p or d):
set choice=d
call "%~dp0\tools\php5.4\php.exe" hotstarlivestreamer.php "%%link%%" "%%quality%%" "%%folder%%" "%%livestreamer%%" "%%choice%%"
:end1
pause
:end
