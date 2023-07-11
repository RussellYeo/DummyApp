import Combine
import Dependencies
import PathMonitorClient
import Network

extension PathMonitorClient {
    public static func live(queue: DispatchQueue) -> Self {
        let monitor = NWPathMonitor()
        let subject = PassthroughSubject<NWPath, Never>()
        monitor.pathUpdateHandler = subject.send
        monitor.start(queue: queue)
        
        return Self(
            networkPathPublisher: subject
                .handleEvents(
                    receiveSubscription: { _ in monitor.start(queue: queue) },
                    receiveCancel: monitor.cancel
                )
                .map(NetworkPath.init)
                .eraseToAnyPublisher()
        )
    }
}

extension PathMonitorClient: DependencyKey {
    public static var liveValue: PathMonitorClient = .live(queue: .main)
}
