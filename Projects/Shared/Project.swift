import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Module.shared.name,
    targets: [
        .target(
            for: .shared,
            product: .framework
        )
    ]
)
