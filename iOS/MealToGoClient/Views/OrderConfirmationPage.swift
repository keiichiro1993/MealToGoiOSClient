//
//  OrderConfirmationPage.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/12.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import SwiftUI

struct OrderConfirmationPage: View {
    @EnvironmentObject var viewModel: MainViewModel
    var body: some View {
        VStack {
            Text("Confirm your order")
                .font(.largeTitle)
            List {
                VStack(alignment: .leading) {
                    HStack {
                        Text("受け取り可能時刻:")
                        Text("30分後")
                    }
                    Text("※衛生上、この時刻から 1 時間以内に受け取りを行ってください。")
                        .font(.caption)
                }
                HStack {
                    Text("商品数：")
                    Text(String(viewModel.OrderInfo.OrderItems.count))
                }
                VStack(alignment: .leading) {
                    Text("要望/店舗への連絡事項:")
                    MultilineTextField("Add comment here", text: $viewModel.OrderInfo.OrderComment, onCommit: {})
                        .padding()
                }
            }
            Spacer()
            Button(action: {}) {Text("Confirm Order")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth:.infinity,maxHeight: 60)
            }
            .frame(maxWidth: .infinity)
            .background(UIResources.AppThemeColor)
        }
    }
}

struct OrderConfirmationPage_Previews: PreviewProvider {
    static var previews: some View {
        OrderConfirmationPage()
            .environmentObject(MainViewModel())
    }
}
