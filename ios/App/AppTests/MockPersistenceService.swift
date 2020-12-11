import Foundation
@testable import App

class MockPersistenceService: Persistencing {
    var session: String?

    func loadSession() -> String? {
        session
    }
}

