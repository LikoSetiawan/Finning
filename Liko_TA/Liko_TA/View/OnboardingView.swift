//
//  OnboardingView.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 06/04/23.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationView{
            ZStack{
                VStack(){
                    Image("onboardingappicon")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                        .cornerRadius(15)
                        .scaledToFit()
                    Text("Selamat datang di")
                        .font(.system(size: 32))
                        .frame(width: 300, alignment: .center)
                    
                    Text("Finning")
                        .fontWeight(.heavy)
                        .font(.system(size: 31))
                        .frame(width: 300, alignment: .center)
                        .padding(.bottom,10)
                    Spacer()
                        .frame(height: 15)
                    //
                    VStack(spacing: 4){
                        OnboardingPage(image: "onboarding-", title: "ANGGARAN LEBIH BAIK", description: "Masukin anggaran kamu ke kategori yang beda!")
                        OnboardingPage(image: "onboarding-2", title: "TRACK PENGELUARAN", description: "Bisa melihat pengeluaran melalui statistik bulananmu!")
                        OnboardingPage(image: "onboarding-3", title: "LACAK DENGAN MUDAH", description: "Tambah widget ke home screen kamu!")
                    }
                    Spacer()
                    //
                    NavigationLink(destination: InputIncomeView().navigationBarBackButtonHidden(true)){
                        Text("Continue")
                            .font(.headline)
                            .frame(width: 340, height: 50)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .background(Color("interactiveColor"))
                            .cornerRadius(15)
                        
                    }
                    //
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(45)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}


struct OnboardingPage: View {
    let image: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(){
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70, alignment: .leading)
            VStack(alignment: .leading, spacing: 5){
                Text(title)
                    .fontWeight(.bold)
                    .font(.system(size: 17))
                Text(description)
                    .font(.system(size: 17))
            }
            .padding(.trailing, 20)
            
        }
        .frame(width: 340, height: 100)
    }
}
