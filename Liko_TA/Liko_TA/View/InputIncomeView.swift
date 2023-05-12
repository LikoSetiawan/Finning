//
//  InputIncomeView.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 08/04/23.
//

import Foundation
import SwiftUI

struct InputIncomeView: View {
    
    @StateObject
    var viewModel = WriteViewModel()
    
    @State var isNextViewActive = false
    
    @State var income : Int = 0

    var body: some View {
            NavigationStack{
                VStack{
                    Text("Income")
                        .fontWeight(.bold)
                        .font(.system(size: 31))
                    Text("Masukin penghasilan kamu di sini!")
                        .fontWeight(.regular)
                        .font(.system(size: 18))
                        .frame(height: 70, alignment:.topLeading)
                }
                .padding(.top, 55)
                Spacer()
                    .frame(height: 1)
                TextField("cth: 2,000,000", value: $viewModel.income, formatter: viewModel.numberFormatter )
                    .padding()
                    .textFieldStyle(OvalTextFieldStyle())
                    .keyboardType(.decimalPad)
                Spacer()
                Button(action: {
                    viewModel.saveData()
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
                NavigationLink(destination: SetupBudgetView().navigationBarBackButtonHidden(true), isActive: $isNextViewActive) {
                    EmptyView()
                            }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        
    }
}

struct InputIncomeView_Previews: PreviewProvider {
    static var previews: some View {
        InputIncomeView()
    }
}
