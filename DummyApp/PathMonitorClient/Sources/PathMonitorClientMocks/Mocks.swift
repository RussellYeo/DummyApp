import Foundation
import PathMonitorClient
import Network

extension PathMonitorClient {
    public static let satisfied = Self(
        setPathUpdateHandler: { callback in
            callback(.init(status: .satisfied))
        },
        start: { _ in },
        cancel: {}
    )
    
    public static let unsatisfied = Self(
        setPathUpdateHandler: { callback in
            callback(.init(status: .unsatisfied))
        },
        start: { _ in },
        cancel: {}
    )
    
    public static let flakey = Self(
        setPathUpdateHandler: { callback in
            var status: NWPath.Status = .satisfied
            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) {  _ in
                callback(.init(status: status))
                status = (status == .satisfied) ? .unsatisfied : .satisfied
            }
        },
        start: { _ in },
        cancel: {}
    )
}
