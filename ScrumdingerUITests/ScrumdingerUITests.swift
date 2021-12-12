//
//  ScrumdingerUITests.swift
//  ScrumdingerUITests
//
//  Created by Chris Brown on 30/10/2021.
//

import XCTest

class ScrumdingerUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
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

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
