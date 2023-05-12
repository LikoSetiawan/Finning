//
//  CardView.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 16/04/23.
//

import SwiftUI

struct CardView: View {

//    @Binding var segmentList: Segment
    var value: Int
    var title: String
    
    @ObservedObject var vm_mainscreen = MainScreenViewModel()

    private let colors = [Color("GreenColor"),Color("PurpleColor"), Color("RedColor"), Color("YellowColor")]

    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            HStack{
                ZStack(alignment: .leading){
                    Circle() //circle yang belakang
                        .trim(from: 0, to: 1)
                        .stroke(Color("YellowColor").opacity(0.25), lineWidth: 10)
                        .frame(width: 60, height: 60)
//                        .frame(width: (UIScreen.main.bounds.width - 150) / 4, height: (UIScreen.main.bounds.width - 220) / 3)

                    Circle() //circle depan buat tau datanya berapa
                        .trim(from: 0.25, to: 1) //nanti to nya dari batas dari budget yang di set - data total pengeluaran
                        .stroke(Color("YellowColor"), lineWidth: 10)
                        .frame(width: 60, height: 60)
//                        .frame(width: (UIScreen.main.bounds.width - 150) / 4, height: (UIScreen.main.bounds.width - 220) / 3)
                }
                .padding(.top)
//                .foregroundColor(colors[Circle])
                Spacer()
            }


            Text(self.title) //nanti ini title segment
                .font(.system(size: 14)).bold()
                .padding(.top)
//            vm_mainscreen.segmentTitle = self.title


            HStack{
                Text("Sisa:")
                    .font(.system(size: 12))
                    .foregroundColor(.black)

                Text("Rp. \(self.value)")
                    .font(.system(size: 13)).bold()
                    .foregroundColor(.black)

            }

        }
        .padding(15)
        .background(Color.white)
        .cornerRadius(20)
        .frame(width: 165, height: 170)

    }

}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CardView(value: 20000, title: "")
                .previewLayout(.sizeThatFits)
        }
    }
}
