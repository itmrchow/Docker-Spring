# Docker-Spring
## 參考
### https://spring.io/guides/gs/spring-boot-docker/

## 產出jar包並執行(windows)
1. 使用mvnw (Maven Wrapper Maven包裝器) 產出 jar包
    - mvn clean package依次執行了clean、resources、compile、testResources、testCompile、test、jar(打包)等７個階段
    - clean 會清除target目錄下的內容
```
./mvnw clean package
```

2. 執行jar包
```
java -jar target/SpringTest-0.0.1-SNAPSHOT.jar
```

3. 瀏覽器查看可否執行 http://localhost:8080/api/testStr/book

# 容器化 (Containerize)
## Docker File
### 指令參考:https://yeasy.gitbook.io/docker_practice/image/build
```Dockerfile
#FROM 參考的image
FROM adoptopenjdk/openjdk11:jdk-11.0.8_10-alpine
#VOLUME 建立一個可以從本地端或其他容器掛載的掛載點，一般用來存放資料庫和需要保存的資料等
VOLUME /tmp
#ARG 建構參數,只有在建構的時候存在
ARG JAVA_OPTS
#ENV 環境變數
ENV JAVA_OPTS=$JAVA_OPTS
ADD target/SpringTest-0.0.1-SNAPSHOT.jar dockerspring.jar
EXPOSE 8080
#執行點 可將CMD內容作為參數由ENTRYPOINT執行
ENTRYPOINT exec java $JAVA_OPTS -jar dockerspring.jar
```

## 建立image並執行
```
# -t name:tag
docker build -t docker-spring .
docker run --name myspring -p 8080:8080 docker-spring
```

## 進階 docker file
### 參考：https://spring.io/guides/topicals/spring-boot-docker