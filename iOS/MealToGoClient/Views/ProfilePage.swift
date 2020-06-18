//
//  ProfilePage.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/10.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import SwiftUI

struct ProfilePage: View {
    @EnvironmentObject var viewModel: MainViewModel
    var body: some View {
        List {
            HStack {
                Text("ユーザー名:")
                Text(AppGlobalVariables.SignInClient.User.FullName)
            }
            HStack {
                Text("Email:")
                Text(AppGlobalVariables.SignInClient.User.Email)
            }
            HStack {
                Text("ユーザーID:")
                Text(AppGlobalVariables.SignInClient.User.UserId)
            }

            /*NavigationLink(destination: LaunchPage().environmentObject(MainViewModel())) {
                Text("Sign In")
            }*/
            
            Button(action: {
                AppGlobalVariables.SignInClient.signOutAll()
                withAnimation {
                    self.viewModel.SelectedPage = .Auth
                }
            }) {
                Text("Sign Out")
            }

        }
        .navigationBarTitle("Profile", displayMode: .inline)
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
            .environmentObject(MainViewModel())
    }
}
