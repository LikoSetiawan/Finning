//
//  SisaUangCardView.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 16/04/23.
//

import SwiftUI

struct SisaUangCardView: View {
    //
//    @ObservedObject var vm_mainscreen = MainScreenViewModel()
    
    var valueincome: Int
    //
    var body: some View {
        ZStack(alignment: .leading){
            
            Image("main screen-sisa uang")
                .resizable()
                .frame(width: 125, height: 125, alignment: .leading)
                .aspectRatio(contentMode: .fill)
//                .position(x: 40, y: 60)
            HStack{
                Spacer()
                VStack(spacing :2) {
                    Spacer()
                    Text("Sisa Uang")
                        .font(.system(size: 15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("RP \(self.valueincome),-")
                        .font(.system(size: 22))
                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .onAppear{
//                            vm_mainscreen.observeIncome()
//                        }
                    
//                    Text("Anda telah menyimpan uang Rp.100.600.00 pada bulan Juni!")
//                        .font(.system(size: 7))
//                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
               
                    
                }
                .frame(width: 240, height: 100)
                
            }
            
        }
        .frame(width: 360, height: 100)
        
    }
}

struct SisaUangCardView_Previews: PreviewProvider {
    static var previews: some View {
        SisaUangCardView(valueincome: 100000)
//            .previewLayout(.fixed(width: 360, height: 125))
    }
}
