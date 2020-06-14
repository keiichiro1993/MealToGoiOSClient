//
//  SignInPage.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/14.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

// https://stackoverflow.com/questions/57924768/add-google-sign-in-with-swiftui

import SwiftUI

struct SignInButtons: View {
    var onSignedIn: () -> Void
    var socialLogin = SocialSignInClient()
    var body: some View {
        VStack {
            HStack {
                /*Button(action: self.logginFb, label: {
                 Image("ic_facebook").foregroundColor(Color.white).frame(width: 20, height: 20)
                 })
                 .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                 .background(Color("facebook"))
                 .cornerRadius(8.0)*/
                
                Button(action: {
                    //SocialSignInClient.OnSignedIn = self.onSignedIn
                    self.socialLogin.attemptLoginGoogle(onSignedIn: self.onSignedIn)
                }, label: {
                    HStack {
                        Image("btn_google_light_normal_ios")
                            .padding(0)
                        Text("Sign in with Google")
                            .foregroundColor(.white)
                            .padding(.trailing, 11)
                    }
                    .background(Color(hex: "#4285F4"))
                    .cornerRadius(3)
                    .padding()
                })
            }
        }.navigationBarTitle(Text("Sign-In"))
    }
    
    func logginFb() {
        /*socialLogin.attemptLoginFb(completion: { result, error in
         
         })*/
    }
}

struct SignInButtons_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone 11 Pro"], id: \.self) { deviceName in
            SignInButtons(onSignedIn: {})
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
