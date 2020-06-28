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
    let settings = AppGlobalSettings()
    
    init() {
        helper = SocialSignInHelper()
        User = UserInfo("", "")
    }
    
    @Published var User: UserInfo
    var onSignedIn: () -> Void = {}
    
    func setUserDataWithGoogle(_ user: GIDGoogleUser?) {
        if(user != nil) {
            let newUser = UserInfo("","")
            newUser.UserId = user!.userID                  // For client-side use only!
            newUser.IdToken = user!.authentication.idToken // Safe to send to the server
            newUser.FullName = user!.profile.name
            newUser.GivenName = user!.profile.givenName
            newUser.FamilyName = user!.profile.familyName
            newUser.Email = user!.profile.email
            self.User = newUser
            
            settings.AuthMethod = .Google
            
            onSignedIn()
            //Clear
            onSignedIn = {}
            //print("token: \(user!.authentication.idToken ?? "none")")
            NSLog("Google token expiration: \(user!.authentication.idTokenExpirationDate ?? Date())")
            
            NSLog("Authenticating with MtG...")
            /*let postUrl = URL(string: "http://127.0.0.1:8081/users/oauth2")
            let postData = """
                {
                "externalToken" : "\(user!.authentication.idToken ?? "none")",
                "authenticationProvider" : "google"
                }
                """.data(using: .utf8)
            do {
                let client = HttpClient()
                let response = try client.PostAsync(url: postUrl!, body: postData!)
                NSLog("response: \(response.Body!)")
            } catch let error as NSError {
                NSLog("Exception occured in auth.")
                AlertUtil.ShowErrorAlert(error: error)
            }*/
        }
    }
    
    func setUserDataWithFacebook(_ user: LoginManagerLoginResult) {
        getFacebookUserData(user.token!.tokenString)
        
        settings.AuthMethod = .Facebook
    }
    
    func signOutAll() {
        //SignoutFacebook
        let fbLoginManager: LoginManager = LoginManager()
        fbLoginManager.logOut()
        //SignoutGoogle
        GIDSignIn.sharedInstance().signOut()
        
        settings.AuthMethod = .None
        self.User = UserInfo("", "")
    }
    
    
    func attemptLoginGoogle(onSignedIn: @escaping () -> Void) {
        self.onSignedIn = onSignedIn
        helper.attemptLoginGoogle()
    }
    
    func attemptLoginFb(onSignedIn: @escaping () -> Void) {
        helper.attemptLoginFb(completion: { (result, error) -> Void in
            if result != nil {
                self.setUserDataWithFacebook(result!)
                onSignedIn()
            }
        })
    }
    
    private func getFacebookUserData(_ token: String) {
        let graphRequest : GraphRequest =
            GraphRequest(graphPath: "me",
                         parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"])
        
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            if ((error) != nil) {
                print("Error: \(String(describing: error))")
            } else {
                let newUser = UserInfo("","")
                let userProfile = (result as! NSDictionary)
                newUser.FullName = userProfile.object(forKey: "name") as? String ?? ""
                newUser.Email = userProfile.object(forKey: "email") as? String ?? ""
                newUser.FamilyName = userProfile.object(forKey: "last_name") as? String ?? ""
                newUser.GivenName = userProfile.object(forKey: "first_name") as? String ?? ""
                newUser.UserId = userProfile.object(forKey: "id") as? String ?? ""
                newUser.IdToken = token
                self.User = newUser
            }
        })
    }
    
    func checkIfAuthenticated() -> Bool{
        let authMethod = settings.AuthMethod
        switch authMethod {
        case .Facebook:
            if let token = AccessToken.current, !token.isExpired {
                // User is logged in, do work such as go to next view controller.
                getFacebookUserData(token.tokenString)
                return true
            }
            return false;
        case .Google:
            if GIDSignIn.sharedInstance().hasPreviousSignIn() {
                GIDSignIn.sharedInstance().restorePreviousSignIn()
                return true
            } else {
                return false
            }
        default:
            return false;
        }
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
