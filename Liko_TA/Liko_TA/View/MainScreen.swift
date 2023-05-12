//
//  MainScreen.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 16/04/23.
//

import SwiftUI

struct MainScreen: View {
    
    var data : [Int] = Array(1...4)
    var title = ["Food&Beverage", "Transportation", "Hobby", "College Activity"]
    let adaptiveColumns = [
        
        
        GridItem(.adaptive(minimum: 170))
    ]
    
    @State private var isModalOpen = false
//    @Binding var segments : [Segment]
    @State private var reportsButtonText = "See Reports"
    
    @ObservedObject var vm_mainscreen = MainScreenViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("Summary")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 20)
//                        .padding(.top, 40)
                    
                    Button(action: {
                        // Code to be executed when the button is tapped
                    }) {
                        NavigationLink(destination: ReportsView()) {
                            Text(reportsButtonText)
                                .fontWeight(.heavy)
                                .padding(.trailing, 35)
                                .foregroundColor(Color("interactiveColor"))
                        }
//                        .navigationBarBackButtonHidden(true)
//                        .navigationBarItems(leading: BackButton())
                        
                    }
                }
                .padding(.leading, 20)
                .padding(.top, 40)
                ScrollView{
                    VStack(spacing : 10 ){
                        ZStack{
                            RoundedRectangle(cornerRadius:20)
                                .fill(.white)
                                .frame(width: 360, height: 125, alignment: .leading)
                            SisaUangCardView(valueincome: vm_mainscreen.updateIncome)
                        }
                        .padding(.top, 15)
                        .onAppear{
                            vm_mainscreen.observeIncome()
                        }
                        ZStack{
                            RoundedRectangle(cornerRadius:20)
                                .fill(.white)
                                .frame(width: 360, height: 80, alignment: .leading)
                            RecommendationCardView()
                        }
                        VStack(){
                            Text("Budget")
                                .font(.system(size: 24)).bold()
                                .foregroundColor(.black)
                            
                        }
                        .frame(width: 345, height: 10, alignment: .leading)
                        .padding(.top, 10)
  
                        LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                            ForEach(vm_mainscreen.segment, id: \.id) { segment in
                                Button(action: {
                                    isModalOpen.toggle()
                                }
                                ){
                                    ZStack{
                                        CardView(value: segment.segmentS, title: "")
                                    }

                                }
                                .sheet(isPresented: $isModalOpen) {
                                    AddExpenseMainView(random: .constant(true))
                                }
                                .buttonStyle(CustomButtonStyle(isSelected: true))
                            }
                        }
                        .onAppear{
                            vm_mainscreen.fetchSegment()
                        }
                        .padding()
                        
                        
                    }
                }
            }
//            .navigationTitle("Summary")
//            .navigationBarItems(trailing:
//                NavigationLink(destination: ReportsView()){
//                    Text(reportsButtonText)
//                    .bold()
//                    .padding(20)
//                    .padding(.top, 100)
//                    .foregroundColor(Color("interactiveColor"))
//                }
//            )
            .background(Color("WhiteColor").ignoresSafeArea())
            
            
        }
//        .onAppear{
//            if isFirstLaunch {
//                isShowOnBoarding.toggle()
//                isFirstLaunch = false
//            }
//        }
//        .fullScreenCover(isPresented: $isShowOnBoarding) {
//            OnboardingView(isShowOnBoarding: $isShowOnBoarding, segments: $segments)
//        }
    }
    
}

struct CustomButtonStyle: ButtonStyle {
    var isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.label
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
//        MainScreen(segments: .constant([Segment]()))
    }
}

//struct BackButton: View {
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//
//    var body: some View {
//        Button(action: {
//            self.presentationMode.wrappedValue.dismiss()
//        }) {
//            HStack {
//                Image(systemName: "arrow.left")
//                    .font(.title)
//                Text("Back")
//                    .fontWeight(.semibold)
//            }
//            .foregroundColor(Color("interactiveColor"))
//        }
//    }
//}
