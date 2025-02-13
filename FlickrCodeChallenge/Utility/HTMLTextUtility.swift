//
//  HTMLTextUtility.swift
//  FlickrCodeChallenge
//
//  Created by noman yousuf on 2/12/25.
//
import Foundation

extension String {
    var convertHtmlToNSAttributedString: String {
        guard let data = data(using: .utf8) else { return self }
        do {
            let convertString = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            return convertString.string
        }
        catch {
            debugPrint(error.localizedDescription)
            return self
        }
    }
}
