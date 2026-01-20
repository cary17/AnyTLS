## 项目结构

```
.
├── .github/workflows/
│   └── build.yml
├── Dockerfile.server
├── Dockerfile.client
├── entrypoint-server.sh
├── entrypoint-client.sh
└── README.md
```

## 快速开始

### Server
```bash
docker run -d -p 8443:8443 -e PASSWORD=your_password ghcr.io/cary17/anytls-go:latest
```

### Client
```bash
docker run -d -p 1080:1080 -e SERVER_URI=anytls://password@host:port ghcr.io/cary17/anytls-go:latest-client
```

## 环境变量

**Server**: `LISTEN_ADDR` (默认 0.0.0.0:8443), `PASSWORD` (必填)  
**Client**: `LISTEN_ADDR` (默认 127.0.0.1:1080), `SERVER_URI` 或 `SERVER_ADDR`+`PASSWORD`
