//
//  URLBuilder.swift
//  FlickrCodeChallenge
//
//  Created by noman yousuf on 2/12/25.
//

import Foundation

struct URLBuilder {
    static func getImageFullURL(query: String) -> String {
        let baseURL = PhotoConstants.baseURL
        let endPoint = PhotoConstants.endPoint
        return "\(baseURL)\(endPoint)\(query)"
    }
}
