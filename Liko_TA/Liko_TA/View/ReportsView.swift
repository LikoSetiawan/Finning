//
//  ReportsView.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 17/04/23.
//

import SwiftUI
import Charts


struct WineLog {
    let id =  UUID()
    var variety : String
    var quantity : Int
    var country : String
    var entrydate : Date
}
    
func date(year : Int, month : Int, day : Int) -> Date{
    Calendar.current.date(from: .init(year: year, month: month, day: day)) ?? Date()
}
    
    

struct ReportsView: View {
    
    @State private var selectedID : UUID = UUID()
    
    let wine1 = WineLog(
        variety: "Cardonay",
        quantity: 150,
        country: "Canada",
        entrydate: date(year: 2022, month: 7 , day: 23))
    
    let wine2 = WineLog(
        variety: "Orang Tua",
        quantity: 25,
        country: "Indonesia",
        entrydate: date(year: 2022, month: 7 , day: 22))
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Chart{
                        BarMark(x : .value("Country", wine1.country),
                                y : .value("In Stock", wine1.quantity))
                        BarMark(x : .value("Country", wine2.country),
                                y : .value("In Stock", wine2.quantity))
                        
                    }
                    .padding()
                    .frame(width: 380, height: 350)
                    
                    ZStack{
                            RoundedRectangle(cornerRadius:20)
                                .fill(.white)
                                .frame(width: 280, height: 90, alignment: .leading)
                            ReportCardView()
                    }
                    .padding(.bottom, 15)
                    Divider()
                    
                    VStack(){
                        Text("Detail Pengeluaran")
                            .font(.system(size: 24)).bold()
                            .foregroundColor(.black)
                    }
                    .frame(width: 345, height: 10, alignment: .leading)
                    .padding(.top, 25)
                    Divider()

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
