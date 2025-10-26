import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Module.designKit.name,
    targets: [
        .target(
            for: .designKit,
            product: .framework,
            resources: .resources,
            dependencies: [
                .module(.shared),
                .SPM.SnapKit
            ]
        )
    ],
    resourceSynthesizers: [
        .custom(name: "Colors", parser: .assets, extensions: ["xcassets"]),
        .custom(name: "Images", parser: .assets, extensions: ["xcassets"]),
        .fonts()
    ]
)
