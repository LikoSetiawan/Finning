//
//  ReportCardView.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 06/05/23.
//

import SwiftUI

struct ReportCardView: View {
    
    
    var totalexpenses: Int
    
    var totaltitle : String
    
    
    
    var body: some View {
        VStack(spacing: 15){
            Text(self.totaltitle)
                .font(.system(size: 16))
            Text("Rp. \(self.totalexpenses) ,- ")
                .font(.system(size: 16))
                .fontWeight(.bold)
            
        }
    }
}

struct ReportCardView_Previews: PreviewProvider {
    static var previews: some View {
        ReportCardView(totalexpenses: 0, totaltitle: "")
    }
}
