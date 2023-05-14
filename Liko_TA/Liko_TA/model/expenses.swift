//
//  expenses.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 13/05/23.
//

import Foundation


struct Expenses: Identifiable, Hashable {
    var id: String?
    var expenses: String
    var expensesvalue: Int
   
    func toDictionary() -> [String: Any] {
        return [
            "expenses": expenses,
            "expensesvalue" : expensesvalue
        ]
    }


}
