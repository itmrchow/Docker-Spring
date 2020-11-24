# Docker-Spring
## 參考
### https://spring.io/guides/gs/spring-boot-docker/

## 產出jar包並執行(windows)
1. 使用mvnw (Maven Wrapper Maven包裝器) 產出 jar包
```
./mvnw clean package
```

2. 執行jar包
```
java -jar target/SpringTest-0.0.1-SNAPSHOT.jar
```

3. 瀏覽器查看可否執行 http://localhost:8080/api/testStr/book