//
//  mainscreenviewmodel.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 12/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class MainScreenViewModel : ObservableObject {
    
    @Published var updateIncome: Int = 0
    @Published var segment: [Budget] = []
    @Published var updateExp: Int = 0
    

    
    
    
    
    init(){
        fetchSegment()
        
        if let user = Auth.auth().currentUser {
            let uid = user.uid
            let ref = Database.database().reference().child("expenses").child(uid)
            
            ref.observe(DataEventType.value, with: { snapshot in
                var exp: Int = 0
                for child in snapshot.children {
                    if let childSnapshot = child as? DataSnapshot,
                       let dict = childSnapshot.value as? [String:Any],
                       let exps = dict["expensesvalue"] as? Int {
                        exp += exps
                    }
                }
                self.updateExp = exp
            })
        }
        
        if let user = Auth.auth().currentUser {
            let uid = user.uid
            let ref = Database.database().reference().child("users").child(uid).child("incomeData").child("income")
            
            ref.observe(.value) { snapshot in
                if let value = snapshot.value as? Int {
                    self.updateIncome = value
                }
            }
        }
    }
    
    func fetchSegment() {
        guard let user = Auth.auth().currentUser else {
            return
        }
        
        let uid = user.uid
        let ref = Database.database().reference().child("segments").child(uid)
        
        ref.observe(.value) { snapshot in
            var segments: [Budget] = []
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                   let dict = childSnapshot.value as? [String:Any],
                   let segmentS = dict["segment1"] as? Int,
                   let title = dict["title"] as? String {
                    let budget = Budget(id: childSnapshot.key, segmentS: segmentS, title: title)
                    segments.append(budget)
                }
            }
            DispatchQueue.main.async {
                self.segment = segments
            }
        }
    }

    
    
    
//    func fetchSegment() {
//        guard let currentUserID = Auth.auth().currentUser?.uid else {
//
//            return
//        }
//
//        let databaseRef =  Database.database().reference()
//
//        databaseRef.child("segments").child(currentUserID).observe(.value) { [weak self] (snapshot) in
//            guard let self = self else { return }
//
//            var results: [Budget] = []
//
//            for child in snapshot.children {
//                if let childSnapshot = child as? DataSnapshot,
//                   let dict = childSnapshot.value as? [String: Any],
//                   let segment1 = dict["segment1"] as? Int,
//                   let title = dict["title"] as? String{
//                    let allsegment = Budget(id: childSnapshot.key, segmentS: segment1, title: title)
//                    results.append(allsegment)
//                }
//            }
//
//            self.segment = results
//        }
//    }
    
    
    
    
    
}




//    func observeIncome() {
//            guard let uid = Auth.auth().currentUser?.uid else {
//                return
//            }
//
//        let ref = Database.database().reference().child("users").child(uid).child("incomeData").child("income")
//
//            ref.observe(.value) { snapshot in
//                if let inc = snapshot.value as? Int {
//                    DispatchQueue.main.async {
//                        self.updateIncome = inc
//                    }
//                }
//            }
//        }
