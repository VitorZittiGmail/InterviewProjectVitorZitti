//
//  CatListViewModelTests.swift
//  CatListViewModelTests
//
//  Created by Vitor Zitti on 27/07/24.
//

import XCTest
@testable import InterviewProjectVitorZitti

struct MockCatApi: CatApiProtocol {
    func requestCats(limit: Int, skip: Int) async throws -> [CatData] {
        
        return [CatData(catId: "idTest", tags: ["feline"]),
                CatData(catId: "idTest2", tags: ["gato"]),
                CatData(catId: "idTest3", tags: ["catto"])]
    }
}

class MockCatApiError: CatApiProtocol {
    var firstTry = true
    
    func requestCats(limit: Int, skip: Int) async throws -> [CatData] {
        if firstTry {
            firstTry = false
            throw NSError()
        }
        return []
    }
}

final class CatListViewModelTests: XCTestCase {

    var modelToTest: CatListViewModel?
    
    @MainActor
    func testGettingCats() async {
        modelToTest = CatListViewModel(catApiDelegate: MockCatApi())
        XCTAssertTrue(modelToTest?.catsToShow == [])
        await modelToTest?.requestMoreCatsToShow()
        XCTAssertTrue(modelToTest?.catsToShow.count == 3)
        XCTAssertTrue(modelToTest?.catsToShow[0].catId == "idTest")
        XCTAssertTrue(modelToTest?.catsToShow[1].tags == ["gato"])
    }
    
    @MainActor
    func testGettingErrorAndTryingAgain() async {
        modelToTest = CatListViewModel(catApiDelegate: MockCatApiError())
        XCTAssertFalse(modelToTest?.showErrorMessage ?? true)
        await modelToTest?.requestMoreCatsToShow()
        XCTAssertTrue(modelToTest?.showErrorMessage ?? false)
        await modelToTest?.requestMoreCatsToShow()
        XCTAssertFalse(modelToTest?.showErrorMessage ?? true)
    }
    
    @MainActor
    func testCleaningTheCats() {
        let catsToBeCleaned = [CatData(catId: "idTest", tags: []),
                               CatData(catId: "idTest2", tags: [])]
        
        modelToTest = CatListViewModel(catsToShow: catsToBeCleaned)
        XCTAssertTrue(modelToTest?.catsToShow.count == 2)
        modelToTest?.ClearAllTheCats()
        XCTAssertTrue(modelToTest?.catsToShow == [])
    }
}
