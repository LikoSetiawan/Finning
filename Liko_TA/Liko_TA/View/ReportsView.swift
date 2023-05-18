//
//  ReportsView.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 17/04/23.
//

import SwiftUI
import Charts


struct WineLog {
    var text : String
}


struct ReportsView: View {
    
    
    @ObservedObject var vm_mainscreen = MainScreenViewModel()
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    let months = Calendar.current.monthSymbols
    
    let text1 = WineLog(
        text: "Income"
        )
    
    let text2 = WineLog(
        text: "Expenses"
        )
    
    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 0
            formatter.locale = Locale(identifier: "en_US")
            return formatter
        }()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    HStack{
                        Spacer()
                        Picker("Select Month", selection: $vm_mainscreen.selectedMonthIndex) {
                            ForEach(0..<months.count) { index in
                                Text(months[index]).tag(index)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .onChange(of: vm_mainscreen.selectedMonthIndex) { newValue in
                            let selectedMonth = months[newValue]
                            vm_mainscreen.updateDataForMonth(selectedMonth)
                        }
                    }
                    .padding()
                    
                    Chart{
                        BarMark(x : .value("Income", text1.text),
                                y : .value("In Stock", vm_mainscreen.updateIncome)
                        )
                        .foregroundStyle(Color("GreenColor"))
                        
                        
                        BarMark(x : .value("Expenses", text2.text),
                                y : .value("In Stock", vm_mainscreen.updateExp))
                        .foregroundStyle(Color("RedColor"))
                        
                    }
                    .padding()
                    .frame(width: 380, height: 350)
   
                    
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius:20)
                                .fill(.white)
                                .frame(width: 180, height: 90, alignment: .leading)
                            VStack(spacing: 15){
                                Text("Total Income")
                                    .font(.system(size: 16))
                                Text("Rp. \(vm_mainscreen.topupinc) ,- ")
                                    .font(.system(size: 16))
                                    .fontWeight(.bold)
                                
                            }
                        }
                        .padding(.leading, 10)
                        Spacer()
                        ZStack{
                            RoundedRectangle(cornerRadius:20)
                                .fill(.white)
                                .frame(width: 180, height: 90, alignment: .leading)
                            VStack(spacing: 15){
                                Text("Total Expenses")
                                    .font(.system(size: 16))
                                Text("Rp. \(vm_mainscreen.updateExp) ,- ")
                                    .font(.system(size: 16))
                                    .fontWeight(.bold)
                                
                            }
                        }
                        .padding(.trailing, 10)
                    }
                    
                    .padding(.bottom, 15)
                    Divider()
                    
                    VStack(alignment: .leading){
                        Text("History")
                            .font(.system(size: 24)).bold()
                            .foregroundColor(.black)
                    }
                    .frame(width: 345, height: 10)
                    .padding(.top, 25)
                    .padding(.bottom, 25)
                    
                    
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(vm_mainscreen.expenses, id: \.id) { expenses in
                            HStack {
                                Text(expenses.expenses)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .padding(.leading, 10)
                                Spacer()
                                Text("- Rp.  " + String(expenses.expensesvalue))
                                    .font(.subheadline)
                                    .foregroundColor(Color("RedColor"))
                                    .padding(.trailing, 10)
                                
                            }
                            Divider()
                        }
                        
                        ForEach(vm_mainscreen.topups, id: \.id) { expenses in
                            HStack {
                                Text(expenses.topup)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .padding(.leading, 10)
                                Spacer()
                                Text("+ Rp.  " + String(expenses.topupvalue))
                                    .font(.subheadline)
                                    .foregroundColor(Color("GreenColor"))
                                    .padding(.trailing, 10)

                            }
                            Divider()
                        }

                    }
                }
                Button(action: {
                    authViewModel.logoutUser()
                }) {
                    Text("Logout")
                        .font(.headline)
                        .frame(width: 200, height: 50)
                        .foregroundColor(.white)
                        .background(Color("RedColor"))
                        .cornerRadius(10)
                }
                .padding(.bottom, 20)
                .padding(.top, 10)
            }
            .padding()
            .navigationTitle("Report ")
            .background(Color("WhiteColor").ignoresSafeArea())
//            .navigationBarItems(leading: BackButton())
        }
        
    }
}

struct ReportsView_Previews: PreviewProvider {
    static var previews: some View {
        ReportsView()
    }
}

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.left")
                    .font(.title)
                Text("Back")
                    .fontWeight(.semibold)
            }
            .foregroundColor(Color("interactiveColor"))
        }
    }
}


