//
//  AddExpenseMainView.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 16/04/23.
//

import SwiftUI

struct AddExpenseMainView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @FocusState private var isInputActive: Bool
    @State var totalBudget : Int = 0
    @State var budgetCategory : String = ""
    @State var recomendationEnabled: Bool = false
    @Binding var random:Bool
    
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddExpenseMainView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseMainView(random: .constant(true))
    }
}
