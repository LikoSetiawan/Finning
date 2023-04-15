//
//  RecommendationCardView.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 16/04/23.
//

import SwiftUI

struct RecommendationCardView: View {
    var body: some View {
        ZStack(alignment: .trailing){
            Image("main screen-rekomendasi pengeluaran")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .position(x: 325, y: 60)
            
            
            VStack(alignment: .leading, spacing: 5) {
                Spacer()
                Text("Rekomendasi Pengeluaran Harianmu")
                    .font(.system(size: 12))
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.black)
                    
//                Spacer()
                Text("RP 33.000,-")
                    .font(.system(size: 23))
                    .foregroundColor(.black)
                Spacer()
                    
               

            }
            .frame(width: 340, height: 110)
            .padding()

        }
        .frame(width: .infinity , height: 100)
        
    }
}

struct RecommendationCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationCardView()
    }
}
