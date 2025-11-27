# 🎨 3D手势粒子特效 - Gesture Particle 3D

> 基于 Three.js 和 MediaPipe Hands 的沉浸式手势交互粒子系统，完美适配 iOS Safari

## ✨ 在线体验

**部署后的访问地址：** `https://你的GitHub用户名.github.io/仓库名/`

## 📱 快速部署到 GitHub Pages

### 步骤 1：创建 GitHub 仓库

1. 登录 [GitHub](https://github.com)
2. 点击右上角 `+` → `New repository`
3. 填写仓库信息：
   - **Repository name**: `gesture-particle-3d`（或其他名称）
   - **Public** (公开仓库才能免费使用 GitHub Pages)
   - ✅ 勾选 `Add a README file` (可选)
4. 点击 `Create repository`

### 步骤 2：上传文件

#### 方法 A：网页上传（推荐）

1. 在仓库页面，点击 `Add file` → `Upload files`
2. 将以下文件拖拽到上传区域：
   - ✅ `index.html` (必需)
   - ✅ `gesture-particle-3d.html` (备用)
   - ✅ `README.md` (可选)
3. 在底部填写提交信息（如 "Initial commit"）
4. 点击 `Commit changes`

#### 方法 B：Git 命令行上传

```bash
# 1. 初始化本地仓库
cd "c:\Users\01664635\Desktop\personal agent\粒子动效app"
git init

# 2. 添加文件
git add index.html gesture-particle-3d.html README.md

# 3. 提交
git commit -m "Initial commit: Add gesture particle 3D effect"

# 4. 连接到远程仓库（替换成你的仓库地址）
git remote add origin https://github.com/你的用户名/gesture-particle-3d.git

# 5. 推送到 GitHub
git branch -M main
git push -u origin main
```

### 步骤 3：启用 GitHub Pages

1. 在仓库页面，点击 `Settings` (设置)
2. 左侧菜单找到 `Pages`
3. 在 **Source** 部分：
   - **Branch**: 选择 `main`
   - **Folder**: 选择 `/ (root)`
4. 点击 `Save`
5. 等待 1-2 分钟，页面会显示部署地址：
   ```
   ✅ Your site is live at https://你的用户名.github.io/gesture-particle-3d/
   ```

### 步骤 4：在 iPhone 访问

1. 复制 GitHub Pages 地址
2. 在 iPhone Safari 浏览器中打开
3. 允许摄像头权限
4. 开始体验手势粒子特效！

---

## 🎯 功能特性

### 6 种手势交互

| 手势 | 效果 | 描述 |
|------|------|------|
| ✊ **握拳聚集** | 粒子聚合 | 粒子快速聚集到拳头位置，形成发光球体 |
| ✋ **张开爆炸** | 粒子散开 | 粒子瞬间爆炸散开，渐变彩虹色 |
| 🤏 **双指缩放** | 缩放控制 | 拇指+食指控制粒子群大小 |
| ☝️ **单指轨迹** | 轨迹跟随 | 指尖移动生成动态粒子流 |
| 👌 **捏合调节** | 密度调节 | 动态增减粒子数量和密度 |
| 👋 **挥手变形** | 形态切换 | 切换粒子形态（球体/片状/星状/螺旋） |

### 视觉特效

- ✨ 半透明发光粒子 + HDR 效果
- 🌈 动态颜色渐变
- 💫 粒子间微弱引力
- 🔦 点光源照亮背景网格
- ⚡ 碰撞闪光特效
- 🌌 深空背景 + 星光点缀
- 🌊 量子波动效果

### iOS 完美适配

- 📱 Safari 15+ 完全支持
- 🎥 智能摄像头权限引导
- ⚡ 性能自适应（3000 → 1500 粒子）
- 🔄 视频流自动翻转修正
- 📐 竖屏优先，自适应布局
- 👆 触摸交互优化

---

## 🔧 技术栈

- **Three.js** (r150) - 3D 图形渲染
- **MediaPipe Hands** - 高精度手势识别（21个关键点追踪）
- **WebGL** - GPU 加速渲染
- **Custom GLSL Shaders** - 粒子发光效果

---

## 📖 使用说明

### 设备要求

- **iOS**: iPhone/iPad (iOS 14+)
- **浏览器**: Safari 15+
- **网络**: 首次需联网加载 CDN 资源
- **环境**: 明亮光线环境（提高手势识别精度）

### 操作技巧

1. **保持距离**: 手部距离摄像头 30-60cm 最佳
2. **完整手掌**: 确保整只手在摄像头视野内
3. **动作清晰**: 手势动作清晰明确，避免模糊
4. **光线充足**: 在光线良好的环境下使用

### 常见问题

**Q: 手势识别不准确？**
- 检查光线是否充足
- 确保手部在摄像头可视范围内
- 避免背景复杂干扰

**Q: 卡顿掉帧？**
- 应用会自动降低粒子数量优化性能
- 关闭其他后台应用释放内存

**Q: 摄像头授权失败？**
- 前往 iPhone 设置 → Safari → 摄像头 → 允许

---

## 🛠️ 自定义配置

编辑 `index.html` 中的 `CONFIG` 对象：

```javascript
const CONFIG = {
    particles: {
        maxCount: 3000,        // 最大粒子数（iOS默认）
        minCount: 1500,        // 最小粒子数（性能优化）
        defaultSize: 0.015,    // 粒子大小
        glowIntensity: 1.5     // 发光强度
    },
    gesture: {
        fistThreshold: 0.15,   // 握拳判定阈值
        openHandThreshold: 0.25,
        pinchThreshold: 0.05,
        swipeSpeedThreshold: 0.3
    }
};
```

---

## 📝 更新日志

### v1.0.0 (2025-11-27)
- ✅ 初始版本发布
- ✅ 6种核心手势识别
- ✅ 完整3D粒子系统
- ✅ iOS Safari完美适配

---

## 📄 许可证

MIT License - 自由使用和修改

---

## 💬 反馈与支持

遇到问题或有建议？欢迎在 GitHub Issues 中反馈！

---

**Enjoy! 🎉** 尽情体验手势粒子特效的魅力！
