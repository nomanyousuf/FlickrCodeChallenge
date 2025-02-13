//
//  NetworkManager.swift
//  FlickrCodeChallenge
//
//  Created by noman yousuf on 2/12/25.
//

import Foundation

class NetworkManager: NetworkManagerProtocol {
    func fetchPhotos<T: Decodable>(url: URL) async throws -> T {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw error
        }
    }
}
