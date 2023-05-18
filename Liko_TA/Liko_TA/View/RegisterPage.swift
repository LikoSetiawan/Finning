//
//  RegisterPage.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 07/04/23.
//


import SwiftUI
import FirebaseAuth

struct RegisterPage: View {
    
    
    @EnvironmentObject private var authViewModel: AuthViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 30){
                HStack(spacing: 10) {
                    Image("onboardingappicon")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(15)
                    Text("Register")
                        .bold()
                        .font(.system(size: 35))
                    
                    
                }
                .padding(.top, 35)
                ZStack{
                    Text("Buat Akun")
                }
                .bold()
                .font(.system(size: 25))
                
                ZStack{
                    HStack{
                        Text("Sudah punya akun?")
                        Spacer()
                        NavigationLink(destination: LoginPage().navigationBarBackButtonHidden(true)){
                            Text("Login Disini")
                                .bold()
                                .foregroundColor(Color.black)
                        }
                        .padding(.trailing, 30)
                        .navigationBarHidden(true)
                        
                    }
                    .font(.system(size: 18))
                }
                Spacer()
                    .frame(height: 1)
                VStack{
                    Text("Email")
                        .padding(.trailing, 325)
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
                        .padding(.trailing, 295)
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
                
                NavigationLink(destination: LoginPage().navigationBarBackButtonHidden(true), isActive: $authViewModel.isLoggedin){
                        Button{
                            authViewModel.createUser(email: email, password: password)
                    }label: {
                            Text("Sign Up")
                                .font(.headline)
                                .frame(width: 340, height: 50)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.black)
                                .background(Color("interactiveColor"))
                                .cornerRadius(15)
                                    }
                                }
            }
            .padding(.leading, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
    

}

struct RegisterPage_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPage()
    }
}
