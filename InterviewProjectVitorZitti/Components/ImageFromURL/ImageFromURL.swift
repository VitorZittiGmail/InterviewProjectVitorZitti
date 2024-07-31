//
//  ImageFromURL.swift
//  InterviewProjectVitorZitti
//
//  Created by Vitor Zitti on 27/07/24.
//

import SwiftUI

struct ImageFromURL: View {
    
    @State var scale: CGFloat = 1
    @Bindable var model: ImageFromURLModel
    var aspectRatio: CGFloat = 5/4
    
    var body: some View {
        if (model.imageOfCat != nil) {
            if model.imageOfCat == UIImage() {
                HStack {
                    Spacer()
                    Button(model.errorMessage) {
                        Task {
                            await  model.downloadAndCachePhoto()
                        }
                    }
                    .font(.title)
                    .foregroundColor(model.textColor)
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width,
                        height: (UIScreen.main.bounds.width) * aspectRatio)
            } else {
                Image(uiImage: model.imageOfCat ?? UIImage())
                    .resizable()
                    .scaleEffect(scale)
                    .frame(width: UIScreen.main.bounds.width,
                           height: (UIScreen.main.bounds.width) * aspectRatio)
            }
        } else {
            HStack {
                Spacer()
                ProgressView(model.loadingDescription)
                    .font(.title)
                    .tint(model.textColor)
                    .foregroundColor(model.textColor)
                    .task {
                        await  model.downloadAndCachePhoto()
                    }
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width,
                   height: (UIScreen.main.bounds.width) * aspectRatio)
        }
    }
}

#Preview {
    ImageFromURL(model: ImageFromURLModel(url: "google.com"))
}
