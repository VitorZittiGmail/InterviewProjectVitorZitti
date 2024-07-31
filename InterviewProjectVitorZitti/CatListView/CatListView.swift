//
//  CatListView.swift
//  InterviewProjectVitorZitti
//
//  Created by Vitor Zitti on 27/07/24.
//

import SwiftUI

struct CatListView: View {
    
    @Bindable var model: CatListViewModel
    @State var selectedCat: CatData?
    @State var isPresenting = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.gray, .black],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                
                if model.showErrorMessage {
                    
                    Button("Failed to find the Cats \n Press to try again") {
                        Task {
                            await model.requestMoreCatsToShow()
                        }
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                } else if model.catsToShow == [] {
                    
                    ProgressView("Finding some cats...")
                        .font(.title)
                        .tint(.white)
                        .foregroundColor(.white)
                        .task {
                            await model.requestMoreCatsToShow()
                        }
                } else {
                    List {
                        ForEach(model.catsToShow) { cat in
                            
                            Text("Cat Id: \(cat.catId)")
                                .foregroundColor(.white)
                                .listRowBackground(Color.clear)
                                .listRowInsets(EdgeInsets())
                                .accessibilityAddTraits(.isHeader)
                            
                            NavigationLink(destination: CatDetailsView(model: CatDetailsViewModel(cat: cat))) {
                                ImageFromURL(model: ImageFromURLModel(url: cat.getCatImageUrl()))
                                    .listRowBackground(Color.clear)
                                    .task {
                                        let index = model.catsToShow.firstIndex(of: cat)
                                        if index == (model.catsToShow.count-1) {
                                            await model.requestMoreCatsToShow()
                                        }
                                    }
                                    .accessibility(identifier: "Cat photo")
                            }
                            .listRowBackground(Color.clear)
                            
                            Text(cat.getTagsAsHashtags())
                                .foregroundColor(.cyan)
                                .listRowBackground(Color.clear)
                                .listRowInsets(EdgeInsets())
                                .padding(.bottom, 50)
                        }
                    }
                    .refreshable {
                        URLCache.shared.removeAllCachedResponses()
                        model.ClearAllTheCats()
                        Task {
                            await model.requestMoreCatsToShow()
                        }
                    }
                    .listRowSeparator(.hidden)
                    .scrollIndicators(.hidden)
                    .scrollContentBackground(.hidden)
                    .padding(.top, 25)
                }
            }
            .ignoresSafeArea()
            .preferredColorScheme(.dark)
        }
        .tint(.white)
    }
}

#Preview {
    CatListView(model: CatListViewModel())
}
