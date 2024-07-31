//
//  ImageFromURLModel.swift
//  InterviewProjectVitorZitti
//
//  Created by Vitor Zitti on 29/07/24.
//

import Foundation
import SwiftUI

@MainActor
@Observable class ImageFromURLModel {
    
    var url: URL?
    var loadingDescription: String
    var errorMessage: String
    var textColor: Color
    var imageOfCat: UIImage?
    
    init(url: String,
         loadingDescription: String = "Loading the Image",
         errorMessage: String = "The image failed to load \n Press to try again",
         textColor: Color = .white) {
        
        self.url = URL(string: url)
        self.loadingDescription = loadingDescription
        self.errorMessage = errorMessage
        self.textColor = textColor
    }
    
    func downloadAndCachePhoto() async {
        imageOfCat = nil
        if let url = self.url {
            do {
                if let cachedResponse = URLCache.shared.cachedResponse(for: .init(url: url)){
                    imageOfCat = UIImage(data: cachedResponse.data)
                } else {
                    let (data, response) = try await URLSession.shared.data(from: url)
                    URLCache.shared.storeCachedResponse(.init(response: response, data: data),
                                                        for: .init(url: url))
                    
                    guard let image = UIImage(data: data) else {
                        imageOfCat = UIImage()
                        return
                    }
                    imageOfCat = image
                }
            } catch {
                imageOfCat = UIImage()
            }
        }
    }
}
