import XCTest
@testable import App
import Capacitor

class AppTests: XCTestCase {
    var mockPersistenceService: MockPersistenceService!
    var bridge: CAPBridge!

    override func setUp() {
        mockPersistenceService = MockPersistenceService()
        MyPlugin.persistencing = mockPersistenceService
        bridge = (UIApplication.shared.delegate as! AppDelegate).bridge
    }

    // This is going to test that the web code handles the session correctly.
    // It means the SUT is the web's session handler.
    func testWebLogsUserInWhenSessionExists() {
        mockPersistenceService.session = "existing session"
        triggerTest()

        let exp = expectation(description: #function)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssert(didPass)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 3)
    }

    private func triggerTest() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // Need to wait until JS ready to receive event.
            self.bridge.triggerWindowJSEvent(eventName: "fixme", data: "{\"value\":123}")
        }
    }
}


// Should JS setup the mocks? If possible, then we could maybe have a single iOS test function
// that calls out to a suite of JS tests.

// Mabye we write a test plugin that handles the assertion. 
