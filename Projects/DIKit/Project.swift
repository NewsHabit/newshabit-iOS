import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Module.diKit.name,
    targets: [
        .target(
            for: .diKit,
            product: .framework
        )
    ]
)
