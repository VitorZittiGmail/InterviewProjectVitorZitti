//
//  CatDetailsViewModel.swift
//  InterviewProjectVitorZitti
//
//  Created by Vitor Zitti on 29/07/24.
//

import Foundation

@Observable class CatDetailsViewModel {
    var cat: CatData
    
    init(cat: CatData) {
        self.cat = cat
    }
}
