//
//  AddCreditBudgetView.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 18/05/23.
//

import SwiftUI

struct AddCreditBudgetView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var editSegment: Budget?
    
    @Binding var random:Bool
    @FocusState private var isInputActive: Bool
    
    @ObservedObject var viemodelMC = MainScreenViewModel()
    
    @State private var selectedPicker = ""
    
    @ObservedObject var viewmodelAC = AddCreditViewModel()
    
    var numberFormatter : NumberFormatter{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.zeroSymbol = ""
        return numberFormatter
    }
    
    var body: some View {
        NavigationStack{
            VStack(){
                Text("Add Budget Credit")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(25)
                ZStack(){
                    RoundedRectangle(cornerRadius:20)
                        .fill(.white)
                        .frame(width: 360, height: 130, alignment: .leading)
                        
                    Picker("", selection: $selectedPicker){
                        ForEach(viemodelMC.segment, id: \.id){ segment in
                            Text(segment.title).tag(segment.title)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                   
                    }
                
                Form{
                    HStack{
                        Text("Add Value")
                        Spacer()
                        TextField("Rp. 0 ", value: $viewmodelAC.addCredit, formatter: numberFormatter)
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
                .navigationBarTitle(Text("Add Budget Credit"), displayMode: .inline)
                .navigationBarItems(leading:
                                        Button("Cancel") {
                    dismiss()
                }.foregroundColor(Color("interactiveColor")))
                
                .navigationBarItems(trailing:
                                        Button("Add") {
                    if selectedPicker.isEmpty {
                        selectedPicker = viemodelMC.segment.first?.title ?? ""
                    }
                    viewmodelAC.addCreditSegment(selectedPicker: selectedPicker)
                    viewmodelAC.saveAddCredit()
                    dismiss()
                    random.toggle()
                }.foregroundColor(Color("interactiveColor")))
            }
            .background(Color("WhiteColor").ignoresSafeArea())
            
        }
    }
}

struct AddCreditBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        AddCreditBudgetView(editSegment: .constant(nil), random: (.constant(true)))
    }
}
