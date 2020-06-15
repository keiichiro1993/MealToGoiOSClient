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
import FBSDKLoginKit
//1076073232378-0me0bu5ba51sr6u9p10t5pr55gmbam3e.apps.googleusercontent.com
// server side:https://developers.facebook.com/docs/facebook-login/manually-build-a-login-flow#confirm
// https://qiita.com/haru15komekome/items/8f63a6273103489503a3

class SocialSignInClient: ObservableObject {
    var helper: SocialSignInHelper
    
    init() {
        helper = SocialSignInHelper()
    }
    
    static var User: UserInfo = UserInfo("DummyTaro","taro20200612")
    static var OnSignedIn: () -> Void = {}
    
    static func SetUserDataWithGoogle(_ user: GIDGoogleUser?) {
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
    
    static func SetUserDataWithFacebook(_ user: LoginManagerLoginResult) {
        User.IdToken = user.token!.tokenString
        getFacebookUserData()
    }
    
    func attemptLoginGoogle(onSignedIn: @escaping () -> Void) {
        SocialSignInClient.OnSignedIn = onSignedIn
        helper.attemptLoginGoogle()
    }
    
    func attemptLoginFb(onSignedIn: @escaping () -> Void) {
        helper.attemptLoginFb(completion: { (result, error) -> Void in
            if result != nil {
                SocialSignInClient.SetUserDataWithFacebook(result!)
                onSignedIn()
            }
        })
    }
    
    static private func getFacebookUserData() {
        let graphRequest : GraphRequest =
            GraphRequest(graphPath: "me",
                         parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"])

        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            if ((error) != nil) {
                print("Error: \(String(describing: error))")
            } else {
                let userProfile = (result as! NSDictionary)
                User.FullName = userProfile.object(forKey: "name") as? String ?? ""
                User.Email = userProfile.object(forKey: "email") as? String ?? ""
            }
        })
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
    
    func attemptLoginFb(completion: @escaping (_ result: LoginManagerLoginResult?, _ error: Error?) -> Void) {
        let fbLoginManager: LoginManager = LoginManager()
        fbLoginManager.logOut()
        fbLoginManager.logIn(permissions: ["public_profile", "email"], from: UIApplication.shared.windows.last?.rootViewController) { (result, error) -> Void in
            completion(result, error)
        }
    }
    
}
