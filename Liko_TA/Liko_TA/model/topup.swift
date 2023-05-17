//
//  topup.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 17/05/23.
//


import Foundation


struct Topup: Identifiable, Hashable {
    var id: String?
    var topup: String
    var topupvalue: Int
    var timeAdded: Date // New property for storing the time
    
    
    func toDictionary() -> [String: Any] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: timeAdded)
        return [
            "topup": topup,
            "topupvalue" : topupvalue,
            "timeAdded": dateString // Convert to timestamp // Include the time in the dictionary
        ]
    }
    
    
}
