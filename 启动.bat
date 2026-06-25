@echo off
title 3D Tetris - sfz
echo ========================================
echo   3D Tetris 离线版（sfz 服务器）
echo ========================================

if not exist "sfz.exe" (
    echo [错误] 未找到 sfz.exe，请下载并放入当前文件夹。
    pause
    exit
)

start "" /b sfz.exe -p 8080

echo 正在启动服务器...
timeout /t 2 >nul

echo 服务器已启动，正在打开游戏...
start "" http://localhost:8080/tetris3d.html
echo.
echo ========================================
echo  游戏已在浏览器打开。
echo  玩完后，点一下本窗口，按任意键退出。
echo  游戏窗口会自动关闭。
echo ========================================

pause >nul

echo 正在关闭服务器...
taskkill /f /im sfz.exe >nul 2>nul
echo 服务器已停止。

:: 自动关闭游戏窗口（同上）
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $ws.AppActivate('3D Tetris - Wider Frame'); Start-Sleep -Milliseconds 200; $ws.SendKeys('%{F4}')" >nul 2>&1
taskkill /fi "WINDOWTITLE eq 3D Tetris - Wider Frame" /im msedge.exe /f >nul 2>nul
taskkill /fi "WINDOWTITLE eq 3D Tetris - Wider Frame" /im chrome.exe /f >nul 2>nul
taskkill /fi "WINDOWTITLE eq 3D Tetris - Wider Frame" /im firefox.exe /f >nul 2>nul

echo 已全部关闭，感谢游玩！
timeout /t 2 >nul
exit