import Foundation

enum Endpoint {
    static var rootURL: URL {
        return URL(string: "https://www.sportical.app")!
    }

    static var pathConfigurationURL: URL {
        rootURL.appending(path: "configurations/ios.json")
    }
}
