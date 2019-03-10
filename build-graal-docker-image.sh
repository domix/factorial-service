./gradlew clean assemble
java -cp build/libs/factorial-service-0.0.6-all.jar io.micronaut.graal.reflect.GraalClassLoadingAnalyzer 

docker build . -t domix/factorial-service:0.0.6-graalvm