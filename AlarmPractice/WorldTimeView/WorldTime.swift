//
//  WorldTime.swift
//  AlarmPractice
//
//  Created by Greed on 2023/06/04.
//

import SwiftUI

struct WorldTime: View {
    @Environment(\.editMode) var editMode
    @State private var showModal = false

    var body: some View {
        NavigationView{
            ZStack {
                List{
                    WorldTimeCardView()
                }
                .foregroundColor(.white)
            }//Zstack
            .listStyle(.plain)
            .navigationBarTitle("세계 시계" ,displayMode: .automatic)
            .navigationBarItems(leading: EditButton())
            .foregroundColor(Color.orange)
            .navigationBarItems(trailing: Button(action: {
                self.showModal = true
            }){
                Text("+")
            }
                .font(.largeTitle)
                .foregroundColor(Color.orange)
                .sheet(isPresented: self.$showModal) {
                    SelectCity()
                }
            )
        }//NavigationView
    }
}

struct WorldTime_Previews: PreviewProvider {
    static var previews: some View {
        WorldTime()
    }
}
