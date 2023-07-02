import Dependencies
import Dispatch
import Network

public struct PathMonitorClient {
    public var setPathUpdateHandler: (@escaping (NetworkPath) -> Void) -> Void
    public var start: (DispatchQueue) -> Void
    public var cancel: () -> Void
    
    public init(
        setPathUpdateHandler: @escaping (@escaping (NetworkPath) -> Void) -> Void,
        start: @escaping (DispatchQueue) -> Void,
        cancel: @escaping () -> Void
    ) {
        self.setPathUpdateHandler = setPathUpdateHandler
        self.start = start
        self.cancel = cancel
    }
}

public struct NetworkPath {
    public var status: NWPath.Status
    
    public init(status: NWPath.Status) {
        self.status = status
    }
}

public extension NetworkPath {
    init(rawValue: NWPath) {
        self.status = rawValue.status
    }
}
