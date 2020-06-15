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
        VStack(spacing: 0) {
            Button(action: {
                self.socialLogin.attemptLoginFb(onSignedIn: self.onSignedIn)
            }, label: {
                HStack {
                    Image("f_logo_RGB-White_1024")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width:38, height:38)
                        .padding(.leading, 5)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                    Spacer()
                    Text("Continue with Facebook")
                        .foregroundColor(.white)
                        .padding(.trailing, 11)
                    Spacer()
                }
                .background(Color(hex: "#1877F2"))
                .cornerRadius(4)
                .padding()
            })
            
            Button(action: {
                //SocialSignInClient.OnSignedIn = self.onSignedIn
                self.socialLogin.attemptLoginGoogle(onSignedIn: self.onSignedIn)
            }, label: {
                HStack {
                    Image("btn_google_light_normal_ios")
                        .padding(0)
                    Spacer()
                    Text("Sign in with Google")
                        .foregroundColor(.white)
                        .padding(.trailing, 11)
                    Spacer()
                }
                .background(Color(hex: "#4285F4"))
                .cornerRadius(4)
                .padding()
            })
                .padding(.top, -20)
        }.navigationBarTitle(Text("Sign-In"))
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
