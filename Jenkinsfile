#!groovy

node {
    properties([
        parameters([
            gitTagVersionInput()
        ])
    ])

    runDefaultDockerPipeline currentBuild: currentBuild, imageName: "timoreymann/nginx-spa", tag: params.Version
}
