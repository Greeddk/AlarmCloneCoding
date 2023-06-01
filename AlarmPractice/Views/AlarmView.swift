//
//  MyNavigationView.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/08.
//

import SwiftUI

struct AlarmView: View {
    @Environment(\.editMode) var editMode
    @State private var showModal = false
    @State private var editShowModal = false
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Alarm.date, ascending: true)]) var alarms: FetchedResults<Alarm>
    
    var body: some View {
        NavigationView{
            ZStack {
                List{
                    Section(header: listHeaderView() ){
                        listTextView()
                    }
                    .foregroundColor(Color.primary)
                    .font(.body)
                    
                    Section {
                        ForEach(alarms) { index in
                            Button {
                                editShowModal.toggle()
                            } label: {
                                AlarmCardView(alarm: index)
                            }
                            .sheet(isPresented: self.$editShowModal) {
                                EditModalView(alarm: index)
                            }
                        }
                        .onDelete {indexSet in
                            DataController.shared.deleteAlarmIndex(alarms: alarms, offsets: indexSet, context: managedObjectContext)
                        }
                    } header: {
                        if alarms.count > 0 {
                            Text("기타").fontWeight(.bold)
                        }
                    }
                }
                .foregroundColor(Color.white)
                .font(.body)
            }//Zstack
            //                .scrollContentBackground(.hidden)
            .listStyle(.plain)
            // iOS16부터 아래 명령어를 써야지 백 컬러 설정가능
            .navigationBarTitle("알람" ,displayMode: .automatic)
            //아래가 없으면 스프링 효과가 없음
            //            .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive)).animation(.spring())
            //editbutton custom
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
                    ModalView()
                }
            )
        }//NavigationView
    }
}


struct listHeaderView: View {
    var body: some View {
        HStack{
            Image(systemName: "bed.double.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 20)
            Text("수면 | 기상")
                .font(.body)
                .fontWeight(.bold)
        }
    }
}

struct listTextView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("알람 없음")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                Text("내일 아침")
                    .frame(alignment: .leadingFirstTextBaseline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Button {
                print("버튼 클릭!")
            } label: {
                Text("변경")
                    .foregroundColor(.orange)
                    .bold()
            }
            .padding(4)
            .padding(.horizontal, 4)
            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white).opacity(0.2))
        }
    }
}


struct AlarmView_Previews: PreviewProvider {
    let dataController = DataController.shared
    static var previews: some View {
        AlarmView()
    }
}
