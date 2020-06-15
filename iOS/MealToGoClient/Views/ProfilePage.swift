//
//  ProfilePage.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/10.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import SwiftUI

struct ProfilePage: View {
    var body: some View {
        List {
            HStack {
                Text("ユーザー名:")
                Text(SocialSignInClient.User.FullName)
            }
            HStack {
                Text("Email:")
                Text(SocialSignInClient.User.Email)
            }
            HStack {
                Text("ユーザーID:")
                Text(SocialSignInClient.User.UserId)
            }

            NavigationLink(destination: LaunchPage()) {
                Text("Sign In")
            }
        }
        .navigationBarTitle("Profile", displayMode: .inline)
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
