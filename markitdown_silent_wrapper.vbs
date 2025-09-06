Set objShell = CreateObject("WScript.Shell")
Set objArgs = WScript.Arguments

' Function to show Windows notification
Sub ShowNotification(title, message, iconType)
    On Error Resume Next
    ' Try to use PowerShell for modern Windows 10/11 toast notifications
    psCommand = "powershell.exe -WindowStyle Hidden -Command """ & _
                "Add-Type -AssemblyName System.Windows.Forms; " & _
                "$notify = New-Object System.Windows.Forms.NotifyIcon; " & _
                "$notify.Icon = [System.Drawing.SystemIcons]::" & iconType & "; " & _
                "$notify.BalloonTipTitle = '" & title & "'; " & _
                "$notify.BalloonTipText = '" & message & "'; " & _
                "$notify.Visible = $true; " & _
                "$notify.ShowBalloonTip(5000); " & _
                "Start-Sleep -Seconds 6; " & _
                "$notify.Dispose()"""
    
    objShell.Run psCommand, 0, False
    
    ' Fallback to system tray balloon if PowerShell fails
    If Err.Number <> 0 Then
        objShell.Popup message, 4, title, 64
    End If
    On Error GoTo 0
End Sub

If objArgs.Count >= 1 Then
    ' Get the directory where this script is located
    scriptDir = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
    exePath = scriptDir & "\markitdown.exe"
    
    ' Build the command line arguments
    inputFile = objArgs(0)
    outputFile = Left(inputFile, InStrRev(inputFile, ".") - 1) & ".md"
    
    ' Run the command silently (0 = hidden window, True = wait for completion)
    returnCode = objShell.Run(Chr(34) & exePath & Chr(34) & " " & Chr(34) & inputFile & Chr(34) & " -o " & Chr(34) & outputFile & Chr(34), 0, True)
    
    ' Show completion notification
    If returnCode = 0 Then
        ShowNotification "MarkItDown Now!", "Conversion completed successfully! Output: " & CreateObject("Scripting.FileSystemObject").GetFileName(outputFile), "Information"
    Else
        ShowNotification "MarkItDown Now!", "Conversion failed. Please check the input file and try again.", "Warning"
    End If
End If
