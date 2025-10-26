import ProjectDescription
import ProjectDescriptionHelpers

private let settings = Settings.settings(
    base: env.baseSetting,
    configurations: env.configurations,
    defaultSettings: .recommended
)

let project = Project(
    name: Module.app.name,
    organizationName: env.organizationName,
    packages: [
        .SPM.Alamofire,
        .SPM.FirebaseMessaging,
        .SPM.SnapKit
    ],
    settings: settings,
    targets: [
        .target(
            for: .app,
            product: .app,
            infoPlist: .file(path: "Support/Info.plist"),
            resources: .resources,
//            entitlements: .file(path: .path("App.entitlements")),
            dependencies: [
                .module(.data),
                .module(.presentation),
                .SPM.FirebaseMessaging
            ],
            settings: .settings(base: env.baseSetting)
        )
    ]
)
