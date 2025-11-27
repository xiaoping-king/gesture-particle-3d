@echo off
chcp 65001 >nul
echo ====================================
echo    🚀 GitHub Pages 自动部署工具
echo ====================================
echo.

REM 检查是否已初始化Git
if not exist ".git" (
    echo [初始化] 正在初始化Git仓库...
    git init
    echo ✅ Git仓库初始化完成
    echo.
)

REM 添加所有变更
echo [1/4] 正在添加文件...
git add index.html gesture-particle-3d.html README.md .gitignore

REM 提示输入提交信息
echo.
set /p commit_msg="请输入本次更新说明（直接回车使用默认）: "
if "%commit_msg%"=="" set commit_msg=Update particle effects

REM 提交变更
echo.
echo [2/4] 正在提交变更...
git commit -m "%commit_msg%"

REM 检查是否配置了远程仓库
git remote get-url origin >nul 2>&1
if errorlevel 1 (
    echo.
    echo ⚠️  尚未配置GitHub远程仓库
    echo 请运行 setup-github.bat 进行配置
    pause
    exit /b 1
)

REM 推送到GitHub
echo.
echo [3/4] 正在推送到GitHub...
git push -u origin main

REM 完成
echo.
echo [4/4] ✅ 部署完成！
echo.
echo 🌐 访问您的网站：
git remote get-url origin
echo.
echo 💡 GitHub Pages 通常需要 1-2 分钟生效
pause
