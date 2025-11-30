# 三角洲行动租号估价系统

一个专业的《三角洲行动》游戏账号租号估价H5应用，帮助用户快速评估游戏账号的租赁价值。

## 功能特点

- **智能估价**：基于保险格数、体力、负重等多项指标综合计算租金比例和预估租金
- **多选皮肤系统**：支持选择多个刀皮、干员红皮和枪皮，每个皮肤都有不同的价值加成
- **AI智能分析**：提供详细的账号分析报告和提升建议
- **价格趋势图**：可视化展示账号价值趋势
- **响应式设计**：支持PC端和移动端访问
- **深色/浅色主题**：支持主题切换

## 如何部署为真实网站

### 方法一：GitHub Pages（免费）

1. **创建GitHub仓库**
   - 登录GitHub，创建一个新的仓库（建议命名为 `delta-rental-valuation`）
   - 仓库可以设为公开或私有

2. **上传项目文件**
   - 克隆仓库到本地
   ```bash
   git clone https://github.com/你的用户名/delta-rental-valuation.git
   cd delta-rental-valuation
   ```
   - 将项目文件复制到仓库目录
   ```bash
   cp -r /home/user/vibecoding/workspace/delta_rental_valuation/* .
   ```
   - 提交并推送代码
   ```bash
   git add .
   git commit -m "Initial commit"
   git push origin main
   ```

3. **启用GitHub Pages**
   - 进入仓库设置 → Pages
   - 在"Source"选项中选择"main branch"
   - 点击"Save"，等待几分钟
   - 你的网站将在 `https://你的用户名.github.io/delta-rental-valuation/` 上线

### 方法二：Netlify（免费，推荐）

1. **准备项目**
   - 确保项目根目录有 `index.html` 文件

2. **部署到Netlify**
   - 访问 [Netlify官网](https://www.netlify.com/) 并登录
   - 点击"Add new site" → "Import an existing project"
   - 选择"GitHub"并授权
   - 选择你的项目仓库
   - 在"Build settings"中：
     - Build command: 留空
     - Publish directory: 留空（默认为根目录）
   - 点击"Deploy site"
   - 部署完成后，你将获得一个随机的Netlify域名，可以在设置中自定义

### 方法三：Vercel（免费）

1. **安装Vercel CLI**
   ```bash
   npm i -g vercel
   ```

2. **部署项目**
   ```bash
   cd /home/user/vibecoding/workspace/delta_rental_valuation
   vercel
   ```

3. **按照提示操作**
   - 登录Vercel账号
   - 回答部署配置问题（大部分可以使用默认值）
   - 部署完成后，你将获得一个Vercel域名

## 自定义配置

### 修改网站标题和描述
编辑 `index.html` 文件中的 `<title>` 和 `<meta name="description">` 标签。

### 更换背景图片
1. 将新的背景图片上传到 `images` 目录
2. 编辑 `index.html` 文件中的背景图片URL：
```html
<body class="min-h-screen bg-cover bg-center bg-fixed" style="background-image: url('images/你的新背景图片.jpg');">
```

### 修改主题颜色
编辑 `index.html` 文件中的Tailwind配置：
```javascript
tailwind.config = {
    theme: {
        extend: {
            colors: {
                primary: '#2D3E36', // 军绿色主色调
                secondary: '#D4AF37', // 沙漠金辅助色
                accent: '#8B4513', // 深褐色强调色
                dark: '#1A1A1A', // 深色背景
                light: '#F5F5DC', // 浅色文本
            },
            // ...
        }
    }
}
```

## 本地开发

1. 使用任何静态文件服务器启动项目
   ```bash
   cd /home/user/vibecoding/workspace/delta_rental_valuation
   python3 -m http.server 8000
   ```

2. 在浏览器中访问 `http://localhost:8000`

## 注意事项

1. 本项目是纯前端应用，所有数据处理都在浏览器端完成
2. 如需添加后端功能（如保存用户数据），需要额外开发后端服务
3. 图片资源使用了外部链接，建议将重要图片下载到本地并更新链接
4. 定期更新皮肤列表以保持与游戏同步

## 技术栈

- HTML5
- Tailwind CSS v3
- JavaScript
- Font Awesome
- Chart.js