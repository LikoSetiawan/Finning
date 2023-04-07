//
//  LoginPage.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 30/03/23.
//

import Foundation
import SwiftUI
import FirebaseAuth
import Firebase


struct LoginPage: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 30){
                HStack(spacing: 20) {
                    Image("onboardingappicon")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(15)
                    Text("Login")
                        .bold()
                        .font(.system(size: 35))
                    
                }
                .padding(.top, 35)
                ZStack{
                    Text("Login ke Akunmu")
                }
                .bold()
                .font(.system(size: 25))
                
                ZStack{
                    HStack{
                        Text("Belum punya akun?")
                        Spacer()
                        NavigationLink(destination: RegisterPage().navigationBarBackButtonHidden(true)){
                            Text("Daftar Disini")
                                .bold()
                                .foregroundColor(Color.black)
                        }
                        .navigationBarHidden(true)
                    }
                    .font(.system(size: 18))
                    .padding(.trailing, 30)
                    
                }
                Spacer()
                    .frame(height: 1)
                VStack{
                    Text("Email")
                        .padding(.trailing, 330)
                        .font(.system(size: 18))
                    TextField("", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .background(
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color.gray)
                                .padding(.top, 35)
                                .padding(.trailing, 25)
                        )
                    
                }
                VStack{
                    Text("Password")
                        .padding(.trailing, 299)
                    SecureField("", text: $password)
                        .background(
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color.gray)
                                .padding(.top, 35)
                                .padding(.trailing, 25)
                        )
                }
                Spacer()
                    .frame(height: 2)
                Button{
                    Login()
                }label: {
                    NavigationLink(destination: OnboardingView().navigationBarBackButtonHidden(true)){
                        Text("Login")
                            .font(.headline)
                            .frame(width: 340, height: 50)
                            .fontWeight(.semibold)
                            .background(Color.gray)
                            .foregroundColor(Color.black)
                            .cornerRadius(15)
                            .background(Color.interactiveColor)
                        
                    }
                }
                
            }
            .padding(.leading, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
        }
    //tutorial disini bang
    //https://www.youtube.com/watch?v=6b2WAePdiqA&t=927s
    
      func Login(){
          Auth.auth().signIn(withEmail: email, password: password){ result, error in
              if error != nil{
                  print(error!.localizedDescription)
              }
              
          }
          
      }
    }

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}

extension View{
    func placeholder<Content : View>(
        when shouldShow : Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View{
            
            
            ZStack(alignment: alignment){
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
