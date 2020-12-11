import Capacitor
import XCTest

var didPass: Bool!

@objc(TestResult)
class TestResult: CAPPlugin {
    @objc func assert(_ call: CAPPluginCall) {
        didPass = call.getInt("value")! == 1
    }
}
