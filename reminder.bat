@echo off 

powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('What is the reminder?:', 'Input box example')}" > %TEMP%\output1.tmp
set /p NOTIFY=<%TEMP%\output1.tmp
powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter when you should be reminded in seconds:', 'Input box example')}" > %TEMP%\out.tmp
set /p OUT=<%TEMP%\out.tmp
timeout /t %OUT% [/nobreak]
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Reminder', '%NOTIFY%', [System.Windows.Forms.ToolTipIcon]::None)}"
