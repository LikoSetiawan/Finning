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
    
    func toDictionary() -> [String: Any] {
        return [
            "income": income
        ]
    }
}
