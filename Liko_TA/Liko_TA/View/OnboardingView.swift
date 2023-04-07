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
        NavigationView(){
            VStack{
                Text("halo")
                Image("onboardingappicon")
                    .resizable()
                    .scaledToFit()
//                    .background(Color.black)
                
            }
//            .navigationTitle("tai")
//            .background(Color.red)
            
            
            
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
