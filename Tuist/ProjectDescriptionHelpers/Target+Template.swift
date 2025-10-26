import ProjectDescription

public extension Target {
    static func target(
        for module: Module,
        product: Product,
        infoPlist: InfoPlist? = .default,
        resources: ResourceFileElements? = nil,
        entitlements: Entitlements? = nil,
        dependencies: [TargetDependency] = [],
        settings: Settings? = nil
    ) -> Self {
        return Self.target(
            name: module.name,
            destinations: env.destination,
            product: product,
            bundleId: module.bundleId,
            deploymentTargets: env.deploymentTargets,
            infoPlist: infoPlist,
            sources: .sources,
            resources: resources,
            entitlements: entitlements,
            dependencies: dependencies,
            settings: settings
        )
    }
}
