# OneComme Template - 同接+

一个用于 OneComme 的实时观看数据显示模板，支持多平台数据监控和自定义样式。

## 功能特性

- **多平台支持**：
  - **YouTube**：实时观看数、点赞数
  - **Twitch**：实时观看数、关注者数
  - **Bilibili**：实时观看数、总观看数

- **高度自定义**：
  - 自定义大小、颜色、字体大小
  - 可调节盒子大小和背景透明度
  - 支持保存多套预设配置

- **易于使用**：
  - 图形化配置界面
  - 实时预览效果
  - 一键切换预设

## 安装方法

### 方法一：使用 Windows 安装程序（推荐）

1. 下载最新版本的安装程序
2. 运行 `Template-同接-Setup-v1.0.0.exe`
3. 按照安装向导完成安装
4. 安装完成后会自动打开配置页面

### 方法二：手动安装

1. 下载并解压 zip 文件
2. 将解压后的 `concurrent-plus` 文件夹复制到 OneComme 模板目录：
   ```
   %AppData%\onecomme\templates\custom\
   ```
3. 完整路径应为：
   ```
   %AppData%\onecomme\templates\custom\concurrent-plus\
   ```

## 使用方法

### 前置要求

- 安装 OneComme 软件
- 安装 OneComme Template Utils 插件

### 快速开始

1. **启动 OneComme Template Utils**
   - 通过开始菜单或者访问：`http://localhost:11180/plugins/onecomme.plugin.template-utils/index.html`

2. **选择模板**
   - 在模板列表中找到"同接+"模板
   - 点击选择

3. **配置样式**
   - 调整字体大小、颜色
   - 设置盒子大小和背景透明度
   - 选择要显示的数据类型

4. **保存预设**
   - 配置完成后可以保存为预设
   - 方便快速切换不同的显示样式

5. **应用到 OneComme**
   - 在 OneComme 中添加浏览器源
   - 设置 URL 为模板地址

## 详细教程

### 1. 基础配置

#### 字体设置
- **字体大小**：调整数字显示的大小
- **字体颜色**：设置文字颜色，支持十六进制颜色代码
- **字体样式**：选择字体族（如 Arial、微软雅黑等）

#### 布局设置
- **盒子宽度/高度**：调整整个显示区域的大小
- **背景透明度**：0-100%，控制背景的透明程度
- **边距设置**：调整内容与边框的距离

### 2. 数据源配置

#### YouTube 设置
1. 确保 OneComme 已连接 YouTube
2. 选择要显示的数据：
   - Current View（当前观看数）
   - Like（点赞数）

#### Twitch 设置
1. 确保 OneComme 已连接 Twitch
2. 选择要显示的数据：
   - Current View（当前观看数）
   - Follower（关注者数）

#### Bilibili 设置
1. 确保 OneComme 已连接 Bilibili
2. 选择要显示的数据：
   - Current View（当前观看数）
   - Total View（总观看数）

### 3. 预设管理

#### 创建预设
1. 配置好所有参数
2. 点击"保存预设"按钮
3. 输入预设名称
4. 确认保存

#### 使用预设
1. 在预设列表中选择要使用的预设
2. 点击"应用预设"
3. 设置会自动加载

#### 管理预设
- **编辑预设**：选择预设后修改参数，重新保存
- **删除预设**：在预设列表中选择并删除不需要的预设
- **导出预设**：可以导出预设文件供其他设备使用

### 4. 在 OneComme 中使用

1. **添加浏览器源**
   - 在 OneComme 中点击"添加源"
   - 选择"浏览器"类型

2. **设置模板 URL**
   - URL 地址：[Template Utils 中获取]
   - 宽度/高度：根据预设的盒子大小设置

3. **调整位置**
   - 在 OBS 预览中拖拽调整位置
   - 设置合适的图层顺序

## 故障排除

### 常见问题

**Q: 数据不显示或显示为0？**
A: 
- 检查 OneComme 是否正确连接到直播平台
- 确认直播状态是否为"正在直播"
- 检查网络连接是否正常

**Q: 样式设置不生效？**
A: 
- 刷新浏览器源
- 检查预设是否正确应用
- 清除浏览器缓存

**Q: 模板无法加载？**
A: 
- 确认 OneComme Template Utils 插件已启动
- 检查模板文件是否在正确目录
- 重启 OneComme Template Utils

**Q: 预设丢失？**
A: 
- 检查 `%AppData%\onecomme\templates\custom\concurrent-plus\` 目录
- 确认预设文件是否存在
- 重新创建预设

## 技术支持

- **官方网站**：https://somacoder.cc/
- **教程视频**：[待补充]
- **问题反馈**：X (https://x.com/soma_desune)

## 更新日志

### v1.0.0
- 初始版本发布
- 支持 YouTube、Twitch、Bilibili 三个平台
- 基础样式自定义功能
- 预设保存和管理

## 许可证

Copyright (C) 2025 Soma. 保留所有权利。

## 贡献

欢迎提交问题和改进建议！