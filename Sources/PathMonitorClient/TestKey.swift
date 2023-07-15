import Combine
import Dependencies

extension DependencyValues {
    public var pathMonitorClient: PathMonitorClient {
        get { self[PathMonitorClient.self] }
        set { self[PathMonitorClient.self] = newValue }
    }
}

extension PathMonitorClient: TestDependencyKey {
    public static let testValue = Self(
        networkPathPublisher: unimplemented("\(Self.self).networkPathPublisher")
    )
}

