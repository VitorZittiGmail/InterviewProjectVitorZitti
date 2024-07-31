//
//  CatListViewModel.swift
//  InterviewProjectVitorZitti
//
//  Created by Vitor Zitti on 27/07/24.
//

import Foundation

@MainActor
@Observable class CatListViewModel {
    
    var catsToShow: [CatData]
    var catApiDelegate: CatApiProtocol?
    var showErrorMessage = false
    var callingAPI = false
    
    init(catsToShow: [CatData] = [],
         catApiDelegate: CatApiProtocol? = CatApi()) {
        self.catsToShow = catsToShow
        self.catApiDelegate = catApiDelegate
    }
    
    func ClearAllTheCats() {
        catsToShow = []
    }
    
    func requestMoreCatsToShow() async {
        do {
            showErrorMessage = false
            let newCatsToShow = try await catApiDelegate?.requestCats(limit: 10, skip: catsToShow.count) ?? []
            catsToShow += newCatsToShow
        } catch {
            showErrorMessage = true
        }
    }
}
