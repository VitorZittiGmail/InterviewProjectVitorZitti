//
//  CatListViewUITests.swift
//  InterviewProjectVitorZittiUITests
//
//  Created by Vitor Zitti on 29/07/24.
//

import XCTest
@testable import InterviewProjectVitorZitti

final class CatListViewUITests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["-UITestForListView"]
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }
    
    func testElementsExist() {
        XCTAssertNotNil(app.staticTexts["Cat Id: listTest"])
        XCTAssertNotNil(app.buttons["Cat photo"])
        XCTAssertNotNil(app.staticTexts["#feline "])
    }
    
    func testClickOnImageAndGoBack() {
        app.buttons["Cat photo"].tap()
        XCTAssertNotNil(app.staticTexts["This is where the image descriptions would go, sadly this api does not have a description for the cats."])
        app.buttons["Back"].tap()
        XCTAssertNotNil(app.buttons["Cat photo"])
    }
}
