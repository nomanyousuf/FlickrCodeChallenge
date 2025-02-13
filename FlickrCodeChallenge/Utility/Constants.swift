//
//  Constants.swift
//  FlickrCodeChallenge
//
//  Created by noman yousuf on 2/12/25.
//

import Foundation

struct PhotoConstants {
    static let baseURL = "https://api.flickr.com"
    static let endPoint = "/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags="
    static let defaultQuery = "porcupine"
}

struct AssetsName {
    static let searchIcon = "xmark.circle.fill"
}

struct TextConstants {
    static let searchPlaceHolder = "Search Photo.."
    static let homeScreentitle = "Photo Gallery"
    static let auther = "Author"
    static let published = "Published"
}
