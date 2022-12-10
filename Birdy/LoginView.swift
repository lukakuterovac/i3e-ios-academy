//
//  LoginView.swift
//  Birdy
//
//  Created by Luka Kuterovac on 10.12.2022..
//

import SwiftUI

struct LoginView: View {
    @Binding var username: String
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            
            Spacer()
            
            HStack {
                Image("bird")
                    .resizable()
                    .frame(width: 75, height: 75)
                    .clipShape(Circle())
                Text("Birdy")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, 10.0)
            }
            
            TextField("Username", text:$username)
                .padding(.horizontal, 100.0)
                .padding(.top)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
                
            Button(action: { isPresented = false }) {
                Text("Log In")
            }
            .padding(.top, 10.0)
            
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(
            username: Binding.constant(""),
            isPresented: Binding.constant(true)
        )
    }
}
