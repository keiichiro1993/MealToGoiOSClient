//
//  ContentView.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/05/31.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //@State var showSideMenu = false
    @ObservedObject var viewModel = MainViewModel()
    
    init(){
        //NavigationBar のカスタマイズ
        UITableView.appearance().backgroundColor = .none//UIColor(named: "backgroundLight")
        UINavigationBar.appearance().barTintColor = UIResources.AppThemeUIColor
        UINavigationBar.appearance().backgroundColor = .none
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.white, .font : UIFont(name: "HiraMaruProN-W4", size: 20)!]
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some View {
        let dragGesture = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.viewModel.showSideMenu = false
                    }
                }
        }
        
        return GeometryReader { geometry in
            NavigationView {
                ZStack(alignment: .leading) {
                    ZStack(alignment: .leading) {
                        if self.viewModel.SelectedPage == "Find on List" {
                            RestaurantListPage()
                                .environmentObject(self.viewModel)
                        } else if self.viewModel.SelectedPage == "Find on Map" {
                            RestaurantMapPage()
                                .edgesIgnoringSafeArea(.all)
                        } else if self.viewModel.SelectedPage == "Profile" {
                            ProfilePage()
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .offset(x: self.viewModel.showSideMenu ? geometry.size.width/2 : 0)
                    .disabled(self.viewModel.showSideMenu)
                    .environmentObject(self.viewModel)
                    
                    
                    if self.viewModel.showSideMenu {
                        SideMenu()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                            .environmentObject(self.viewModel)
                    }
                }
                .navigationBarItems(leading: (
                    Button(action: {
                        withAnimation {
                            self.viewModel.showSideMenu.toggle()
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
        ContentView()
    }
}
