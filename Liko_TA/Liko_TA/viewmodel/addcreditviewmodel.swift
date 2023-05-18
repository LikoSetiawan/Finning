//
//  addcreditviewmodel.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 18/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase


class AddCreditViewModel: ObservableObject{
    
    @Published var credit: [AddCredit] = []
    @Published var addCredit: Int = 0
    
    
    let vm = MainScreenViewModel()
    
    func addCreditSegment(selectedPicker: String){
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let databaseRef = Database.database().reference()
        
        guard let selectedSegment = vm.segment.first(where: { $0.title == selectedPicker }) else {
                // Selected picker option not found
                return
            }
        
        let addCre = selectedSegment.segmentS + self.addCredit
        
        let updatedSegment = Budget(id: selectedSegment.id,
                                       segmentS: addCre,
                                       title: selectedSegment.title,
                                       percentage: 100,
                                       originalSegmentS: addCre)
           
        let updatedDict = updatedSegment.toDictionary() // Convert updated segment to dictionary
        
        databaseRef.child("segments").child(uid).child(selectedSegment.id!).updateChildValues(updatedDict) { (error, ref) in
            if let error = error {
                print("Failed to update segment: \(error.localizedDescription)")
            } else {
                print("Successfully addCredit segment")
            }
        }
        
        
        
    }
    
    
    func saveAddCredit(){
        
        let uid = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()
        let time = Date()
        
        var savedAddCredit = AddCredit(addcredit: addCredit, timeAdded: time)
        
        let addcreditRef = ref.child("addcredit").child(uid!).childByAutoId()
        addcreditRef.setValue(savedAddCredit.toDictionary()){ error, _ in
            if let error = error{
                print("Error saving expenses data: \(error.localizedDescription)")
            } else{
                print("Successfully saved Topup data")
                
            }
        }
        
        
    }
    
}
