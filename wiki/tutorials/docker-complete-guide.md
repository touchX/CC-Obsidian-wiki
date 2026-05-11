---
name: docker-complete-guide
description: 技术爬爬虾的 Docker 完整实战教程 — 40分钟精通Docker所有常用功能与命令
type: tutorial
tags: [bilibili, 技术爬爬虾, docker, 容器化, 实战教程, devops]
created: 2026-05-11
updated: 2026-05-11
source: ../../../archive/clippings/bilibili/2026-05-11-40分钟的Docker实战攻略，一期视频精通Docker.md
external_url: https://www.bilibili.com/video/BV1THKyzBER6
---

# Docker 完整实战教程

> [!summary] 技术爬爬虾的 40 分钟 Docker 实战教程 — 涵盖 Docker 所有常用功能与命令
> **课程特色**：零基础入门 + 跨平台安装 + 命令详解 + 容器编排

**来源**：[40分钟的Docker实战攻略，一期视频精通Docker](https://www.bilibili.com/video/BV1THKyzBER6)
**作者**：技术爬爬虾
**发布时间**：2025-06-28
**视频时长**：约 40 分钟

---

## 原始文档

> [!info] 来源
> 本页面基于归档文档 [[../../../archive/clippings/bilibili/2026-05-11-40分钟的Docker实战攻略，一期视频精通Docker.md|原始文档]] 创建

---

## 视频内容概览

### 本期视频覆盖内容

1. **Docker 的核心概念**
2. **在 Linux、Windows、Mac 电脑上安装 Docker**
3. **下载镜像，配置镜像站解决网络问题**
4. **docker run 命令创建并运行容器**
5. **进入容器内部进行调试**
6. **Docker 网络（bridge、子网、host、none 模式）**
7. **轻量级容器编排技术 Docker Compose**
8. **AI 辅助学习 Docker**

### 章节时间线

| 时间点 | 章节 |
|--------|------|
| `00:00` | 核心概念 |
| `01:20` | 安装 |
| `04:09` | 下载镜像 |
| `09:33` | 运行容器 |
| `13:01` | 挂载卷 |
| `16:56` | run 其他参数 |
| `19:34` | 调试容器 |
| `24:45` | 构建镜像 |
| `29:16` | Docker 网络 |
| `33:31` | Docker Compose |

---

## 第一部分：核心概念

### 什么是 Docker

**Docker** 是目前最成熟高效的软件部署技术。简单来说，就是用容器化技术给应用程序封装独立的运行环境，每个运行环境就是一个容器。

### 核心术语

#### 容器与虚拟机

| 特性 | Docker 容器 | 虚拟机 |
|------|-------------|--------|
| **系统内核** | 共用宿主机的系统内核 | 包含完整的操作系统内核 |
| **资源占用** | 更轻、更小 | 更重、更大 |
| **启动速度** | 秒级甚至毫秒级 | 分钟级 |
| **隔离性** | 进程级隔离 | 完全隔离 |

#### 镜像

**镜像是容器的模板**。可以把镜像类比成软件安装包，而容器是安装出来的软件。

**镜像与容器的关系**：
- 就像是用模具做糕点
- Docker 镜像 = 模具
- 容器 = 糕点
- 使用一个模具可以做出很多个糕点
- 也可以把模具分享给其他人

#### 仓库

**Docker 仓库（Registry）**是用来存放和分享镜像的地方：
- 每个人都可以把自己的镜像上传到仓库
- 其他人可以下载并使用
- Docker 官方仓库 = **Docker Hub**

### 术语对照表

| 术语 | 英文 | 解释 |
|------|------|------|
| 容器 | Container | 镜像运行出来的实例 |
| 镜像 | Image | 容器的模板，类似软件安装包 |
| 仓库 | Registry | 存放镜像的地方，如 Docker Hub |
| 镜像库 | Repository | 同一镜像的不同版本集合 |
| 宿主机 | Host | 运行容器的计算机 |

---

## 第二部分：安装 Docker

### Linux 安装

Docker 最好的实战环境是 Linux 系统。

**安装步骤**：
1. 访问 [get.docker.com](https://get.docker.com)
2. 执行第一步和第四步的命令
3. 非 root 用户需要在所有 docker 命令前加 `sudo`

```bash
# 如果遇到 permission denied 错误，在命令前加 sudo
sudo docker version
```

### Windows 安装

**步骤 1：启用 Windows 功能**
1. 搜索"启用或关闭 Windows 功能"
2. 勾选 **Virtual machine platform**（虚拟机平台）
3. 勾选 **WSL**（适用于 Linux 的 Windows 子系统）
4. 重启电脑

**步骤 2：安装 WSL**
```powershell
# 以管理员身份打开 CMD
wsl --set-default-version 2
wsl --update
```

**步骤 3：安装 Docker Desktop**
1. 下载 [Docker Desktop](https://www.docker.com/products/docker-desktop)
2. 根据 CPU 架构选择安装包（一般选择 AMD64）
3. 安装过程一路下一步即可

```powershell
# 指定安装目录
Docker Desktop Installer.exe install --accept-license --installation-dir="D:\Docker"
```

**使用注意**：Docker Desktop 软件需要保持运行状态

### Mac 安装

**最简单的方式**：
1. 根据芯片类型下载对应安装包（Apple Silicon 或 Intel）
2. 双击安装即可

### 安装验证

```bash
docker --version
```

---

## 第三部分：下载镜像

### docker pull 命令

```bash
docker pull <镜像>
```

### 镜像命名结构

一个完整的镜像名包含四个部分：

```
docker.io/library/nginx:latest
│        │        │      │
│        │        │      └── 标签（版本号）
│        │        └── 镜像名
│        └── 命名空间（作者名/官方名）
└── 注册表地址（registry）
```

| 部分 | 说明 | 示例 |
|------|------|------|
| **registry** | 仓库地址，`docker.io` 表示 Docker Hub | `docker.io` |
| **namespace** | 命名空间，作者名或官方标识 | `library`、`n8n` |
| **image** | 镜像名称 | `nginx`、`postgres` |
| **tag** | 版本号，默认 `latest` | `1.28.0`、`latest` |

### 术语区分

| 术语 | 英文 | 说明 |
|------|------|------|
| **Registry** | 注册表 | 整个 Docker Hub 网站 |
| **Repository** | 镜像库 | 同一镜像的不同版本集合（如 nginx） |

### 常用命令

```bash
# 下载镜像
docker pull nginx

# 下载指定版本
docker pull nginx:1.28.0

# 查看所有已下载的镜像
docker images

# 删除镜像
docker rmi <镜像ID>

# 拉取特定 CPU 架构的镜像
docker pull --platform=linux/arm64 nginx
```

### 配置镜像站

**国内网络环境**需要配置镜像站来解决下载问题：

**Linux 配置**：
```bash
sudo vi /etc/docker/daemon.json
# 添加镜像配置
{
  "registry-mirrors": [
    "https://docker.mirrors.io",
    "https://hub-mirror.c.163.com"
  ]
}
# 保存后重启
sudo systemctl restart docker
```

**Docker Desktop 配置**：
1. 打开 Docker Desktop → Settings → Docker Engine
2. 在 `registry-mirrors` 中添加镜像站
3. 点击 Apply & Restart

---

## 第四部分：运行容器

### docker run 命令

```bash
docker run <镜像>
```

**核心概念**：使用镜像创建并运行容器

### 重要参数

| 参数 | 说明 | 示例 |
|------|------|------|
| `-d` | 后台运行（detached mode） | `docker run -d nginx` |
| `-p` | 端口映射 | `docker run -p 80:80 nginx` |
| `-v` | 挂载卷 | `docker run -v /data:/app nginx` |
| `-e` | 设置环境变量 | `docker run -e MYSQL_ROOT_PASSWORD=123 nginx` |
| `--name` | 自定义容器名 | `docker run --name mydb nginx` |
| `-i -t` | 交互式终端 | `docker run -it ubuntu bash` |
| `--rm` | 停止后自动删除 | `docker run --rm nginx` |
| `--restart` | 重启策略 | `docker run --restart=always nginx` |

### 端口映射 (-p)

**作用**：将容器内的端口映射到宿主机的端口

```bash
docker run -p 8080:80 nginx
#        ↑      ↑
#    宿主机   容器内
#    端口    端口
# 顺序：先外后内
```

**示例**：
```bash
# 启动 Nginx 并映射端口
docker run -d -p 80:80 nginx
# 浏览器访问 localhost:80 即可
```

### 容器管理命令

| 命令 | 说明 |
|------|------|
| `docker ps` | 查看正在运行的容器 |
| `docker ps -a` | 查看所有容器（包括已停止） |
| `docker stop <容器ID>` | 停止容器 |
| `docker start <容器ID>` | 启动已停止的容器 |
| `docker rm <容器ID>` | 删除容器 |
| `docker rm -f <容器ID>` | 强制删除运行中的容器 |

### 容器的 ID 和名称

- **Container ID**：每创建一个容器自动分配的唯一 ID
- **Names**：容器名，未指定时自动生成随机名称
- 短 ID 是长 ID 的前缀，功能相同

---

## 第五部分：挂载卷

### 为什么需要挂载卷

**数据持久化**：删除容器时，容器内的所有数据会被删除。使用挂载卷可以将数据保存在宿主机。

### 绑定挂载 (-v)

将宿主机目录与容器目录绑定，双向同步修改：

```bash
docker run -d -p 80:80 -v /宿主机/目录:/容器/目录 nginx
```

**示例**：
```bash
# 挂载 HTML 目录
docker run -d -p 80:80 -v ./html:/usr/share/nginx/html nginx
```

### 命名卷挂载

让 Docker 自动创建和管理存储空间：

```bash
# 创建命名卷
docker volume create mydata

# 使用命名卷
docker run -d -v mydata:/data nginx
```

### 卷管理命令

| 命令 | 说明 |
|------|------|
| `docker volume create <卷名>` | 创建卷 |
| `docker volume ls` | 查看所有卷 |
| `docker volume inspect <卷名>` | 查看卷的详细信息 |
| `docker volume rm <卷名>` | 删除卷 |
| `docker volume prune` | 删除未被使用的卷 |

### 两种挂载方式对比

| 特性 | 绑定挂载 | 命名卷 |
|------|---------|--------|
| **定义** | 手动指定宿主机目录 | Docker 自动管理 |
| **初始化** | 宿主机目录覆盖容器目录 | 容器目录内容同步到卷 |
| **灵活性** | 高（可自定义路径） | 中（由 Docker 管理） |
| **适用场景** | 开发环境、配置挂载 | 生产环境、数据持久化 |

---

## 第六部分：其他 run 参数

### 环境变量 (-e)

```bash
# 设置多个环境变量
docker run -e MYSQL_ROOT_PASSWORD=123456 -e MYSQL_DATABASE=mydb mysql

# MongoDB 示例
docker run -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=secret mongo
```

**查找环境变量**：在 Docker Hub 搜索镜像，查看文档中的 Environment 部分

### 自定义容器名 (--name)

```bash
docker run --name my-nginx -d -p 80:80 nginx

# 删除时使用名字
docker rm my-nginx
```

**注意**：容器名在宿主机上必须唯一

### 交互式终端 (-i -t)

```bash
# 进入容器内部调试
docker run -it ubuntu bash

# 退出后自动删除容器（临时调试用）
docker run -it --rm ubuntu bash
```

### 重启策略 (--restart)

| 策略 | 说明 |
|------|------|
| `no` | 不自动重启（默认） |
| `always` | 始终重启（包括手动停止后） |
| `unless-stopped` | 手动停止后不再重启 |

```bash
# 生产环境常用
docker run -d --restart=always -p 80:80 nginx
```

---

## 第七部分：调试容器

### 容器启停

```bash
# 停止容器
docker stop <容器ID>

# 启动容器（保留原有配置）
docker start <容器ID>

# 强制停止并重启
docker restart <容器ID>
```

### 查看容器信息

```bash
# 查看容器详细信息（JSON 格式）
docker inspect <容器ID>

# AI 辅助解读
# 将输出发给 AI："帮我分析这个容器有没有做端口映射和挂载卷"
```

### 查看日志

```bash
# 查看日志
docker logs <容器ID>

# 滚动查看日志（实时）
docker logs -f <容器ID>
```

### 进入容器内部

```bash
# 在容器内执行命令
docker exec <容器ID> ps -ef

# 进入交互式终端
docker exec -it <容器ID> bash

# 进入 Alpine 容器
docker exec -it <容器ID> /bin/sh
```

### docker create 命令

```bash
# 创建但不启动容器
docker create nginx

# 后续需要手动启动
docker start <容器ID>
```

---

## 第八部分：Docker 技术原理

### 两大内核功能

Docker 利用 Linux 内核的两大功能实现容器化：

#### Cgroups（资源限制）

限制和隔离进程的资源使用：
- 为每个容器设定 CPU、内存、网络带宽等使用上限
- 确保一个容器的资源消耗不影响其他容器

#### Namespaces（命名空间）

隔离进程的资源视图：
- 容器只能看到自己内部的进程、ID、网络、文件目录
- 看不到宿主机的资源

**本质**：容器是一个特殊的进程，但表现得像一个独立的操作系统。

---

## 第九部分：构建镜像

### Dockerfile 是什么

**Dockerfile 是制作镜像的图纸**，详细列出镜像如何制作。

### Dockerfile 指令

| 指令 | 说明 |
|------|------|
| `FROM` | 选择基础镜像 |
| `WORKDIR` | 设置工作目录 |
| `COPY` | 复制文件到镜像 |
| `RUN` | 执行命令 |
| `EXPOSE` | 声明端口 |
| `CMD` | 容器启动命令 |
| `ENTRYPOINT` | 入口点（优先级更高） |

### Dockerfile 示例

```dockerfile
# Python FastAPI 应用
FROM python:3.13-slim

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

EXPOSE 8000

CMD ["python", "main.py"]
```

### 构建并运行

```bash
# 构建镜像
docker build -t myapp:1.0 .

# 运行容器
docker run -d -p 8000:8000 myapp:1.0
```

### 推送镜像到 Docker Hub

```bash
# 登录
docker login

# 重新打标签（带上用户名）
docker tag myapp:1.0 <用户名>/myapp:1.0

# 推送
docker push <用户名>/myapp:1.0
```

---

## 第十部分：Docker 网络

### 四种网络模式

| 模式 | 说明 | 端口映射 |
|------|------|----------|
| **bridge** | 默认桥接模式，所有容器默认连接 | 需要 `-p` |
| **子网** | 自定义桥接网络 | 需要 `-p` |
| **host** | 共享宿主机网络 | 不需要 `-p` |
| **none** | 不联网，完全隔离 | 不需要 `-p` |

### 默认桥接网络

- 所有容器默认连接到此网络
- 每个容器分配内部 IP（一般 172.17.x.x）
- 同网络内容器可通过 IP 互相访问
- 与宿主机网络隔离

### 创建子网

```bash
# 创建子网
docker network create mynet

# 容器加入子网
docker run -d --network=mynet --name=mydb mongo

# 同子网的容器可用名字互相访问
docker run -d --network=mynet --link=mydb myapp
```

### Host 模式

容器直接共享宿主机网络：

```bash
# 无需端口映射
docker run -d --network=host nginx

# 直接访问宿主机端口
curl localhost:80
```

**特点**：
- 容器与宿主机 IP 相同
- 无需 `-p` 参数
- 可能存在端口冲突

### None 模式

```bash
# 完全隔离，不联网
docker run -d --network=none nginx
```

### 网络管理命令

| 命令 | 说明 |
|------|------|
| `docker network ls` | 查看所有网络 |
| `docker network create <网络名>` | 创建网络 |
| `docker network rm <网络名>` | 删除网络 |
| `docker network inspect <网络名>` | 查看网络详情 |

---

## 第十一部分：Docker Compose

### 什么是 Docker Compose

Docker Compose 使用 YAML 文件管理多个容器，是轻量级的容器编排技术。

### docker run vs docker compose

```
docker run:                          docker-compose.yml:
┌─────────────────────────┐         ┌─────────────────────────┐
│ sudo docker network     │         │ services:               │
│   create network1       │         │   mongodb:              │
│                          │         │     image: mongo        │
│ sudo docker run -d       │    ↔    │     networks:          │
│   --name mongodb         │         │       - network1       │
│   --network network1     │         │   mongo-express:        │
│   mongo                  │         │     image: mongo-express │
│                          │         │     depends_on:          │
│ sudo docker run -d       │         │       - mongodb         │
│   --name mongo-express   │         │     networks:           │
│   --network network1     │         │       - network1        │
│   -e ME_CONFIG_MC...     │         └─────────────────────────┘
│   mongo-express          │
└─────────────────────────┘
```

### docker run 参数与 compose 对应

| docker run | docker compose | 说明 |
|-----------|----------------|------|
| `--name` | `container_name` | 容器名 |
| `image` | `image` | 镜像名 |
| `-e` | `environment` | 环境变量 |
| `-v` | `volumes` | 挂载卷 |
| `-p` | `ports` | 端口映射 |
| `--network` | `networks` | 网络 |

### docker compose 常用命令

| 命令 | 说明 |
|------|------|
| `docker compose up` | 启动所有容器 |
| `docker compose up -d` | 后台启动 |
| `docker compose down` | 停止并删除容器 |
| `docker compose stop` | 停止（不删除） |
| `docker compose start` | 启动已停止的容器 |
| `docker compose -f <文件> up` | 指定文件启动 |

### compose 文件示例

```yaml
version: '3'
services:
  mongodb:
    image: mongo
    networks:
      - mynet
  
  mongo-express:
    image: mongo-express
    depends_on:
      - mongodb
    environment:
      ME_CONFIG_MONGODB_SERVER: mongodb
    ports:
      - "8081:8081"
    networks:
      - mynet

networks:
  mynet:
    driver: bridge
```

### AI 辅助编写

> AI 时代不需要手写 docker compose 文件。把 docker 命令告诉 AI，让它生成等价的 compose 文件。

---

## 第十二部分：实战案例

### Nginx + 静态网页

```bash
# 1. 拉取 Nginx 镜像
docker pull nginx

# 2. 创建本地 HTML 目录
mkdir html && cd html

# 3. 创建网页文件
cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<head><title>Hello Docker</title></head>
<body>
  <h1>Welcome to Docker!</h1>
</body>
</html>
EOF

# 4. 启动容器
docker run -d -p 80:80 -v $(pwd):/usr/share/nginx/html nginx

# 5. 浏览器访问 localhost
```

### MongoDB + Mongo Express

```bash
# 1. 创建网络
docker network create mongodb-network

# 2. 启动 MongoDB
docker run -d \
  --network mongodb-network \
  --name mongodb \
  -e MONGO_INITDB_ROOT_USERNAME=admin \
  -e MONGO_INITDB_ROOT_PASSWORD=secret \
  mongo

# 3. 启动 Mongo Express（Web 管理界面）
docker run -d \
  --network mongodb-network \
  --name mongo-express \
  -p 8081:8081 \
  -e ME_CONFIG_MONGODB_SERVER=mongodb \
  mongo-express

# 4. 浏览器访问 localhost:8081 登录管理
```

### Docker Compose 版本

```yaml
version: '3'
services:
  mongodb:
    image: mongo
    environment:
      MONGO_INITDB_ROOT_USERNAME: admin
      MONGO_INITDB_ROOT_PASSWORD: secret
    networks:
      - mongodb-network
  
  mongo-express:
    image: mongo-express
    depends_on:
      - mongodb
    environment:
      ME_CONFIG_MONGODB_SERVER: mongodb
    ports:
      - "8081:8081"
    networks:
      - mongodb-network

networks:
  mongodb-network:
    driver: bridge
```

---

## 安装资源

### 镜像站配置文档

> [!tip] 安装资源
> Docker 安装和镜像站配置教程：
> **GitHub**: [tech-shrimp/docker_installer](https://github.com/tech-shrimp/docker_installer)

---

## 相关页面

- [[docker-commands-reference]] — Docker 常用命令速查表
- [[container-basics]] — 容器化基础概念

---

> [!info] 来源
> - **视频**：Bilibili - 技术爬爬虾
> - **URL**：https://www.bilibili.com/video/BV1THKyzBER6
> - **作者**：技术爬爬虾
> - **类型**：实战教程
> - **价值**：⭐⭐⭐⭐⭐ 零基础入门的完整 Docker 教程

---

*文档创建于 2026-05-11*
*来源：Bilibili 视频字幕*
*类型：实战教程*
