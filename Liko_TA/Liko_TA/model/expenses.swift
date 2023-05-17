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
    var timeAdded: Date
   
    func toDictionary() -> [String: Any] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: timeAdded)
        return [
            "expenses": expenses,
            "expensesvalue" : expensesvalue,
            "timeAdded": dateString
        ]
    }


}
