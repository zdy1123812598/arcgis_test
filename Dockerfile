## Dockerfile
## 使用node做为镜像
#FROM node
## 在容器中创建该目录
#RUN mkdir -p /home/arcgis-test
## 设置容器的工作目录为该目录
#WORKDIR /home/arcgis-test
## 向外提供3000端口
#EXPOSE 3000
## 容器创建完成后执行的命令
#CMD npm install --registry=https://registry.npm.taobao.org && npm run dev
# 设置基础镜像
FROM nginx:latest

# 将dist文件中的内容复制到 /usr/share/nginx/html/ 这个目录下面
COPY dist/  /usr/share/nginx/html/

# 用本地的 default.conf 配置来替换nginx镜像里的默认配置
COPY default.conf /etc/nginx/conf.d/default.
