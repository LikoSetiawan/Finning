//
//  SetupBudgetView.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 09/04/23.
//

import SwiftUI

struct SetupBudgetView: View {
    
//    @ObservedObject var viewModel = SegmentsViewModel()
    @State private var isModalOpen = false
    @ObservedObject var vm = SetupBudgetViewModel()
    
    
//    @State private var segment1: Int = 0
    
    @State var isNextViewActive = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 15){
                Text("Masukkan Budget Kamu !")
                    .fontWeight(.bold)
                    .font(.system(size: 27))
                Text("Rp. \(vm.userIncome)")
                    .fontWeight(.bold)
                    .font(.system(size: 27))
                    .onAppear {
                        vm.fetchIncome()
                    }
            }
            .padding(.top, 65)
            Spacer()
                .frame(height: 25)
            
            //Table Listnya dibawah sini
            VStack(spacing : 15){
                
                Text("Food & Drink")
                    .fontWeight(.semibold)
                    .font(.system(size: 17))
                    .padding(.trailing, 225)
                TextField("", value : $vm.segments1, formatter: NumberFormatter())
                    .padding()
                    .textFieldStyle(OvalTextFieldStyle())
                
                Text("Tranportasi")
                    .fontWeight(.semibold)
                    .font(.system(size: 17))
                    .padding(.trailing, 240)
                TextField("", value : $vm.segments2, formatter: NumberFormatter())
                    .padding()
                    .textFieldStyle(OvalTextFieldStyle())
                
                Text("Hobby")
                    .fontWeight(.semibold)
                    .font(.system(size: 17))
                    .padding(.trailing, 280)
                TextField("", value : $vm.segments3, formatter: NumberFormatter())
                    .padding()
                    .textFieldStyle(OvalTextFieldStyle())
                
                Text("Kegiatan Kuliah")
                    .fontWeight(.semibold)
                    .font(.system(size: 17))
                    .padding(.trailing, 210)
                TextField("", value : $vm.segments4, formatter: NumberFormatter())
                    .padding()
                    .textFieldStyle(OvalTextFieldStyle())
                
            }
            
            Spacer()
                .frame(height: 20)
            Button(action: {
//                vm.saveSegment()
                vm.saveSegment1()
                vm.saveSegment2()
                vm.saveSegment3()
                vm.saveSegment4()
                isNextViewActive = true
            }) {
                Text("Continue")
                    .font(.headline)
                    .frame(width: 340, height: 50)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .background(Color("interactiveColor"))
                    .cornerRadius(15)
            }
            NavigationLink(destination: MainScreen().navigationBarBackButtonHidden(true), isActive: $isNextViewActive) {
                EmptyView()
                }
            }
        .frame(maxWidth:.infinity)
        .background(Color("WhiteColor")).ignoresSafeArea()


        }
    }


    



struct SetupBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        SetupBudgetView()
//        SetupBudgetView(viewModel: SegmentsViewModel())
    }
}



//            VStack{
//                List(vm.segments, id: \.title) { segment in
//                    Button(action: {
//                        self.isModalOpen = true
//                    }) {
//                        HStack {
//                            Text(segment.title)
//                            Spacer()
//                            Text("Rp. \(segment.value) -")
//                        }
//                    }
//                    .sheet(isPresented: $isModalOpen) {
//                        AddBudgetModalView(selectedSegment: $selectedSegment, ramdom: .constant(true))
//                    }
//                    .buttonStyle(CustomButtonStyle(isSelected: true))
//
//                }
//                .onAppear {
//                    vm.fetchIncome()
//                }
//            }
