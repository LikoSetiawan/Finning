//
//  LoginPage.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 30/03/23.
//

import Foundation
import SwiftUI
import FirebaseAuth




struct LoginPage: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    var body: some View {
//        NavigationStack{
            VStack(alignment: .leading, spacing: 30){
                HStack(spacing: 20) {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
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
                        Text("Daftar Disini")
                            .bold()
                            .padding(.trailing, 30)
                    }
                    .font(.system(size: 18))
                }
                Spacer()
                    .frame(height: 1)
                VStack{
                    Text("Email")
                        .padding(.trailing, 330)
                        .font(.system(size: 18))
                    TextField("", text: $email)
//                        .background(Color.red)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
//                        .placeholder(when: email.isEmpty){
//                            Text("Email")
//                                .bold()
//                                .font(.system(size: 15))
//                        }
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
                    
                }label: {
                    Text("Login")
                        .font(.headline)
                        .frame(width: 340, height: 40)
                        .fontWeight(.semibold)
                        .background(Color.gray)
                        .foregroundColor(Color.black)
                        .cornerRadius(15)
                        .background(Color.interactiveColor)
                        
                }

            }
//            .navigationTitle("Login")
            .padding(.leading, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
//            .background(Color.blue)
        }
//        .padding(.leading, 10)
//        .background(Color.blue)
    }
//}

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
