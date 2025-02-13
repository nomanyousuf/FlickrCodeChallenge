//
//  FlickrCodeChallengeTests.swift
//  FlickrCodeChallengeTests
//
//  Created by noman yousuf on 2/12/25.
//

import XCTest
@testable import FlickrCodeChallenge

@MainActor
class PhotoViewModelTests: XCTestCase {
    
    class MockNetworkManager: NetworkManagerProtocol {
        var shouldThrowError = false
        var mockResponse: APIResponse = APIResponse(items: [
            PhotoModel(title: "Test Photo", media: ["m": "https://api.flickr.com"], author: "Test Author", description: "Test Description", published: "2025-02-13")
        ])
        
        func fetchPhotos<T: Decodable>(url: URL) async throws -> T {
            if shouldThrowError {
                throw URLError(.badServerResponse)
            }
            return mockResponse as! T
        }
    }
    
    func testFetchPhotosSuccess() async {
        let mockNetworkManager = MockNetworkManager()
        let viewModel = PhotoViewModel(networkManager: mockNetworkManager)
        
        XCTAssertTrue(viewModel.photos.isEmpty, "Photos should initially be empty")
        
        await viewModel.searchPhotos(query: "test")
        
        XCTAssertFalse(viewModel.photos.isEmpty, "Photos should not be empty")
        XCTAssertEqual(viewModel.photos.first?.title, "Test Photo", "Photo title should match")
        XCTAssertEqual(viewModel.photos.first?.author, "Test Author", "Author should match")
    }
}
