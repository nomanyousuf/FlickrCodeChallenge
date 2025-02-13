//
//  PhotoModel.swift
//  FlickrCodeChallenge
//
//  Created by noman yousuf on 2/12/25.
//

import Foundation

struct PhotoModel: Codable, Hashable {
    let title: String
    let media: [String: String]
    let author: String
    let description: String
    let published: String
}

struct APIResponse: Codable {
    let items: [PhotoModel]
}
