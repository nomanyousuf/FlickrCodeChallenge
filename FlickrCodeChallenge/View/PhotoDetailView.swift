//
//  PhotoDetailView.swift
//  FlickrCodeChallenge
//
//  Created by noman yousuf on 2/12/25.
//

import SwiftUI

struct PhotoDetailView: View {
    let photoDetailViewModel: PhotoDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack() {
                AsyncImage(url: URL(string: photoDetailViewModel.photo.media["m"] ?? "")) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity, maxHeight: 280)
                .clipped()
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(photoDetailViewModel.photo.title)
                        .font(.headline)
                        .padding(.leading)
                        .padding(.top, 10)
                    
                    Text(photoDetailViewModel.photo.description.convertHtmlToNSAttributedString)
                        .font(.body)
                        .padding(.leading)
                        .padding(.top, 10)
                    
                    Text("\(TextConstants.auther): \(photoDetailViewModel.photo.author)")
                        .font(.subheadline)
                        .padding(.leading)
                    
                    Text("\(TextConstants.published): \(photoDetailViewModel.photo.published)")
                        .font(.footnote)
                        .padding(.leading)
                }
                .padding(.horizontal)
            }
            .padding(.top, 10)
            .padding(.bottom, 10)
            .border(Color(.systemTeal))
        }
        .background(Color(.systemGray5))
    }
}

