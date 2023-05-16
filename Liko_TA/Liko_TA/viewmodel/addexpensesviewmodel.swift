//
//  addexpensesviewmodel.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 13/05/23.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class AddExpensesViewModel: ObservableObject{
    
    @Published var expenses: [Expenses] = []
    @Published var keterangan: String = ""
    @Published var expensesValue: Int = 0
//    @Binding var updateIncome: Int = 0
    
    var selectedSegment: Budget?

    
    var vm = MainScreenViewModel()

    func updateExpenses(){
        let ref = Database.database().reference()
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }

        let newInc = vm.updateIncome - self.expensesValue
        
        ref.child("users").child(uid).child("incomeData").child("income").setValue(newInc) { (error, ref) in
            if let error = error {
                print("Failed to update income: (error.localizedDescription)")
                return
            }
            DispatchQueue.main.async {
                self.vm.updateIncome = newInc
            }
        }
    }
    
    
    func updateSegment(_ selectedSegment: Budget?) {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let databaseRef = Database.database().reference()
        
        //ngambil segment apa yang dipencet
        guard let budget = selectedSegment else {
                return
            }
            
            // Update the segment1 value of the Budget object
            let updatedSegment = budget.segmentS - self.expensesValue
        
        // Calculate the new percentage based on the updated segment value
        let newPercentage = Double(updatedSegment) / Double(budget.originalSegmentS) * 100
            
            // Construct the update dictionary
        let updateDict: [String: Any] = [
                "segment1": updatedSegment,
                "percentage": newPercentage
            ]
        
            
            // Update the segment1 value in the database
            databaseRef.child("segments").child(uid).child(budget.id!).updateChildValues(updateDict) { (error, ref) in
                if let error = error {
                    print("Failed to update segment: \(error.localizedDescription)")
                } else {
                    print("Successfully updated segment")
                }
            }
        
        
    }
    
    
    func saveExpenses(){
        let uid = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()
        let savedExpenses = Expenses(expenses: keterangan, expensesvalue: expensesValue)
        let expensesRef = ref.child("expenses").child(uid!).childByAutoId()
        expensesRef.setValue(savedExpenses.toDictionary()){ error, _ in
            if let error = error{
                print("Error saving expenses data: \(error.localizedDescription)")
            } else{
                print("Successfully saved Expenses data")
                self.updateExpenses()
                self.updateSegment(self.selectedSegment)
            }
        }
        
    }
    

    
}
