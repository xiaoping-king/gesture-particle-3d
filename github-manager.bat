@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

:main_menu
cls
echo ========================================================
echo    🐙 GitHub 部署管理工具 (Gesture Particle 3D)
echo ========================================================
echo.
echo    [1] 🔧 初始化与配置 (Setup)
echo        - 初始化 Git 仓库
echo        - 配置用户信息
echo        - 关联 GitHub 远程仓库
echo.
echo    [2] 🚀 一键部署 (Deploy)
echo        - 提交代码变更
echo        - 推送到 GitHub Main 分支
echo.
echo    [3] 📊 查看状态 (Status)
echo        - 查看远程仓库地址
echo        - 查看当前文件状态
echo.
echo    [0] 🚪 退出
echo.
echo ========================================================
set /p choice="请选择操作 [0-3]: "

if "%choice%"=="1" goto setup_section
if "%choice%"=="2" goto deploy_section
if "%choice%"=="3" goto status_section
if "%choice%"=="0" exit /b 0
goto main_menu

:setup_section
cls
echo ====================================
echo    🔧 GitHub 仓库配置
echo ====================================
echo.

if not exist ".git" (
    echo [1/3] 正在初始化 Git 仓库...
    git init
    git branch -M main
    echo ✅ Git 仓库初始化完成
) else (
    echo [1/3] Git 仓库已存在
)
echo.

echo [2/3] 检查 Git 用户配置...
git config user.name >nul 2>&1
if errorlevel 1 (
    echo.
    echo ⚠️ 未检测到 Git 用户配置，请输入：
    set /p git_name="您的姓名 (Git): "
    set /p git_email="您的邮箱 (Git): "
    git config user.name "!git_name!"
    git config user.email "!git_email!"
    echo ✅ 用户信息已保存
) else (
    for /f "tokens=*" %%i in ('git config user.name') do echo ✅ 当前用户: %%i
)
echo.

echo [3/3] 配置远程仓库...
git remote get-url origin >nul 2>&1
if errorlevel 1 (
    echo.
    echo ⚠️ 未关联远程仓库，请输入 GitHub 信息：
    set /p github_user="GitHub 用户名: "
    set /p repo_name="仓库名称 (例如 gesture-particle-3d): "
    
    if "!github_user!"=="" goto setup_error
    if "!repo_name!"=="" goto setup_error
    
    set remote_url=https://github.com/!github_user!/!repo_name!.git
    git remote add origin !remote_url!
    echo ✅ 已添加远程仓库: !remote_url!
) else (
    for /f "tokens=*" %%i in ('git remote get-url origin') do echo ✅ 当前远程仓库: %%i
    echo     (如需更改，请手动运行 git remote set-url origin ^<url^>)
)

echo.
echo 🎉 配置完成！
pause
goto main_menu

:setup_error
echo ❌ 输入无效，操作取消。
pause
goto main_menu

:deploy_section
cls
echo ====================================
echo    🚀 一键部署到 GitHub
echo ====================================
echo.

if not exist ".git" (
    echo ❌ 错误：未找到 Git 仓库，请先执行 [1] 配置。
    pause
    goto main_menu
)

git remote get-url origin >nul 2>&1
if errorlevel 1 (
    echo ❌ 错误：未关联远程仓库，请先执行 [1] 配置。
    pause
    goto main_menu
)

echo [1/3] 添加文件...
git add .
echo.

echo [2/3] 提交变更...
set /p commit_msg="请输入提交说明 (回车默认 'Update'): "
if "!commit_msg!"=="" set commit_msg=Update
git commit -m "!commit_msg!"
echo.

echo [3/3] 推送到 GitHub...
git push -u origin main

if errorlevel 1 (
    echo.
    echo ❌ 推送失败！请检查网络或 GitHub 仓库设置。
) else (
    echo.
    echo ✅ 部署成功！
    echo 🌐 GitHub Pages 生效可能需要 1-2 分钟。
)
pause
goto main_menu

:status_section
cls
echo ====================================
echo    📊 仓库状态
echo ====================================
echo.
echo [Remote]
git remote -v
echo.
echo [Status]
git status
echo.
pause
goto main_menu
