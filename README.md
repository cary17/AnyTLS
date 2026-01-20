# ANyTLS Docker

基于官方 [anytls-go](https://github.com/anytls/anytls-go) 的 Docker 镜像，支持多架构、多变体自动构建。


## 快速开始

### Server
```bash
docker run -d -p 8443:8443 -e PASSWORD=your_password ghcr.io/cary17/anytls-go:latest
```

### Client
```bash
docker run -d -p 1080:1080 -e SERVER_URI=anytls://password@host:port ghcr.io/cary17/anytls-go:latest-client
```


## Docker Compose 示例

### Server
```bash
version: '3.8'

services:
  anytls-server:
    image: ghcr.io/cary17/anytls-go:latest
    container_name: anytls-server
    restart: always
    network_mode: host
    environment:
      # 必填：服务器密码，请修改为你的密码
      - PASSWORD=your_secure_password_here
      
      # 可选：自定义监听地址和端口（默认: 0.0.0.0:8443）
      # - LISTEN_ADDR=0.0.0.0:9443  # 修改端口示例
      # - LISTEN_ADDR=192.168.1.100:8443  # 绑定特定IP
```

### Client
```bash
version: '3.8'

services:
  anytls-client:
    image: ghcr.io/cary17/anytls-go:latest-client
    container_name: anytls-client
    restart: always
    network_mode: host
    environment:
      # 方式1：使用SERVER_URI（v0.0.12 版本起推荐），请修改服务器地址端口和密码
      - SERVER_URI=anytls://your_password@your-server-ip:8443
      
      # 方式2：分别指定SERVER_ADDR和PASSWORD（如果需要）
      # - SERVER_ADDR=your-server-ip:8443
      # - PASSWORD=your_password
      
      # 可选：自定义本地监听地址（默认: 127.0.0.1:1080）
      # - LISTEN_ADDR=0.0.0.0:1080    # 允许外部访问
      # - LISTEN_ADDR=127.0.0.1:2080  # 修改端口
```


## 环境变量

**Server**: `LISTEN_ADDR` (默认 0.0.0.0:8443), `PASSWORD` (必填)  
**Client**: `LISTEN_ADDR` (默认 127.0.0.1:1080), `SERVER_URI` 或 `SERVER_ADDR`+`PASSWORD`

## 镜像仓库

### GHCR
```bash
ghcr.io/cary17/anytls-go:latest
ghcr.io/cary17/anytls-go:latest-client
```

### Docker Hub
```bash
cary17/anytls-go:latest
cary17/anytls-go:latest-client
```
