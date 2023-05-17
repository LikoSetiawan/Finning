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
    
    @State private var foodChoices = ["Makanan","Minuman","Makanan Ringan","Lain - Lain"]
    @State private var transChoices = ["Bensin", "Ojek Online", "Lain - Lain"]
    @State private var hobbyChoices = ["Kado Teman","Belanja Online","Kebutuhan Konten","Alat Olahraga", "Lain - Lain"]
    @State private var collegueChoices = ["Kepanitiaan", "Bahan Praktik", "Kostum", "Buku" ,"Lain - Lain"]
    
    @State private var manualEntry: Bool = false
    
//    @State private var manualInput: String = ""
    
    
    var pickerChoices: [String]{
        var choices: [String] = []
        
        if let selectedSegmentTitle = selectedSegment?.title {
            if selectedSegmentTitle == "Food & Drink" {
                choices = foodChoices
            } else if selectedSegmentTitle == "Transportation" {
                choices = transChoices
            } else if selectedSegmentTitle == "Hobby" {
                choices = hobbyChoices
            } else if selectedSegmentTitle == "Colleague Needs" {
                choices = collegueChoices
            }
        }
        
        if manualEntry {
            choices.append("Lain - Lain")
        }
        
        return choices
    }
    
    
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
                    if let percentage = selectedSegment?.percentage {
                        CardExpensesView(value: selectedSegment?.segmentS ?? 0, percentage: percentage)
                    }

                }
                Form{
                    HStack{
                        Text("Keterangan")
                        Spacer()
                        if pickerChoices.contains("Lain - Lain") {
                            if vm_expenses.keterangan == "Lain - Lain" {
                                TextField("cth: baju", text: $vm_expenses.manualInput, onCommit: {
                                    if !vm_expenses.manualInput.isEmpty {
                                        vm_expenses.keterangan = vm_expenses.manualInput
                                    }
                                    isInputActive = false
                                    random.toggle()
                                })
                                .multilineTextAlignment(.trailing)
                                .focused($isInputActive)
                            } else {
                                Picker("", selection: $vm_expenses.keterangan) {
                                    ForEach(pickerChoices, id: \.self) { choice in
                                        Text(choice).tag(choice)
                                    }
                                }
                                .pickerStyle(.menu)
                            }
                        }
                        else {
                            TextField("cth: baju", text: $vm_expenses.keterangan, onCommit: {
                                if vm_expenses.keterangan.isEmpty {
                                    vm_expenses.keterangan = ""
                                }
                                isInputActive = false
                                random.toggle()
                            })
                            .multilineTextAlignment(.trailing)
                            .focused($isInputActive)
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
//                                        random.toggle()
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
                    if manualEntry {
                        if vm_expenses.keterangan == "Lain - Lain" {
                            vm_expenses.keterangan = vm_expenses.manualInput
                        }
                    }else if vm_expenses.keterangan.isEmpty {
                        // Set the keterangan value to the first data of the array
                        vm_expenses.keterangan = pickerChoices.first ?? ""
                    }
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



