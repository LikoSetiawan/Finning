//
//  topupviewmodel.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 17/05/23.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class TopUpViewModel: ObservableObject {
    
    @Published var topup: [Topup] = []
    @Published var topupK: String = "Orang Tua"
    @Published var topupValue: Int = 0
    let topupC: [String] = ["Orang Tua","Part Time","Lomba","Magang","Beasiswa"]
    
    var vm = MainScreenViewModel()
    
    
    init(){
        
        
    }
    
    
    
    func updateTopup(){
        let ref = Database.database().reference()
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }

        let topupInc = vm.updateIncome + self.topupValue
        
        ref.child("users").child(uid).child("incomeData").child("income").setValue(topupInc) { (error, ref) in
            if let error = error {
                print("Failed to update income: (error.localizedDescription)")
                return
            }
            DispatchQueue.main.async {
                self.vm.updateIncome = topupInc
            }
        }
    }
    
    

    
    
    func saveTopup(){
        let uid = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()
        
        let savedTopup = Topup(topup: topupK, topupvalue: topupValue, timeAdded: Date())
        let topupRef = ref.child("topupincome").child(uid!).childByAutoId()
        topupRef.setValue(savedTopup.toDictionary()){ error, _ in
            if let error = error{
                print("Error saving expenses data: \(error.localizedDescription)")
            } else{
                print("Successfully saved Topup data")
                self.topupK = ""
                self.updateTopup()
            }
        }
        
        
        
    }
    
    
    
    
    
    
    
}
