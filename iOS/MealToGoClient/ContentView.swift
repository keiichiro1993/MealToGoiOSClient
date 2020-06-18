//
//  ContentView.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/05/31.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MainViewModel
    
    init(){
        //NavigationBar のカスタマイズ
        UITableView.appearance().backgroundColor = .none//UIColor(named: "backgroundLight")
        UINavigationBar.appearance().barTintColor = UIResources.AppThemeUIColor
        UINavigationBar.appearance().backgroundColor = .none
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.white, .font : UIFont(name: "HiraMaruProN-W4", size: 20)!]
        UINavigationBar.appearance().tintColor = .white
        
        viewModel = MainViewModel()
    }
    
    var body: some View {
        let dragGesture = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.viewModel.ShowSideMenu = false
                    }
                }
        }
        
        return GeometryReader { geometry in
            NavigationView {
                ZStack(alignment: .leading) {
                    ZStack(alignment: .leading) {
                        if self.viewModel.SelectedPage == .FindOnList {
                            RestaurantListPage()
                                .environmentObject(self.viewModel)
                        } else if self.viewModel.SelectedPage == .FindOnMap {
                            RestaurantMapPage()
                                .edgesIgnoringSafeArea(.all)
                        } else if self.viewModel.SelectedPage == .Profile {
                            ProfilePage()
                                .environmentObject(self.viewModel)
                        } else if self.viewModel.SelectedPage == .Auth {
                            LaunchPage()
                                .environmentObject(self.viewModel)
                        }
                    }
                    .offset(x: self.viewModel.ShowSideMenu ? geometry.size.width/2 : 0)
                    .disabled(self.viewModel.ShowSideMenu)
                    .environmentObject(self.viewModel)
                    
                    
                    if self.viewModel.ShowSideMenu {
                        SideMenu()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                            .environmentObject(self.viewModel)
                    }
                }
                .navigationBarItems(leading: (
                    Button(action: {
                        withAnimation {
                            self.viewModel.ShowSideMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                }), trailing: (
                    NavigationLink(destination: CartPage().environmentObject(self.viewModel)) {
                        Image(systemName: "cart")
                            .imageScale(.large)
                }))
                    .gesture(dragGesture)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone 11 Pro"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
