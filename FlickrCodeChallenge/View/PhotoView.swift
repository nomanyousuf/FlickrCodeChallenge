//
//  PhotoView.swift
//  FlickrCodeChallenge
//
//  Created by noman yousuf on 2/12/25.
//

import SwiftUI

struct PhotoView: View {
    @ObservedObject private var viewModel = PhotoViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                SearchBarView(searchText: $searchText) { newValue in
                    Task {
                        await viewModel.searchPhotos(query: newValue)
                    }
                }
                if viewModel.isLoading {
                    VStack {
                        Spacer()
                        ProgressView()
                            .scaleEffect(1.5)
                            .padding()
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                            ForEach(viewModel.photos,  id: \.self) { photo in
                                NavigationLink(destination: PhotoDetailView(photoDetailViewModel: PhotoDetailViewModel(photo: photo))) {
                                    AsyncImage(url: URL(string: photo.media["m"] ?? "")) { image in
                                        image.resizable().aspectRatio(contentMode: .fill)
                                    } placeholder: {
                                        Color.gray
                                    }
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(6)
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding(.top, 10)
            .background(Color(.systemGray5))
            .navigationTitle(TextConstants.homeScreentitle)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
