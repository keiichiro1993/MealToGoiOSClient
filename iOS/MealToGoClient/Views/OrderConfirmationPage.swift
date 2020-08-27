//
//  OrderConfirmationPage.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/12.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import SwiftUI

struct OrderConfirmationPage: View {
    //@EnvironmentObject var viewModel: MainViewModel
    @ObservedObject var viewModel = OrderConfirmationPageViewModel()
    
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
                    Text(String(AppGlobalVariables.OrderCart.OrderItems.count))
                }
                HStack {
                    Text("合計金額：")
                    Text(String(viewModel.totalPrice))
                }
                VStack(alignment: .leading) {
                    Text("要望/店舗への連絡事項:")
                    MultilineTextField("Add comment here", text: $viewModel.OrderCart.OrderComment, onCommit: {})
                        .padding()
                }
                VStack(alignment: .leading) {
                    Button(action: {
                        self.viewModel.paymentContextDelegate.paymentContext?.presentPaymentOptionsViewController()
                    }){
                        Text("お支払い方法: 選択する ＞")//選んでたら表示を変えたい
                    }
                        /*Picker(selection: $viewModel.OrderCart.SelectedPaymentMethod.Name, label: Text("お支払い方法:")) {
                        ForEach(["クレジットカード", "PayPay", "LinePay"], id: \.self) { item in
                            Text(item)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .labelsHidden()
                    Text("カード番号")
                        .font(.footnote)
                    HStack {
                        TextField("0000",text: $viewModel.OrderCart.SelectedPaymentMethod.Fields[0])
                        TextField("0000",text: $viewModel.OrderCart.SelectedPaymentMethod.Fields[1])
                        TextField("0000",text: $viewModel.OrderCart.SelectedPaymentMethod.Fields[2])
                        TextField("0000",text: $viewModel.OrderCart.SelectedPaymentMethod.Fields[3])
                    }
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)*/
                }
            }
            Spacer()
            Button(action: {
                self.viewModel.paymentContextDelegate.RequestPayment()
            }) {Text("注文を確定する")
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
    }
}
