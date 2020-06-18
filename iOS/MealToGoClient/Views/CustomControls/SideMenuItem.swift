//
//  SideMenuItem.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/10.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import SwiftUI

struct SideMenuItem: View {
    var item: (String, MainViewModel.Pages, Int)
    @EnvironmentObject var viewModel: MainViewModel
    var body: some View {
        Button(action: {
            withAnimation {
                self.viewModel.SelectedPage = self.item.1
                self.viewModel.ShowSideMenu = false
            }
        }) {
            VStack {
                HStack {
                    Image(systemName: item.0)
                        .foregroundColor(.gray)
                        .imageScale(.large)
                        .frame(width: 20)
                    Text(item.1.rawValue)
                        .foregroundColor(.gray)
                        .font(.headline)
                    Spacer()
                }
                .padding()
                //.padding(.top, item.2 == 0 ? 90 : 0)
            }
        }
    }
}

struct SideMenuItem_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuItem(item: ("person", .Profile, 0))
    }
}
