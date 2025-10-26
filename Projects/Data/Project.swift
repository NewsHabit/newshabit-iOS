import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Module.data.name,
    targets: [
        .target(
            for: .data,
            product: .framework,
            infoPlist: .file(path: "Support/Info.plist"),
            dependencies: [
                .module(.domain),
                .SPM.Alamofire
            ],
            settings: .settings(configurations: [
                .debug(name: "Debug", xcconfig: "Configurations/secrets.xcconfig"),
                .release(name: "Release", xcconfig: "Configurations/secrets.xcconfig")
            ])
        )
    ]
)
