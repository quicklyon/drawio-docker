<!-- 该文档是模板生成，手动修改的内容会被覆盖，详情参见：https://github.com/quicklyon/template-toolkit -->
# QuickOn drawio 应用镜像

[![GitHub Workflow Status](https://github.com/quicklyon/drawio-docker/actions/workflows/docker.yml/badge.svg)](https://github.com/quicklyon/drawio/actions/workflows/docker.yml)
![Docker Pulls](https://img.shields.io/docker/pulls/easysoft/drawio?style=flat-square)
![Docker Image Size](https://img.shields.io/docker/image-size/easysoft/drawio?style=flat-square)
![GitHub tag](https://img.shields.io/github/v/tag/quicklyon/drawio-docker?style=flat-square)

> 申明: 该软件镜像是由QuickOn打包。在发行中提及的各自商标由各自的公司或个人所有，使用它们并不意味着任何从属关系。

## 快速参考

- 通过 [渠成软件百宝箱](https://www.qucheng.com/app-install/drawio-install-149.html) 一键安装 **drawio**
- [Dockerfile 源码](https://github.com/quicklyon/drawio-docker)
- [drawio 源码](https://github.com/jgraph/drawio)
- [drawio 官网](https://www.diagrams.net/)

## 一、关于 drawio

<!-- 这里写应用的【介绍信息】 -->
Drawio是使用HTML5和JavaScript开发的免费和开源的跨平台图形绘制软件。可用于创建各类图形，例如流程图，线框，UML图，组织图和网络图。同时也可以像跨浏览器的Web应用程序一样在线使用，也可以像Linux，macOS和Windows上的脱机桌面应用程序一样使用。

![screenshots](https://raw.githubusercontent.com/quicklyon/drawio-docker/master/.template/screenshot.png)

drawio官网：[https://www.diagrams.net/](https://www.diagrams.net/)

<!-- 这里写应用的【附加信息】 -->
### 1.1 特性

- 保护图表数据的安全
draw.io 应用程序不存储您的图表数据，我们专注安全第一的图表工具。

- 随心所欲的绘制图表
无需帐户 - 您的图表文件不需要账户的支持，支持在移动设备和触摸屏上轻松的绘制图表。

- 集成很多高级的工具

图表编辑器中内置了许多先进且有用的工具。

- 使用无限画布、标尺、可自定义的网格和定位指南来帮助您更快地绘制图表。
- 让自动布局为您格式化流程图和树形图。
- 使用图层和标签组织图表。 设置形状属性、元数据和占位符以添加翻译、工具提示、链接和交互操作。
- 使用手绘形状进行素描和评论。
- 在 draw.io Board 图表中使用手绘工具来标记图表或用鼠标绘制形状
- 创建您自己的自定义形状和自定义形状库。
- 使用 HTML 格式化文本并在标签中使用数学排版。
- 使用 PlantUML 或 Mermaid 代码、CSV 电子表格数据和格式信息或 SQL 代码生成图表文本。
- 自定义编辑器以设置特定调色板、自定义字体、模板、形状库等

## 二、支持的版本(Tag)

由于版本比较多,这里只列出最新的5个版本,更详细的版本列表请参考:[可用版本列表](https://hub.docker.com/r/easysoft/drawio/tags/)

<!-- 这里是镜像的【Tag】信息，通过命令维护，详情参考：https://github.com/quicklyon/template-toolkit -->
- [latest](https://github.com/jgraph/drawio/releases/tag/v20.4.0)
- [20.4.0-20221005](https://github.com/jgraph/drawio/releases/tag/v20.4.0)
- [20.3.6-20220927](https://github.com/jgraph/drawio/releases/tag/v20.3.6)
- [20.2.8-20220906](https://github.com/jgraph/drawio/releases/tag/v20.2.8)
- [20.2.6-20220829](https://github.com/jgraph/drawio/releases/tag/v20.2.6)

## 三、获取镜像

推荐从 [Docker Hub Registry](https://hub.docker.com/r/easysoft/drawio) 拉取我们构建好的官方Docker镜像。

```bash
docker pull easysoft/drawio:latest
```

如需使用指定的版本,可以拉取一个包含版本标签的镜像,在Docker Hub仓库中查看 [可用版本列表](https://hub.docker.com/r/easysoft/drawio/tags/)

```bash
docker pull easysoft/drawio:[TAG]
```

## 四、持久化数据

drawio 不需要持久化数据。

## 五、环境变量

<!-- 这里写应用的【环境变量信息】 -->
渠成已经将必要的环境变量设置了默认值，暂时不需要自定义环境变量。

## 六、运行

### 6.1 单机Docker-compose方式运行

```bash
# 启动服务
make run

# 查看服务状态
make ps

# 查看服务日志
docker-compose logs -f drawio

```

<!-- 这里写应用的【make命令的备注信息】位于文档最后端 -->
**说明:**

- 启动成功后，打开浏览器输入 `http://<你的IP>:8080` 访问
- [VERSION](https://github.com/quicklyon/drawio-docker/blob/master/VERSION) 文件中详细的定义了Makefile可以操作的版本
- [docker-compose.yml](https://github.com/quicklyon/drawio-docker/blob/master/docker-compose.yml)

## 七、版本升级

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