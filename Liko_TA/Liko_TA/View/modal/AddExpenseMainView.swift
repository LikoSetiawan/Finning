//
//  AddExpenseMainView.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 16/04/23.
//

import SwiftUI

struct AddExpenseMainView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedSegment: Budget?
    
    @FocusState private var isInputActive: Bool
    
    @ObservedObject var vm_expenses = AddExpensesViewModel()
    
    
    
//    var title : String
    @Binding var random:Bool
    
    var numberFormatter : NumberFormatter{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.zeroSymbol = ""
        return numberFormatter
    }
    
    
    var body: some View {
        NavigationStack {
            VStack(){
                Text(selectedSegment?.title ?? "")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(25)
                ZStack(){
                    RoundedRectangle(cornerRadius:20)
                        .fill(.white)
                        .frame(width: 350, height: 150, alignment: .leading)
                    CardExpensesView(value: selectedSegment?.segmentS ?? 0)
                }
                Form{
                    HStack{
                        Text("Keterangan")
                        Spacer()
                        TextField("cth: baju", text: $vm_expenses.keterangan)
                            .multilineTextAlignment(.trailing)                .focused($isInputActive)
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Spacer()
                                    Button("Done") {
                                        isInputActive = false
                                        random.toggle()
                                    }
                                }
                            }
                    }
                    HStack{
                        Text("Total")
                        Spacer()
                        TextField("Rp.0", value: $vm_expenses.expensesValue, formatter: numberFormatter)
                            .multilineTextAlignment(.trailing)                .focused($isInputActive)
                            .keyboardType(.numberPad)
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Spacer()
                                    Button("Done") {
                                        isInputActive = false
                                        random.toggle()
                                    }
                                }
                            }
                    }
                }
                .navigationBarTitle(Text("Expenses"), displayMode: .inline)
                .navigationBarItems(leading:
                                        Button("Cancel") {
                    dismiss()
                }.foregroundColor(Color("interactiveColor")))
                
                .navigationBarItems(trailing:
                                        Button("Add") {
                    vm_expenses.saveExpenses()
                    if (selectedSegment != nil ){
                        vm_expenses.selectedSegment = selectedSegment
                    }
                    dismiss()
                    random.toggle()
                }.foregroundColor(Color("interactiveColor")))
            }
            .background(Color("WhiteColor").ignoresSafeArea())
        }
    }
}

struct AddExpenseMainView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseMainView(selectedSegment: .constant(nil), random: .constant(true))
    }
}
