//
//  SetupBudgetViewModel.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 09/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class SetupBudgetViewModel: ObservableObject {
    
    @Published var userIncome: Int = 0
    @Published var segments1: Int = 0
    @Published var segments2: Int = 0
    @Published var segments3: Int = 0
    @Published var segments4: Int = 0
    @Published var segment: [Budget] = []
    
    init() {
        fetchIncome()
    }
    
    func fetchIncome() {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }

        let ref = Database.database().reference().child("users").child(uid).child("incomeData").child("income")

        ref.observe(.value) { snapshot in
            if let incomeUser = snapshot.value as? Int {
                DispatchQueue.main.async {
                    self.userIncome = incomeUser
                }
            }
        }
        
//        let segmentsRef = Database.database().reference().child("users").child(uid).child("segmentData")
//        segmentsRef.observe(.value) { snapshot in
//            var fetchedSegments: [Segment] = []
//            for child in snapshot.children {
//                if let segmentSnapshot = child as? DataSnapshot,
//                   let segmentData = segmentSnapshot.value as? [String: Any],
//                   let title = segmentData["title"] as? String,
//                   let value = segmentData["value"] as? Int {
//                    let segment = Segment(title: title, value: value)
//                    fetchedSegments.append(segment)
//                }
//            }
//            DispatchQueue.main.async {
//                self.segments = fetchedSegments
//            }
//        }
    }
    
    
    
    func saveSegment1() {
        let uid = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()
        let savedBudget = Budget(segmentS: segments1, title: "Food & Drink")
        let incomeRef = ref.child("segments").child(uid!).childByAutoId()
        incomeRef.setValue(savedBudget.toDictionary()){ error, _ in
                    if let error = error {
                        print("Error saving income data: \(error.localizedDescription)")

                    } else {
                        print("Successfully saved Income data")

                    }
                }

    }

    func saveSegment2() {
        let uid = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()
        let savedBudget = Budget(segmentS: segments2, title: "Transportasion")
        let incomeRef = ref.child("segments").child(uid!).childByAutoId()
           incomeRef.setValue(savedBudget.toDictionary()){ error, _ in
                    if let error = error {
                        print("Error saving income data: \(error.localizedDescription)")

                    } else {
                        print("Successfully saved Income data")

                    }
                }

    }
    func saveSegment3() {
        let uid = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()
        let savedBudget = Budget(segmentS: segments3, title: "Hobby")
        let incomeRef = ref.child("segments").child(uid!).childByAutoId()
           incomeRef.setValue(savedBudget.toDictionary()){ error, _ in
                    if let error = error {
                        print("Error saving income data: \(error.localizedDescription)")

                    } else {
                        print("Successfully saved Income data")

                    }
                }

    }
    func saveSegment4() {
        let uid = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()
        let savedBudget = Budget(segmentS: segments4, title: "Colleague Expenses")
        let incomeRef = ref.child("segments").child(uid!).childByAutoId()
           incomeRef.setValue(savedBudget.toDictionary()){ error, _ in
                    if let error = error {
                        print("Error saving income data: \(error.localizedDescription)")

                    } else {
                        print("Successfully saved Income data")

                    }
                }

    }
//        func saveSegment(){
//        let ref = Database.database().reference()
//        let uid = Auth.auth().currentUser?.uid
//
//        let savedBudget = Budget(segment1: segments1, segment2: segments2, segment3: segments3, segment4: segments4)
//        ref.child("users").child(uid!).child("segment").childByAutoId().setValue(savedBudget.toDictionary()) { error, ref in
//            if let error = error {
//                print("Error updating profile: \(error.localizedDescription)")
//            } else {
//                print("Budget updated successfully")
//            }
//        }
//    }
    
//    func saveSegment(){
//        let ref = Database.database().reference()
//        let uid = Auth.auth().currentUser?.uid
//
//        let savedBudget = Budget(segment1: segments1)
//        ref.child("users").child(uid!).child("segment").childByAutoId().setValue(savedBudget.toDictionary()) { error, ref in
//            if let error = error {
//                print("Error updating profile: \(error.localizedDescription)")
//            } else {
//                print("Budget updated successfully")
//            }
//        }
//    }
    
}
