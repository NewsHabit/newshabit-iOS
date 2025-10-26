import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Module.domain.name,
    targets: [
        .target(
            for: .domain,
            product: .framework,
            dependencies: [
                .module(.diKit),
                .module(.shared)
            ]
        )
    ]
)
