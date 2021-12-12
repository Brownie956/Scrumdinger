import XCTest

class ExampleScrumdingerUITests: XCTestCase {

    func testExampleUITest() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["scrum-design"].tap()
        
        app.buttons["Edit"].tap()
        app.textFields["new-attendee-text-field"].tap()
        
        let attendeeName = "James Frankoz"
        app.typeText(attendeeName)
        app.buttons["add-attendee"].tap()
        app.buttons["Done"].tap()

        let attendeeId = "attendee-\(attendeeName.lowercased().replacingOccurrences(of: " ", with: ""))"
        sleep(1)
        XCTAssert(app.staticTexts[attendeeId].isHittable)
    }
}
