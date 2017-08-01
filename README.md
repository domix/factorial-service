# factorial-service

Very simple `"microservice"`, it can be deployed as Docker container


## Run

`./gradlew bootRun`


## Create Docker Image

`./gradlew buildImage`


## Docker Registry publication

By default it will be deployed to my own Docker Registry account `domix/factorial-service`

You can change the tag in the `build.gradle` if you want to deploy to a Registry, please see [Gradle Docker plugin](https://github.com/bmuschko/gradle-docker-plugin) documentation

### Docker Registry credential

You can set your own credential by adding them in the following file `~/.gradle/gradle.properties`

```
dockerRegistryUsername=your_user
dockerRegistryPassword=your_password
```

## Push Docker to Docker Registry

`./gradlew pushImage`