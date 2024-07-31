//
//  CatDetailsView.swift
//  InterviewProjectVitorZitti
//
//  Created by Vitor Zitti on 29/07/24.
//

import SwiftUI

struct CatDetailsView: View {
    
    @Bindable var model: CatDetailsViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.gray, .black],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                List {
                    Text("Cat Id: \(model.cat.catId)")
                        .font(.title)
                        .foregroundColor(.white)
                        .listRowBackground(Color.clear)
                        .accessibilityAddTraits(.isHeader)
                    
                    ImageFromURL(model: ImageFromURLModel(url: model.cat.getCatImageUrl()))
                        .listRowBackground(Color.clear)
                    
                    Text("This is where the image descriptions would go, sadly this api does not have a description for the cats.")
                        .foregroundColor(.white)
                        .listRowBackground(Color.clear)
                    
                    Text(model.cat.getTagsAsHashtags())
                        .foregroundColor(.cyan)
                        .listRowBackground(Color.clear)
                }
                .padding(.top, 25)
            }
            .scrollContentBackground(.hidden)
            .scrollIndicators(.hidden)
            .ignoresSafeArea()
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    CatDetailsView(model: CatDetailsViewModel(cat: CatData(catId: "Cat Preview",
                                                           tags: ["cat",
                                                                  "preview"])))
}
