//
//  TopUpIncomeView.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 17/05/23.
//

import SwiftUI


struct TopUpIncomeView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @FocusState private var isInputActive: Bool
    
    @Binding var random:Bool
    
    var numberFormatter : NumberFormatter{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.zeroSymbol = ""
        return numberFormatter
    }
    @ObservedObject var vm_topup = TopUpViewModel()
    
    @ObservedObject var viewmodel_mc = MainScreenViewModel()
    
    

    
    var body: some View {
        NavigationStack{
            VStack(){
                Text("Top Up Income")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(25)
                ZStack(){
                    RoundedRectangle(cornerRadius:20)
                        .fill(.white)
                        .frame(width: 360, height: 130, alignment: .leading)
                    SisaUangCardView(valueincome: viewmodel_mc.updateIncome)
                   
                    }
                
                Form{
                    HStack{
                        Text("Category")
                        Spacer()
                        
                        if vm_topup.topupC.contains("Lain - Lain") {
                            if vm_topup.topupK == "Lain - Lain" {
                                TextField("cth: OrangTua", text: $vm_topup.manualTopup, onCommit: {
                                    if !vm_topup.manualTopup.isEmpty {
                                        vm_topup.topupK = vm_topup.manualTopup
                                    }
                                    isInputActive = false
                                    random.toggle()
                                })
                                .multilineTextAlignment(.trailing)
                                .focused($isInputActive)
                            } else {
                                Picker("", selection: $vm_topup.topupK) {
                                    ForEach(vm_topup.topupC, id: \.self) { choice in
                                        Text(choice).tag(choice)
                                    }
                                }
                                .pickerStyle(.menu)
                            }
                        }
        
                    }
                
                    
                    HStack{
                        Text("Total")
                        Spacer()
                        TextField("Rp.0", value: $vm_topup.topupValue, formatter: numberFormatter)
                            .multilineTextAlignment(.trailing)
                            .focused($isInputActive)
                            .keyboardType(.numberPad)
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Spacer()
                                    Button("Done") {
                                        isInputActive = false
                                        
                                    }
                                }
                            }
                    }
                }
                .navigationBarTitle(Text("Topup Income"), displayMode: .inline)
                .navigationBarItems(leading:
                                        Button("Cancel") {
                    dismiss()
                }.foregroundColor(Color("interactiveColor")))
                
                .navigationBarItems(trailing:
                                        Button("Add") {
                    if vm_topup.topupK.isEmpty{
                        vm_topup.topupK = vm_topup.topupC.first ?? ""
                    }
                    vm_topup.saveTopup()
                    dismiss()
                    random.toggle()
                }.foregroundColor(Color("interactiveColor")))
            }
            .background(Color("WhiteColor").ignoresSafeArea())
            
        }
    }
}

struct TopUpIncomeView_Previews: PreviewProvider {
    static var previews: some View {
        TopUpIncomeView(random: .constant(true))
    }
}

