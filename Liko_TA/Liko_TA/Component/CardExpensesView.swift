//
//  CardExpensesView.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 07/05/23.
//

import SwiftUI

struct CardExpensesView: View {
    
    var value: Int
    
    
    var body: some View {
        HStack{
            
            ZStack(alignment: .leading){
                
                
                Circle() //circle yang belakang
                    .trim(from: 0, to: 1)
                    .stroke(Color.orange.opacity(0.25), lineWidth: 15)
                    .frame(width: (UIScreen.main.bounds.width - 100) / 3, height: (UIScreen.main.bounds.width - 90) / 3)
                
                
                
                Circle() //circle depan buat tau datanya berapa
                    .trim(from: 0.25, to: 0.75) //nanti to nya dari batas dari budget yang di set - data total pengeluaran
                    .stroke(Color.orange, lineWidth: 15)
                    .frame(width: (UIScreen.main.bounds.width - 100) / 3, height: (UIScreen.main.bounds.width - 90) / 3)
                    .rotationEffect(Angle(degrees: -90))
                Text("50%")
                    .frame(maxWidth: 100, alignment: .center)
                    .font(.system(size: 15))
                
            }
            .padding()
//            Spacer()
            HStack{
                VStack(spacing :4) {
                    Spacer()
                    Text("Sisa Uang")
                        .font(.system(size: 15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Rp. \(self.value)")
                        .font(.system(size: 22).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Pengeluaran: -Rp.0")
                        .font(.system(size: 13))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    
                    
                }
                .frame(width: 186, height: 100)
                
                
                
            }
            
            
            
            
            
        }
        
        
        
    }
}

struct CardExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        CardExpensesView(value: 0)
    }
}
