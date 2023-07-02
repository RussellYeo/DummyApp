import Dependencies
import PathMonitorClient
import Network

extension PathMonitorClient {
    public static var live: Self {
        let monitor = NWPathMonitor()
        
        return Self(
            setPathUpdateHandler: { callback in
                monitor.pathUpdateHandler = { path in
                    callback(NetworkPath(rawValue: path))
                }
            },
            start: monitor.start(queue:),
            cancel: monitor.cancel
        )
    }
}

extension PathMonitorClient: DependencyKey {
    public static var liveValue: PathMonitorClient = .live
}
