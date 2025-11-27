# 🚀 GitHub 自动部署指南

## 快速开始（仅需配置一次）

### 步骤 1：在 GitHub 创建仓库

1. 访问 https://github.com/new
2. 填写仓库名（例如：`gesture-particle-3d`）
3. 选择 **Public**（公开）
4. **不要**勾选 `Add a README file`（避免冲突）
5. 点击 **Create repository**

### 步骤 2：配置本地 Git 连接

**双击运行** `setup-github.bat`，按提示输入：
- GitHub 用户名
- 仓库名（与步骤1中创建的一致）
- 您的姓名和邮箱（首次使用Git）

### 步骤 3：首次部署

**双击运行** `deploy.bat`

系统会自动：
1. ✅ 添加所有文件
2. ✅ 提交到本地仓库
3. ✅ 推送到 GitHub

### 步骤 4：启用 GitHub Pages

1. 进入您的 GitHub 仓库页面
2. 点击 **Settings**（设置）
3. 左侧菜单找到 **Pages**
4. **Source** 选择 `main` 分支
5. 点击 **Save**
6. 等待 1-2 分钟，页面会显示访问地址

---

## 日常使用流程（超简单！）

### 当您修改完代码后：

#### 方法 1：使用脚本（推荐）
1. 双击运行 `deploy.bat`
2. 输入本次更新说明（例如："优化粒子效果"）
3. 回车，等待部署完成
4. ✅ 完成！1-2分钟后网站自动更新

#### 方法 2：告诉我（AI 辅助）
直接跟我说：
```
"帮我部署到GitHub"
```
我会自动执行：
```bash
git add .
git commit -m "你的更新说明"
git push
```

---

## 📁 文件说明

```
粒子动效app/
├── index.html                  ← 主页面（GitHub Pages 入口）
├── gesture-particle-3d.html    ← 原始文件
├── README.md                   ← 项目说明
├── .gitignore                  ← Git 忽略规则
├── setup-github.bat            ← 🔧 GitHub 配置工具（仅运行一次）
├── deploy.bat                  ← 🚀 一键部署脚本
├── GitHub自动部署指南.md      ← 本文档
└── 性能优化说明.md
```

---

## 常用命令速查

### 查看当前状态
```bash
git status
```

### 查看提交历史
```bash
git log --oneline
```

### 查看远程仓库
```bash
git remote -v
```

### 撤销未提交的修改
```bash
git checkout -- index.html
```

### 拉取最新代码（多设备协作）
```bash
git pull
```

---

## 故障排查

### 问题 1：推送时要求输入密码

**原因**：GitHub 已不支持密码验证，需要使用 Personal Access Token

**解决方案**：
1. 访问 https://github.com/settings/tokens
2. 点击 **Generate new token** → **Classic**
3. 勾选 `repo` 权限
4. 生成后复制 Token
5. 推送时，用户名填您的GitHub用户名，密码填这个Token

### 问题 2：推送失败（rejected）

**可能原因**：远程仓库有更新

**解决方案**：
```bash
git pull origin main --rebase
git push origin main
```

### 问题 3：提示"fatal: not a git repository"

**解决方案**：重新运行 `setup-github.bat`

### 问题 4：网站没更新

**解决方案**：
1. 检查 GitHub Actions（仓库 Actions 标签页）是否构建成功
2. 清除浏览器缓存（Ctrl + F5）
3. 等待 2-3 分钟

---

## 高级技巧

### 同时修改多个文件后部署

只需运行 `deploy.bat`，会自动添加所有修改

### 回退到之前版本

```bash
# 查看历史版本
git log --oneline

# 回退到指定版本（保留修改）
git reset --soft <commit-id>

# 回退到指定版本（丢弃修改）
git reset --hard <commit-id>
```

### 创建分支（测试新功能）

```bash
# 创建并切换到新分支
git checkout -b test-new-feature

# 切换回主分支
git checkout main

# 合并分支
git merge test-new-feature
```

---

## 🎯 完整工作流示例

### 场景：您优化了粒子效果

1. **本地修改** `index.html`（调整粒子数量）
2. **浏览器测试**（打开本地 HTML 文件）
3. **确认效果满意**
4. **双击** `deploy.bat`
5. 输入：`优化粒子数量提升性能`
6. 回车，等待完成
7. **1分钟后**，iPhone Safari 打开网址查看效果

---

## 📞 需要帮助？

随时告诉我：
- "帮我部署到GitHub"
- "查看部署状态"
- "回退到上一个版本"
- "我推送失败了"

我会立即协助处理！🚀
