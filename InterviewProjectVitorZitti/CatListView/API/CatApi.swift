//
//  CatApi.swift
//  InterviewProjectVitorZitti
//
//  Created by Vitor Zitti on 27/07/24.
//
import Foundation

protocol CatApiProtocol {
    func requestCats(limit: Int, skip: Int) async throws -> [CatData]
}

struct CatApi: CatApiProtocol {
    
    func requestCats(limit: Int, skip: Int) async throws -> [CatData] {
        if let url = URL(string: "https://cataas.com/api/cats?limit=\(limit)&skip=\(skip)") {
            let request = URLRequest(url: url)
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedData = try JSONDecoder().decode([CatData].self, from: data)
            return decodedData
        }
        return []
    }
}
