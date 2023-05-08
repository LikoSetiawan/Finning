//
//  AddBudgetModalView.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 06/05/23.
//

import SwiftUI

struct AddBudgetModalView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var segment: SegmentsViewModel
    
    @FocusState private var isInputActive: Bool
    @State var totalBudget : Int = 0
    @State var budgetCategory : String = ""
    @State var recomendationEnabled: Bool = false
    @Binding var ramdom:Bool
    
    
    var numberFormatter : NumberFormatter{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.zeroSymbol = ""
        return numberFormatter
    }
    
    
    
    var body: some View {
        NavigationStack {
                Form{
                    HStack{
                        Text("Kategori Budget")
                        TextField("Lain-lain", text: $budgetCategory)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack{
                        Text("Total")
                        Spacer()
                        TextField("Rp.0", value: $totalBudget, formatter: numberFormatter)
                            .multilineTextAlignment(.trailing)                .focused($isInputActive)
                            .keyboardType(.numberPad)
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Spacer()
                                    Button{
                                        isInputActive = false
                                        ramdom.toggle()
                                    }label: {
                                        Text("Done")
                                            .foregroundColor(Color("interactiveColor"))
                                    }
                                }
                            }
                    }
//                    HStack{
//                        Toggle(isOn: $recomendationEnabled) {
//                            Text("Rekomendasi")
//                        }
//                    }
            }
            .navigationBarTitle(Text("Budget"), displayMode: .inline)
            .navigationBarItems(leading:
                                    Button("Cancel") {
                dismiss()
                //                      showAddBudget = false
            }.foregroundColor(Color("interactiveColor")))
            
            .navigationBarItems(trailing:
                                    Button("Add") {
                print("add")
                segment.segments.append(Segment(id: UUID(), title: budgetCategory, value: totalBudget))
                segment.objectWillChange.send()
                ramdom.toggle()
            }.foregroundColor(Color("interactiveColor")))
            .background(Color("WhiteColor"))
        }
    }
}

struct AddBudgetModalView_Previews: PreviewProvider {
    static var previews: some View {
        AddBudgetModalView(segment: SegmentsViewModel(), ramdom: .constant(true))
    }
}
