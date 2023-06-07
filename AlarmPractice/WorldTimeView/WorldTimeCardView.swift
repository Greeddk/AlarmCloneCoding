//
//  WorldTimeCardView.swift
//  AlarmPractice
//
//  Created by Greed on 2023/06/04.
//

import SwiftUI

struct WorldTimeCardView: View {
    
    let timeFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm"
        return formatter
    }()
    
    let meridiemFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "a"
        return formatter
    }()
    
    var body: some View {
        HStack(alignment: .center, spacing: -2.0){
            VStack(alignment: .leading){
                HStack{
                    Text("오늘, +0시간")
                        .foregroundColor(.gray)
                }
                
                HStack(spacing: 0) {
                    Text("서울")
                        .font(.title)
                }
            }
            Spacer()
            HStack(alignment: .firstTextBaseline, spacing: -2){
                Text("\(Date(), formatter: self.meridiemFormat)")
                    .font(.system(size: 30))
                
                Text("\(Date(), formatter: self.timeFormat)")
                    .font(.system(size: 50))
                    .fontWeight(.light)
            }
        }
    }
}

struct WorldTimeCardView_Previews: PreviewProvider {
    static var previews: some View {
        WorldTimeCardView()
    }
}
