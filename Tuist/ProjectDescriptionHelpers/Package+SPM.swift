import ProjectDescription

// 프로젝트 레벨에서 SPM 패키지를 선언
public extension Package {
    struct SPM {}
}

public extension Package.SPM {
    static let Alamofire = Package.remote(
        url: "https://github.com/Alamofire/Alamofire.git",
        requirement: .upToNextMajor(from: "5.10.0")
    )
    
    static let FirebaseMessaging = Package.remote(
        url: "https://github.com/firebase/firebase-ios-sdk.git",
        requirement: .upToNextMajor(from: "11.0.0")
    )
    
    static let SnapKit = Package.remote(
        url: "https://github.com/SnapKit/SnapKit.git",
        requirement: .upToNextMajor(from: "5.0.1")
    )
}
