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
                        
                        Picker("", selection: $vm_topup.topupK){
                            ForEach(vm_topup.topupC, id: \.self){ item in
                                Text(item).tag(item)
                            }
                            
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()
                        .multilineTextAlignment(.trailing)
                        
                           
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

