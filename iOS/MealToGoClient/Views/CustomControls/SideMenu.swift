//
//  SideBar.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/09.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import SwiftUI

struct SideMenu: View {
    var menuItems = [("person", MainViewModel.Pages.Profile), ("list.bullet.indent", MainViewModel.Pages.FindOnList), ("map", MainViewModel.Pages.FindOnMap)]
    @EnvironmentObject var viewModel: MainViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(menuItems.indices, id: \.self) { index in
                VStack {
                    if(self.viewModel.SelectedPage == self.menuItems[index].1) {
                        SideMenuItem(item: (self.menuItems[index].0, self.menuItems[index].1, index))
                            .environmentObject(self.viewModel)
                            .background(UIResources.AppThemeHighlightColor)
                            .transition(.opacity)
                    } else {
                        SideMenuItem(item: (self.menuItems[index].0, self.menuItems[index].1, index))
                            .environmentObject(self.viewModel)
                            .transition(.opacity)
                    }
                }
            }
            Spacer()
            NavigationLink(destination: SettingsPage()) {
                HStack {
                    Image(systemName: "gear")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                        .frame(width: 20)
                    Text("Settings")
                        .foregroundColor(.gray)
                        .font(.headline)
                    Spacer()
                }
                .padding()
                .padding(.bottom, 20)
                .background(Color(hex: "#111111"))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(hex: "#333333"))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
            .environmentObject(MainViewModel())
    }
}
