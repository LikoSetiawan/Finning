//
//  IncomeModelView.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 09/05/23.
//

import Foundation

struct Income: Identifiable, Hashable {
    var id: String?
    var income: Int
    var timeAdded: Date
    
    func toDictionary() -> [String: Any] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: timeAdded)
        return [
            "income": income,
            "timeAdded": dateString
        ]
    }
}
