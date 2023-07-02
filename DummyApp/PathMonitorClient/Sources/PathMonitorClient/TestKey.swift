import Dependencies

extension DependencyValues {
    public var pathMonitorClient: PathMonitorClient {
        get { self[PathMonitorClient.self] }
        set { self[PathMonitorClient.self] = newValue }
    }
}

extension PathMonitorClient: TestDependencyKey {
    public static let testValue = Self(
        setPathUpdateHandler: unimplemented("\(Self.self).setPathUpdateHandler"),
        start: unimplemented("\(Self.self).start"),
        cancel: unimplemented("\(Self.self).cancel")
    )
}

