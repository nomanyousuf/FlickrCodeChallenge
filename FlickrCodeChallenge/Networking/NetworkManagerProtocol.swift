//
//  NetworkManagerProtocol.swift
//  FlickrCodeChallenge
//
//  Created by noman yousuf on 2/12/25.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchPhotos<T: Decodable>(url: URL) async throws -> T
}
