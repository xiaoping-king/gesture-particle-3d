@echo off
chcp 65001 >nul
echo ====================================
echo    🔧 GitHub 仓库配置工具
echo ====================================
echo.
echo 请按照提示输入您的GitHub信息
echo.

REM 获取GitHub用户名
set /p github_user="您的GitHub用户名: "
if "%github_user%"=="" (
    echo ❌ 用户名不能为空
    pause
    exit /b 1
)

REM 获取仓库名
set /p repo_name="仓库名（例如：gesture-particle-3d）: "
if "%repo_name%"=="" (
    echo ❌ 仓库名不能为空
    pause
    exit /b 1
)

REM 初始化Git（如果还未初始化）
if not exist ".git" (
    echo.
    echo [初始化] 正在初始化Git仓库...
    git init
    git branch -M main
    echo ✅ Git仓库初始化完成
)

REM 配置Git用户信息（如果未配置）
git config user.name >nul 2>&1
if errorlevel 1 (
    echo.
    set /p git_name="您的姓名（用于Git提交）: "
    set /p git_email="您的邮箱（用于Git提交）: "
    git config user.name "%git_name%"
    git config user.email "%git_email%"
    echo ✅ Git用户信息配置完成
)

REM 添加远程仓库
echo.
echo [配置] 正在连接GitHub仓库...
set remote_url=https://github.com/%github_user%/%repo_name%.git

REM 检查是否已存在远程仓库配置
git remote get-url origin >nul 2>&1
if not errorlevel 1 (
    echo 检测到已有远程仓库配置，正在更新...
    git remote set-url origin %remote_url%
) else (
    git remote add origin %remote_url%
)

echo ✅ 远程仓库配置完成
echo.
echo ====================================
echo    配置信息
echo ====================================
echo 仓库地址: %remote_url%
echo 部署网址: https://%github_user%.github.io/%repo_name%/
echo ====================================
echo.
echo 📝 下一步操作：
echo 1. 确保在GitHub上已创建仓库 %repo_name%
echo 2. 运行 deploy.bat 进行首次部署
echo 3. 在GitHub仓库设置中启用 Pages（Settings -> Pages -> Source: main）
echo.
pause
