//
//  LaunchPage.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/14.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

// https://medium.com/@dinesh10c04/swiftui-adding-a-custom-back-button-to-navigation-bar-c96cd4e30f60

import SwiftUI

struct LaunchPage: View {
    @EnvironmentObject var viewModel: MainViewModel
    init(){
        //NavigationBar のカスタマイズ
        UITableView.appearance().backgroundColor = .none//UIColor(named: "backgroundLight")
        UINavigationBar.appearance().barTintColor = UIResources.AppThemeUIColor
        UINavigationBar.appearance().backgroundColor = .none
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.white, .font : UIFont(name: "HiraMaruProN-W4", size: 20)!]
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some View {
        ZStack {
            UIResources.AppBackgroundGradient.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Meal To Go")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Spacer()
                SignInButtons(onSignedIn: {
                    //self.mode.wrappedValue.dismiss()
                    withAnimation {
                        self.viewModel.SelectedPage = .FindOnList
                    }
                })
            }
            .padding()
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct LaunchPage_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone 11 Pro"], id: \.self) { deviceName in
            LaunchPage()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
                .environmentObject(MainViewModel())
        }
    }
}
