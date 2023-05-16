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
   
                    
                    
                    ZStack{
                            RoundedRectangle(cornerRadius:20)
                                .fill(.white)
                                .frame(width: 280, height: 90, alignment: .leading)
                        ReportCardView(totalexpenses: vm_mainscreen.updateExp)
                    }
                    .padding(.bottom, 15)
                    Divider()
                    
                    VStack(alignment: .leading){
                        Text("Detail Pengeluaran")
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
                    }
                }
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


