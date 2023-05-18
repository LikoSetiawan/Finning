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
    
    @State private var showAlert = false
    
    var numberFormatter : NumberFormatter{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.zeroSymbol = ""
        return numberFormatter
    }
    
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
                TextField("Rec:1.500.000", value : $vm.segments1, formatter: numberFormatter)
                    .padding()
                    .textFieldStyle(OvalTextFieldStyle())
                
                Text("Tranportasi")
                    .fontWeight(.semibold)
                    .font(.system(size: 17))
                    .padding(.trailing, 240)
                TextField("Rec:500.000", value : $vm.segments2, formatter: numberFormatter)
                    .padding()
                    .textFieldStyle(OvalTextFieldStyle())
                
                Text("Hobby")
                    .fontWeight(.semibold)
                    .font(.system(size: 17))
                    .padding(.trailing, 280)
                TextField("Rec:600.000", value : $vm.segments3, formatter: numberFormatter)
                    .padding()
                    .textFieldStyle(OvalTextFieldStyle())
                
                Text("Kegiatan Kuliah")
                    .fontWeight(.semibold)
                    .font(.system(size: 17))
                    .padding(.trailing, 210)
                TextField("Rec:900.000", value : $vm.segments4, formatter: numberFormatter)
                    .padding()
                    .textFieldStyle(OvalTextFieldStyle())
                
            }
            
            Spacer()
                .frame(height: 20)
            Button(action: {
                let totalSegments = vm.segments1 + vm.segments2 + vm.segments3 + vm.segments4
                if totalSegments == vm.userIncome {
                    vm.saveSegment(segmentS: vm.segments1 , title: "Food & Drink", percentage: 100, originalSegmentS: vm.segments1)
                    vm.saveSegment(segmentS: vm.segments2, title: "Transportation", percentage: 100, originalSegmentS: vm.segments2)
                    vm.saveSegment(segmentS: vm.segments3, title: "Hobby", percentage: 100, originalSegmentS: vm.segments3)
                    vm.saveSegment(segmentS: vm.segments4, title: "Colleague Needs", percentage: 100, originalSegmentS: vm.segments4)
                    isNextViewActive = true
                } else if totalSegments <= vm.userIncome{
                    showAlert = true
                }else{
                    showAlert = true
                }
            }) {
                Text("Continue")
                    .font(.headline)
                    .frame(width: 340, height: 50)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .background(Color("interactiveColor"))
                    .cornerRadius(15)
            }
            .alert(isPresented: $showAlert){
                Alert(
                    title: Text("Budget Berlebih"),
                    message: Text("Budget Melebihi Income!"),
                    dismissButton: .default(
                        Text("OK")
                            .foregroundColor(Color("interactiveColor"))
                    )
                )
                
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


//                vm.saveSegment(segmentS: vm.segments1 , title: "Food & Drink", percentage: 100, originalSegmentS: vm.segments1)
//                vm.saveSegment(segmentS: vm.segments2, title: "Transportation", percentage: 100, originalSegmentS: vm.segments2)
//                vm.saveSegment(segmentS: vm.segments3, title: "Hobby", percentage: 100, originalSegmentS: vm.segments3)
//                vm.saveSegment(segmentS: vm.segments4, title: "Colleague Needs", percentage: 100, originalSegmentS: vm.segments4)
//                isNextViewActive = true
