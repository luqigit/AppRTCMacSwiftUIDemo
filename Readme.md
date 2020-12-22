# apprtc mac demo for mac os 
使用 swiftui 实现 apprtc demo for mac os 
基于 mac os x 平台

## 使用说明
  1. [自己下载](https://github.com/siuying/WebRTC_Universal/releases) 支持 x64 的 webrtc.framework 或者 [自己编译](https://github.com/siuying/WebRTC_Universal)
  2. 可以修改config中的服务器地址

## 自己假设服务器
  使用 WebRTC-Docker (https://github.com/Piasy/WebRTC-Docker)
```
    docker run --rm \
    -p 8080:8080 -p 8089:8089 -p 3478:3478 -p 3478:3478/udp -p 3033:3033 \
    -p 64152-64999:64152-64999/udp \
    -e PUBLIC_IP=127.0.0.1 \
    --ulimit nofile=5000:5000 \
    -it piasy/apprtc-server
```

## 已知问题
  1. 基于mac平台X64 webrtc.framework 视频部分会崩溃 去掉视频功能 可以防止崩溃
    在 WebRTCClient.swift 文件 createMediaSenders 注释掉 视频相关代码
 
 ## TODO
- [x] 控制 音频发送 和 视频发送
- [ ] 添加 滤镜