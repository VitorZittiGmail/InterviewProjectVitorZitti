//
//  CatDataTests.swift
//  InterviewProjectVitorZittiTests
//
//  Created by Vitor Zitti on 29/07/24.
//

import XCTest
@testable import InterviewProjectVitorZitti

final class CatDataTests: XCTestCase {

    func testAllCatData() {
        let catId = "Id123"
        let catTags = ["cat","gato","catto","siamese"]
        let dataToTest = CatData(catId: catId, tags: catTags)
        XCTAssertEqual(dataToTest.catId, catId)
        XCTAssertEqual(dataToTest.tags, catTags)
        XCTAssertEqual(dataToTest.getTagsAsHashtags(), "#cat #gato #catto #siamese ")
    }
    
    func testUrl() {
        let catId = "Id123"
        let dataToTest = CatData(catId: catId, tags: [])
        XCTAssertEqual(dataToTest.getCatImageUrl(), "https://cataas.com/cat/\(catId)")
        
        let catId2 = "Test123"
        let dataToTest2 = CatData(catId: catId2, tags: [])
        XCTAssertEqual(dataToTest2.getCatImageUrl(), "https://cataas.com/cat/\(catId2)")
        
    }
}
