//
//  CatDetailsViewUITests.swift
//  InterviewProjectVitorZittiUITests
//
//  Created by Vitor Zitti on 29/07/24.
//

import XCTest

final class CatDetailsViewUITests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launchArguments = ["-UITestForDetailsView"]
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }
    
    func testListTexts() {
        XCTAssertNotNil(app.staticTexts["Cat Id: detailsTest"])
        XCTAssertNotNil(app.staticTexts["This is where the image descriptions would go, sadly this api does not have a description for the cats."])
        XCTAssertNotNil(app.staticTexts["#catto "])
    }
}
