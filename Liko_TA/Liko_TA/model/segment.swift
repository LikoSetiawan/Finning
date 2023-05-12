//
//  segment.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 12/05/23.
//

import Foundation

struct Budget: Identifiable, Hashable {
    var id: String?
    var segmentS: Int
    var title: String
   
    func toDictionary() -> [String: Any] {
        return [
            "segment1": segmentS,
            "title" : title
        ]
    }


}
//struct Budget: Identifiable, Hashable {
//    var id: String?
//    var segment1: Int
//    var segment2: Int
//    var segment3: Int
//    var segment4: Int
//
//    func toDictionary() -> [String: Any] {
//        return [
//            "segment1": segment1,
//            "segment2": segment2,
//            "segment3": segment3,
//            "segment4": segment4
//        ]
//    }


//}
