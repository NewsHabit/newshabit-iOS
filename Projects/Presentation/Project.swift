import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Module.presentation.name,
    targets: [
        .target(
            for: .presentation,
            product: .staticFramework,
            dependencies: [
                .module(.designKit),
                .module(.domain)
            ]
        )
    ]
)
