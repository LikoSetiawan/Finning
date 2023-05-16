//
//  WriteViewModel.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 08/05/23.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth
import FirebaseDatabaseSwift


class WriteViewModel : ObservableObject{
    
    
    @Published var income: Int = 0
//    @Published var incomeData: [Income] = []
    
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.decimalSeparator = "."
        formatter.zeroSymbol = ""
        return formatter
    }

    
    
    let ref = Database.database().reference()
    
    let auth = Auth.auth()
    
    
    func saveData() {
        guard let user = auth.currentUser else {
            print("User is not authenticated")
            return
        }
        
        let incomeRef = ref.child("users").child(user.uid).child("incomeData").child("income")
           incomeRef.setValue(income){ error, _ in
                    if let error = error {
                        print("Error saving income data: \(error.localizedDescription)")
                        
                    } else {
                        print("Successfully saved Income data")
                        
                    }
                }
        
    }
}

//    let inputIncome = Income(income: income)
//
//        let inputData = [
//            "incomeData": inputIncome.toDictionary()
//        ]
        
//    let inputIncomeRef = ref.child("users").child(user.uid)
