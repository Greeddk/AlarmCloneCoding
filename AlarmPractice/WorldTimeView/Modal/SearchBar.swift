//
//  SearchBar.swift
//  AlarmPractice
//
//  Created by Greed on 2023/06/07.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Environment(\.dismiss) var dismiss
     
        var body: some View {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
     
                    TextField("Search", text: $text)
                        .foregroundColor(.primary)
     
                    if !text.isEmpty {
                        Button(action: {
                            self.text = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width : 15)
                        }
                    } else {
                        EmptyView()
                    }
                }
                .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)
                
                Button {
                    dismiss()
                } label: {
                    Text("취소")
                        .foregroundColor(.orange)
                }
            }
            .padding(.horizontal)
        }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
