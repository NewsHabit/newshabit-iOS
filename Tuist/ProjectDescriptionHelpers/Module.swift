import ProjectDescription

public enum Module {
    case app
    case data
    case designKit
    case diKit
    case domain
    case presentation
    case shared
}

public extension Module {
    var name: String {
        switch self {
        case .app:          "App"
        case .data:         "Data"
        case .designKit:    "DesignKit"
        case .diKit:        "DIKit"
        case .domain:       "Domain"
        case .presentation: "Presentation"
        case .shared:       "Shared"
        }
    }
    
    var bundleId: String {
        switch self {
        case .app:  env.organizationName
        default:    env.organizationName + "." + name
        }
    }
    
    var path: Path {
        return .relativeToRoot("Projects/\(name)")
    }
}
