//
//  ReportCardView.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 06/05/23.
//

import SwiftUI

struct ReportCardView: View {
    var body: some View {
        VStack(spacing: 15){
            Text("Bulan ini menghemat : ")
                .font(.system(size: 16))
            Text("Rp. xxxx ,-- ")
                .font(.system(size: 16))
                .fontWeight(.bold)
            
        }
    }
}

struct ReportCardView_Previews: PreviewProvider {
    static var previews: some View {
        ReportCardView()
            .frame(width: 300, height: 100)
    }
}
