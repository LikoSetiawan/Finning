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
//    @Published var segmentTitle: String = ""
    @Published var segment: [Budget] = []
    
    
    func observeIncome() {
            guard let uid = Auth.auth().currentUser?.uid else {
                return
            }
            
        let ref = Database.database().reference().child("users").child(uid).child("incomeData").child("income")
            
            ref.observe(.value) { snapshot in
                if let inc = snapshot.value as? Int {
                    DispatchQueue.main.async {
                        self.updateIncome = inc
                    }
                }
            }
        }
    
    func fetchSegment() {
        guard let currentUserID = Auth.auth().currentUser?.uid else {
//            print("User is not logged in")
            return
        }

        let databaseRef =  Database.database().reference()

        databaseRef.child("segments").child(currentUserID).observe(.value) { [weak self] (snapshot) in
            guard let self = self else { return }

            var results: [Budget] = []

            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                   let dict = childSnapshot.value as? [String: Any],
                   let segment1 = dict["segment1"] as? Int,
                   let title = dict["title"] as? String{
                    let allsegment = Budget(id: childSnapshot.key, segmentS: segment1, title: title)
                        results.append(allsegment)
                    }
                }

                self.segment = results
            }
        }
//    func fetchSegment() {
//        guard let currentUserID = Auth.auth().currentUser?.uid else {
//            print("User is not logged in")
//            return
//        }
//
//        let databaseRef =  Database.database().reference()
//
//        databaseRef.child("users").child(currentUserID).child("segment").observe(.value) { [weak self] (snapshot) in
//            guard let self = self else { return }
//
//            var results: [Budget] = []
//
//            for child in snapshot.children {
//                if let childSnapshot = child as? DataSnapshot,
//                   let dict = childSnapshot.value as? [String: Any],
//                   let segment1 = dict["segment1"] as? Int,
//                   let segment2 = dict["segment2"] as? Int,
//                   let segment3 = dict["segment3"] as? Int,
//                   let segment4 = dict["segment4"] as? Int {
//                    let allsegment = Budget(id: childSnapshot.key, segment1: segment1 , segment2: segment2, segment3: segment3, segment4: segment4)
//                        results.append(allsegment)
//                    }
//                }
//
//                self.segment = results
//            }
//        }
    
//    func fetch
    
    
    
    
}
