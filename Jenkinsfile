#!groovy

node {
    properties([
        parameters([
            gitTagVersionInput()
        ])
    ])

    runDefaultDockerPipeline currentBuild: currentBuild, imageName: "timoreymann/nginx-spa", version: params.Version
}

