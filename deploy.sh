#!/bin/bash

# 三角洲行动租号估价系统部署脚本
# 此脚本提供多种部署选项

echo "====================================="
echo "三角洲行动租号估价系统部署工具"
echo "====================================="
echo ""

# 检查是否在正确的目录
if [ ! -f "index.html" ]; then
    echo "错误：请在项目根目录运行此脚本（包含index.html的目录）"
    exit 1
fi

# 显示菜单
echo "请选择部署方式："
echo "1) 本地预览（使用Python HTTP服务器）"
echo "2) 部署到GitHub Pages"
echo "3) 部署到Netlify（需要手动完成）"
echo "4) 部署到Vercel（需要Vercel CLI）"
echo "5) 生成静态文件包（用于其他平台部署）"
echo ""
read -p "请输入选项 [1-5]: " choice

case $choice in
    1)
        echo "正在启动本地预览服务器..."
        echo "请确保已安装Python 3"
        
        # 检查Python是否安装
        if ! command -v python3 &> /dev/null; then
            echo "错误：未找到Python 3。请先安装Python 3。"
            exit 1
        fi
        
        # 启动HTTP服务器
        echo "服务器启动在 http://localhost:8000"
        echo "按 Ctrl+C 停止服务器"
        python3 -m http.server 8000
        ;;
        
    2)
        echo "准备部署到GitHub Pages..."
        
        # 检查git是否安装
        if ! command -v git &> /dev/null; then
            echo "错误：未找到git。请先安装git。"
            exit 1
        fi
        
        # 获取用户信息
        read -p "请输入GitHub用户名: " github_user
        read -p "请输入仓库名称 [delta-rental-valuation]: " repo_name
        
        # 使用默认值如果用户未输入
        repo_name=${repo_name:-delta-rental-valuation}
        
        # 创建git仓库
        echo "初始化git仓库..."
        git init
        git add .
        git commit -m "Initial commit"
        
        echo ""
        echo "请在GitHub上创建仓库 '$repo_name'，然后运行以下命令："
        echo ""
        echo "git remote add origin https://github.com/$github_user/$repo_name.git"
        echo "git branch -M main"
        echo "git push -u origin main"
        echo ""
        echo "然后在GitHub仓库设置中启用GitHub Pages（选择main分支）"
        ;;
        
    3)
        echo "部署到Netlify（需要手动完成）"
        echo ""
        echo "步骤："
        echo "1. 访问 https://www.netlify.com/ 并登录"
        echo "2. 点击 'Add new site' → 'Import an existing project'"
        echo "3. 选择 'GitHub' 并授权访问你的仓库"
        echo "4. 选择你的项目仓库"
        echo "5. 构建设置保持默认（留空）"
        echo "6. 点击 'Deploy site'"
        echo ""
        echo "部署完成后，你将获得一个Netlify域名"
        ;;
        
    4)
        echo "准备部署到Vercel..."
        
        # 检查vercel是否安装
        if ! command -v vercel &> /dev/null; then
            echo "未找到Vercel CLI。正在尝试安装..."
            if command -v npm &> /dev/null; then
                npm i -g vercel
            else
                echo "错误：未找到npm。请先安装Node.js和npm，然后运行 'npm i -g vercel'"
                exit 1
            fi
        fi
        
        echo "运行Vercel部署命令..."
        echo "请按照Vercel CLI的提示完成部署"
        vercel
        ;;
        
    5)
        echo "生成静态文件包..."
        
        # 创建输出目录
        output_dir="delta_rental_valuation_$(date +%Y%m%d)"
        mkdir -p "$output_dir"
        
        # 复制文件
        echo "复制文件到 $output_dir..."
        cp -r * "$output_dir/"
        
        # 创建zip包
        echo "创建压缩包..."
        zip -r "$output_dir.zip" "$output_dir"
        
        echo ""
        echo "静态文件包已生成：$output_dir.zip"
        echo "你可以将此文件上传到任何静态网站托管平台"
        ;;
        
    *)
        echo "无效的选项"
        exit 1
        ;;
esac

echo ""
echo "部署工具执行完成"