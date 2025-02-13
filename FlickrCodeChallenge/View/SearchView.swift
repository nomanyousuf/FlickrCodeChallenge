//
//  SearchBarView.swift
//  FlickrCodeChallenge
//
//  Created by noman yousuf on 2/13/25.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    var onTextChange: (String) -> Void
    
    var body: some View {
        HStack {
            TextField(TextConstants.searchPlaceHolder, text: $searchText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color(.systemTeal))
                .cornerRadius(4)
                .overlay(
                    HStack {
                        Spacer()
                        if !searchText.isEmpty {
                            Button(action: {
                                searchText = ""
                                onTextChange("")
                            }) {
                                Image(systemName: AssetsName.searchIcon)
                                    .foregroundColor(.gray)
                            }
                            .padding(.trailing, 16)
                        }
                    }
                )
                .onChange(of: searchText) { newValue in
                    onTextChange(searchText)
                }
        }
        .padding(.horizontal)
        .padding(.top, 0)
        .padding(.bottom, 10)
    }
}
