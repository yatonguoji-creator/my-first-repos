# 将 Flutter 项目绑定到 GitHub 的完整步骤

## 前置准备

### 1. 配置 Git 用户信息（如果还没有配置）

在 PowerShell 中执行以下命令，将 `your-email@example.com` 和 `Your Name` 替换为你的实际信息：

```bash
git config --global user.email "your-email@example.com"
git config --global user.name "Your Name"
```

**示例：**
```bash
git config --global user.email "zhangsan@gmail.com"
git config --global user.name "张三"
```

---

## 步骤 1：完成本地 Git 提交

### 1.1 添加所有文件到暂存区
```bash
cd F:\webMyProjck\flutter_application_1
git add .
```

### 1.2 进行第一次提交
```bash
git commit -m "Initial commit: Flutter application"
```

---

## 步骤 2：在 GitHub 上创建新仓库

### 2.1 登录 GitHub
1. 访问 [https://github.com](https://github.com)
2. 登录你的 GitHub 账号

### 2.2 创建新仓库
1. 点击右上角的 **"+"** 按钮，选择 **"New repository"**
2. 填写仓库信息：
   - **Repository name**: `flutter_application_1`（或你喜欢的名称）
   - **Description**: 可选，填写项目描述
   - **Visibility**: 选择 **Public**（公开）或 **Private**（私有）
   - **⚠️ 重要**：**不要**勾选 "Initialize this repository with a README"（因为我们已经有本地代码）
   - **不要**添加 .gitignore 或 license（项目已有）
3. 点击 **"Create repository"** 按钮

### 2.3 复制仓库地址
创建完成后，GitHub 会显示仓库页面，复制仓库的 HTTPS 或 SSH 地址：
- **HTTPS**: `https://github.com/你的用户名/flutter_application_1.git`
- **SSH**: `git@github.com:你的用户名/flutter_application_1.git`

---

## 步骤 3：连接本地仓库到 GitHub

### 3.1 添加远程仓库地址

**使用 HTTPS（推荐新手）：**
```bash
cd F:\webMyProjck\flutter_application_1
git remote add origin https://github.com/你的用户名/flutter_application_1.git
```

**或使用 SSH（需要配置 SSH 密钥）：**
```bash
git remote add origin git@github.com:你的用户名/flutter_application_1.git
```

### 3.2 验证远程仓库是否添加成功
```bash
git remote -v
```

应该显示：
```
origin  https://github.com/你的用户名/flutter_application_1.git (fetch)
origin  https://github.com/你的用户名/flutter_application_1.git (push)
```

---

## 步骤 4：推送代码到 GitHub

### 4.1 推送代码到 GitHub
```bash
git branch -M main
git push -u origin main
```

**说明：**
- `git branch -M main`: 将当前分支重命名为 `main`（GitHub 默认主分支名）
- `git push -u origin main`: 推送代码到 GitHub，`-u` 参数设置上游分支

### 4.2 如果使用 HTTPS，可能需要身份验证
- 如果提示输入用户名和密码：
  - **用户名**: 你的 GitHub 用户名
  - **密码**: 使用 **Personal Access Token**（不是 GitHub 密码）
  
#### 如何创建 Personal Access Token：
1. 登录 GitHub
2. 点击右上角头像 → **Settings**
3. 左侧菜单选择 **Developer settings**
4. 选择 **Personal access tokens** → **Tokens (classic)**
5. 点击 **Generate new token** → **Generate new token (classic)**
6. 填写信息：
   - **Note**: 例如 "Flutter Project"
   - **Expiration**: 选择过期时间
   - **Select scopes**: 至少勾选 `repo`（完整仓库访问权限）
7. 点击 **Generate token**
8. **⚠️ 重要**：复制生成的 token（只显示一次），这就是你的密码

---

## 步骤 5：验证上传成功

1. 刷新你的 GitHub 仓库页面
2. 应该能看到所有项目文件已经上传成功

---

## 后续操作

### 日常提交和推送代码

每次修改代码后，使用以下命令：

```bash
# 1. 查看修改的文件
git status

# 2. 添加修改的文件
git add .

# 3. 提交修改
git commit -m "描述你的修改内容"

# 4. 推送到 GitHub
git push
```

### 拉取远程更新（多人协作时）

```bash
git pull origin main
```

---

## 常见问题

### Q: 如果远程仓库地址添加错了怎么办？
```bash
# 删除错误的远程仓库
git remote remove origin

# 重新添加正确的地址
git remote add origin https://github.com/你的用户名/仓库名.git
```

### Q: 如何查看当前的远程仓库地址？
```bash
git remote -v
```

### Q: 推送时提示 "remote: Support for password authentication was removed"？
- 需要使用 Personal Access Token 代替密码
- 或配置 SSH 密钥使用 SSH 方式

---

## 完整命令总结（按顺序执行）

```bash
# 1. 配置 Git 用户信息（只需执行一次）
git config --global user.email "your-email@example.com"
git config --global user.name "Your Name"

# 2. 进入项目目录
cd F:\webMyProjck\flutter_application_1

# 3. 添加文件并提交
git add .
git commit -m "Initial commit: Flutter application"

# 4. 添加远程仓库（替换为你的实际仓库地址）
git remote add origin https://github.com/你的用户名/flutter_application_1.git

# 5. 推送代码
git branch -M main
git push -u origin main
```

---

**完成！** 🎉 你的 Flutter 项目现在已经成功绑定到 GitHub 了！
