//
//  CatDetailsViewModelTest.swift
//  InterviewProjectVitorZittiTests
//
//  Created by Vitor Zitti on 29/07/24.
//

import XCTest
@testable import InterviewProjectVitorZitti

final class CatDetailsViewModelTest: XCTestCase {

    var modelToTest: CatDetailsViewModel?
    
    func testSettingUp() async {
        let catId = "Id123"
        let catTags = ["cat","gato","catto","siamese"]
        let dataToTest = CatData(catId: catId, tags: catTags)
        modelToTest = CatDetailsViewModel(cat: dataToTest)

        XCTAssertEqual(modelToTest?.cat.catId, catId)
        XCTAssertEqual(modelToTest?.cat.tags, catTags)
        XCTAssertEqual(modelToTest?.cat.getTagsAsHashtags(), "#cat #gato #catto #siamese ")
    }
}
