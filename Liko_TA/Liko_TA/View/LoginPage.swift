//
//  LoginPage.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 30/03/23.
//

import SwiftUI
import FirebaseAuth


struct LoginPage: View {
    
    @State private var isLogin = false
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
                        .padding(.trailing, 296)
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
                
                Button(action: loginUser) {
                    Text("Login")
                        .font(.headline)
                        .frame(width: 340, height: 50)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                        .background(Color("interactiveColor"))
                        .cornerRadius(15)
                        }
                        // Navigate kalo berhasil log in
                NavigationLink(destination: InputIncomeView().navigationBarBackButtonHidden(true), isActive: $isLogin) {
                            EmptyView()
        
//                Button{
//
//                }label: {
//                    Text("Login")
//                        .font(.headline)
//                        .frame(width: 340, height: 50)
//                        .fontWeight(.semibold)
//                        .foregroundColor(Color.black)
//                        .background(Color("interactiveColor"))
//                        .cornerRadius(15)
                }
                
            }
            .padding(.leading, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
        
        }
    //tutorial disini bang
    //https://www.youtube.com/watch?v=6b2WAePdiqA&t=927s
    
    
    private func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed due to error:", err)
                return
            }
            print("Successfully logged in with ID: \(result?.user.uid ?? "")")
            // Set isLogin to true if login is successful
            self.isLogin = true
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
