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
    @Published var expenses: [Expenses] = []
    
    
    @Published var topups: [Topup] = []
    @Published var topupinc: Int = 0
    

    @Published var selectedMonthIndex: Int = Calendar.current.component(.month, from: Date()) - 1

    
    init(){
        fetchSegment()
        updateDataForMonth(String(selectedMonthIndex))
//        updateDataForMonth(selectedMonth)
        
        if let user = Auth.auth().currentUser {
            let uid = user.uid
            let ref = Database.database().reference().child("expenses").child(uid)
            let time = Date()
            
            ref.observe(DataEventType.value, with: { snapshot in
                var exp: Int = 0
                var result: [Expenses] = []
                
                
                for child in snapshot.children {
                    if let childSnapshot = child as? DataSnapshot,
                       let dict = childSnapshot.value as? [String:Any],
                       let ket = dict["expenses"] as? String,
                       let exps = dict["expensesvalue"] as? Int {
                        let fetch = Expenses(id: childSnapshot.key, expenses: ket, expensesvalue: exps, timeAdded: time)
                        result.append(fetch)
                        
                        exp += exps
                    }
                }
                self.updateExp = exp
                
                self.expenses = result
            })
        }
        
        if let user = Auth.auth().currentUser {
            let uid = user.uid
            let ref = Database.database().reference().child("topupincome").child(uid)
            
            ref.observe(DataEventType.value, with: { snapshot in
                var topU: Int = 0
                var result: [Topup] = []
                
                
                for child in snapshot.children {
                    if let childSnapshot = child as? DataSnapshot,
                       let dict = childSnapshot.value as? [String:Any],
//                       let date = dict["timeAdded"] as? Date(),
                       let ket = dict["topup"] as? String,
                       let topUs = dict["topupvalue"] as? Int {
                        let fetch = Topup(id: childSnapshot.key, topup: ket, topupvalue: topUs, timeAdded: Date())
                        result.append(fetch)
                        
                        topU += topUs
                    }
                }
                self.topupinc = topU
                
                self.topups = result
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
                   let title = dict["title"] as? String,
                let percentage = dict["percentage"] as? Double,
                let originalSegmentS = dict["originalSegmentS"] as? Int{
                    let budget = Budget(id: childSnapshot.key, segmentS: segmentS, title: title, percentage: percentage, originalSegmentS: originalSegmentS)
                    segments.append(budget)
                }
            }
            DispatchQueue.main.async {
                self.segment = segments
            }
        }
    }
    
    func recommendation() -> Int {
        let calendar = Calendar.current
        let date = Date()
        let dayOfMonth = calendar.component(.day, from: date)
        let updateIncome = self.updateIncome
        
        let daysInMonth = calendar.range(of: .day, in: .month, for: date)!.count
        let totalIncome = updateIncome - self.updateExp
        let dailyRecommendation = totalIncome / (daysInMonth - dayOfMonth + 1)
        
        return dailyRecommendation
    }

    
    
    
    func updateDataForMonth(_ selectedMonth: String) {
        // Clear existing data arrays
        expenses = []
        topups = []
        updateExp = 0
        topupinc = 0
        updateIncome = 0
       

       
        if let user = Auth.auth().currentUser {
            let uid = user.uid
            let ref = Database.database().reference().child("expenses").child(uid)
            let time = Date()
            
            ref.observe(DataEventType.value, with: { snapshot in
                var exp: Int = 0
                var result: [Expenses] = []
                
                for child in snapshot.children {
                    if let childSnapshot = child as? DataSnapshot,
                       let dict = childSnapshot.value as? [String:Any],
                       let ket = dict["expenses"] as? String,
                       let exps = dict["expensesvalue"] as? Int {
                        let fetch = Expenses(id: childSnapshot.key, expenses: ket, expensesvalue: exps, timeAdded: time)
                        result.append(fetch)
                        
                        exp += exps
                    }
                }
                self.updateExp = exp
                
                
                let filteredExpenses = result.filter { expense in
                    let calendar = Calendar.current
                    let expenseMonth = calendar.component(.month, from: expense.timeAdded)
                    return expenseMonth == self.selectedMonthIndex + 1 // months are 1-based
                }
                
                self.expenses = filteredExpenses
                
                let totalExpensesValue = filteredExpenses.reduce(0) { $0 + $1.expensesvalue }
                self.updateExp = totalExpensesValue
                
                
            })
        }
        
       
        if let user = Auth.auth().currentUser {
            let uid = user.uid
            let ref = Database.database().reference().child("topupincome").child(uid)
            
            ref.observe(DataEventType.value, with: { snapshot in
                var topU: Int = 0
                var result: [Topup] = []
                
                for child in snapshot.children {
                    if let childSnapshot = child as? DataSnapshot,
                       let dict = childSnapshot.value as? [String:Any],
                       let ket = dict["topup"] as? String,
                       let topUs = dict["topupvalue"] as? Int {
                        let fetch = Topup(id: childSnapshot.key, topup: ket, topupvalue: topUs, timeAdded: Date())
                        result.append(fetch)
                        
                        topU += topUs
                    }
                }
                self.topupinc = topU
                
                
                let filteredTopups = result.filter { topup in
                    let calendar = Calendar.current
                    let topupMonth = calendar.component(.month, from: topup.timeAdded)
                    return topupMonth == self.selectedMonthIndex + 1 // months are 1-based
                }
                
                self.topups = filteredTopups
                
                let totalTopupsValue = filteredTopups.reduce(0) { $0 + $1.topupvalue }
                self.topupinc = totalTopupsValue
            })
        }
    }
    
    
    
    
}
