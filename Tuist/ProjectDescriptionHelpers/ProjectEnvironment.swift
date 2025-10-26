import ProjectDescription

public struct ProjectEnvironment: Sendable {
    public let name: String
    public let organizationName: String
    public let deploymentTargets: DeploymentTargets
    public let destination: Set<Destination>
    public let baseSetting: SettingsDictionary
    public let configurations: [Configuration]
}

public let env = ProjectEnvironment(
    name: "NewsHabit",
    organizationName: "com.jikoo.NewsHabit",
    deploymentTargets: .iOS("17.0"),
    destination: [.iPhone],
    baseSetting: SettingsDictionary()
        .marketingVersion("1.0.0")
        .currentProjectVersion("1")
        .otherLinkerFlags(["-ObjC"]),
        // .automaticCodeSigning(devTeam: "4U273YK6RX"),
    configurations: [.debug(name: .debug), .release(name: .release)]
)
