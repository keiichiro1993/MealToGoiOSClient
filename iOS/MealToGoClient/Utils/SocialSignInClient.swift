//
//  GoogleSigninClient.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/14.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation
import SwiftUI
import GoogleSignIn
//import FBSDKLoginKit
//1076073232378-0me0bu5ba51sr6u9p10t5pr55gmbam3e.apps.googleusercontent.com

class SocialSignInClient: ObservableObject {
    var helper: SocialSignInHelper
    
    init() {
        helper = SocialSignInHelper()
    }
    
    static var User: UserInfo = UserInfo("DummyTaro","taro20200612")
    static var OnSignedIn: () -> Void = {}
    
    static func SetUserData(_ user: GIDGoogleUser?) {
        if(user != nil) {
            User.UserId = user!.userID                  // For client-side use only!
            User.IdToken = user!.authentication.idToken // Safe to send to the server
            User.FullName = user!.profile.name
            User.GivenName = user!.profile.givenName
            User.FamilyName = user!.profile.familyName
            User.Email = user!.profile.email
            
            OnSignedIn()
            
            //Clear
            OnSignedIn = {}
        }
    }
    
    func attemptLoginGoogle(onSignedIn: @escaping () -> Void) {
        SocialSignInClient.OnSignedIn = onSignedIn
        helper.attemptLoginGoogle()
    }
}

struct SocialSignInHelper: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<SocialSignInHelper>) -> UIView {
        return UIView()
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<SocialSignInHelper>) {
    }
    
    func attemptLoginGoogle() {
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    /*func attemptLoginFb(completion: @escaping (_ result: FBSDKLoginManagerLoginResult?, _ error: Error?) -> Void) {
     let fbLoginManager: FBSDKLoginManager = FBSDKLoginManager()
     fbLoginManager.logOut()
     fbLoginManager.logIn(withReadPermissions: ["email"], from: UIApplication.shared.windows.last?.rootViewController) { (result, error) -> Void in
     completion(result, error)
     }
     }*/
    
}
