//
//  addcredit.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 18/05/23.
//

import Foundation

struct AddCredit: Identifiable, Hashable {
    var id: String?
    var addcredit: Int
    var timeAdded: Date // New property for storing the time
    
    
    func toDictionary() -> [String: Any] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: timeAdded)
        return [
            "addcredit" : addcredit,
            "timeAdded": dateString // Convert to timestamp // Include the time in the dictionary
        ]
    }
    
    
}
