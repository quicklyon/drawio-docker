<!-- 这里是镜像的【版本升级】信息，通过命令维护，详情参考：https://github.com/quicklyon/template-toolkit -->
drawio 没有持久化存储，也没有数据库的依赖，因此升级非常简单，直接更换版本号即可：

> 修改 docker-compose.yml 文件

```diff
...
  drawio:
-    image: easysoft/drawio:20.2.6-20220829
+    image: easysoft/drawio:20.2.7-20220902
    container_name: drawio
...
```

更新服务

```bash
# 是用新版本镜像更新服务
docker-compose up -d

# 查看服务状态和镜像版本
docker-compose ps
```
