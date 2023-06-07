//
//  SelectCity.swift
//  AlarmPractice
//
//  Created by Greed on 2023/06/04.
//

import SwiftUI

struct SelectCity: View {
    @State var searchText = ""

    var body: some View {
        NavigationStack {
            VStack {
                SearchBar(text: $searchText)
                List(){
                    Section {
                        Text("가보르네, 보츠와나")
                        Text("가보르네, 보츠와나")
                        Text("가보르네, 보츠와나")
                        Text("가보르네, 보츠와나")
                        Text("가보르네, 보츠와나")
                        Text("가보르네, 보츠와나")
                        Text("가보르네, 보츠와나")
                    } header: {
                        Text("ㄱ")
                    }
                    
                }//List
                .listStyle(.plain)
                .navigationTitle("도시 선택")
                .navigationBarTitleDisplayMode(.inline)
            .foregroundColor(.white)
            }
        }
    }
}

struct SelectCity_Previews: PreviewProvider {
    static var previews: some View {
        SelectCity()
    }
}
