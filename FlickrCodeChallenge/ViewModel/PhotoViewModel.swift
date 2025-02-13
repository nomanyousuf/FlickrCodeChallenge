//
//  PhotoViewModel.swift
//  FlickrCodeChallenge
//
//  Created by noman yousuf on 2/12/25.
//

import Foundation

@MainActor class PhotoViewModel: ObservableObject {
    @Published var photos: [PhotoModel] = []
    @Published var isLoading = false
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
        Task {
            await fetchDefaultPhotos()
        }
    }
    
    /// Searches for photos based on the search keyword
    /// - Parameter query: Search keyword entered by the user
    func searchPhotos(query: String) async {
        let urlString = URLBuilder.getImageFullURL(query: query)
        guard let url = URL(string: urlString) else { return }
        isLoading = true
        
        do {
            let response: APIResponse = try await networkManager.fetchPhotos(url: url)
            await MainActor.run {
                self.photos = response.items
                self.isLoading = false
            }
        } catch {
            await MainActor.run {
                self.photos = []
                self.isLoading = false
            }
        }
    }
    
    /// Fetches the default images
    func fetchDefaultPhotos() async {
        await searchPhotos(query: PhotoConstants.defaultQuery)
    }
}
