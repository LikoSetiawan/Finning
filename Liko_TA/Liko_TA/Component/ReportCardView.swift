//
//  ReportCardView.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 06/05/23.
//

import SwiftUI

struct ReportCardView: View {
    
    
    var totalexpenses: Int
    
    
    
    var body: some View {
        VStack(spacing: 15){
            Text("Total Pengeluaran : ")
                .font(.system(size: 16))
            Text("Rp. \(self.totalexpenses) ,- ")
                .font(.system(size: 16))
                .fontWeight(.bold)
            
        }
    }
}

struct ReportCardView_Previews: PreviewProvider {
    static var previews: some View {
        ReportCardView(totalexpenses: 0)
            .frame(width: 300, height: 100)
    }
}
