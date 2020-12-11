import Foundation
import Capacitor

protocol Persistencing {
    func loadSession() -> String?
}

class PersistenceService: Persistencing {
    func loadSession() -> String? {
        "abc123"
    }
}

@objc(MyPlugin)
class MyPlugin: CAPPlugin {
    static var persistencing: Persistencing = PersistenceService()

    @objc func loadSession(_ call: CAPPluginCall) {
        let session = Self.persistencing.loadSession()
        call.resolve(["value": session as Any])
    }
}
