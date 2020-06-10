//
//  ContentView.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/05/31.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showSideMenu = false
    
    init(){
        //NavigationBar のカスタマイズ
        UITableView.appearance().backgroundColor = .none//UIColor(named: "backgroundLight")
        UINavigationBar.appearance().barTintColor = UIColor(hex: "ed6a5a")
        UINavigationBar.appearance().backgroundColor = .none
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.white, .font : UIFont(name: "HiraMaruProN-W4", size: 20)!]
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack(alignment: .leading) {
                    RestaurantListPage()
                        .offset(x: self.showSideMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showSideMenu)
                    if self.showSideMenu {
                        SideMenu()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
                .navigationBarItems(leading: (
                    Button(action: {
                        withAnimation {
                            self.showSideMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                    }
                ))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
