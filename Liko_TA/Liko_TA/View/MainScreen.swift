//
//  MainScreen.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 16/04/23.
//

import SwiftUI

struct MainScreen: View {
    
    var data : [Int] = Array(1...20)
    let adaptiveColumns = [
        
        GridItem(.adaptive(minimum: 170))
    ]
    
    @State private var isModalOpen = false
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing : 20 ){
                    ZStack{
                        RoundedRectangle(cornerRadius:20)
                            .fill(.white)
                            .frame(width: 360, height: 125, alignment: .leading)
                        SisaUangCardView(income: 10000)
                    }
                    .padding(.top, 15)
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
                    
//                    LazyVGrid(columns: adaptiveColumns, spacing: 10) {
//                        ForEach($segments, id: \.self){ segment in
//                            Button(action: {
//                                isModalOpen.toggle()
//                            }
//                            ){
//                                ZStack{
//                                    CardView(segmentList: segment)
//                                }
//
//                            }
//                            .sheet(isPresented: $isModalOpen){
//                                AddExpenseMainView(random: .constant(true))
//
//                            }
//                            .buttonStyle(CustomButtonStyle(isSelected: true))
//                        }
//
//                    }
//                    .padding()
                    
                }
            }
            .navigationTitle("Summary")
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

struct CustomButtonStyle : ButtonStyle {
    var isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        
        
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
