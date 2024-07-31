//
//  CatApiResponse.swift
//  InterviewProjectVitorZitti
//
//  Created by Vitor Zitti on 29/07/24.
//
import Foundation

struct CatData: Decodable, Identifiable, Equatable {
    let id = UUID()
    var catId: String
    var tags: [String]
    
    private enum CodingKeys: String, CodingKey {
        case catId = "_id"
        case tags
    }
    
    func getTagsAsHashtags() -> String {
        var returnValue = ""
        for tag in self.tags {
            returnValue += "#\(tag) "
        }
        return returnValue
    }
    
    func getCatImageUrl() -> String {
        return "https://cataas.com/cat/\(catId)"
    }
}
