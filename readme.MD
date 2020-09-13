> 以容器的方式运行 jizhang 项目需要的依赖

添加 .env 文件，内容示例如下：

```shell
JIZHANG_DB_PASSWORD=root // mysql password
JIZHANG_SERVER_SIDE_PORT=44444 // expose server-side app to client developer
```

运行：

```shell
bash start
```