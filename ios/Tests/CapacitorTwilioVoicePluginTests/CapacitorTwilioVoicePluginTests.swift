import XCTest
@testable import CapacitorTwilioVoicePlugin

class CapacitorTwilioVoiceTests: XCTestCase {
    func testEcho() {
        // This is an example of a functional test case for a plugin.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let implementation = CapacitorTwilioVoice()
        let value = "Hello, World!"
        let result = implementation.echo(value)

        XCTAssertEqual(value, result)
    }

    func testExplicitEarpiecePreferenceWinsWhileBluetoothIsAvailable() {
        let output = AudioOutputRouteSupport.resolvedOutput(
            preferredOutput: audioOutputEarpiece,
            availableOutputTypes: [audioOutputEarpiece, audioOutputSpeaker, audioOutputBluetooth],
            fallbackOutput: audioOutputBluetooth
        )

        XCTAssertEqual(audioOutputEarpiece, output)
    }

    func testRingingAppliesDefaultRouteWithoutExplicitPreference() {
        XCTAssertTrue(AudioOutputRouteSupport.shouldApplyDefaultRoute(preferredOutput: nil))
    }

    func testRingingPreservesExplicitRoutePreference() {
        XCTAssertFalse(
            AudioOutputRouteSupport.shouldApplyDefaultRoute(preferredOutput: audioOutputSpeaker)
        )
        XCTAssertFalse(
            AudioOutputRouteSupport.shouldApplyDefaultRoute(preferredOutput: audioOutputEarpiece)
        )
        XCTAssertFalse(
            AudioOutputRouteSupport.shouldApplyDefaultRoute(preferredOutput: audioOutputBluetooth)
        )
    }
}
