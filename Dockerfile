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

