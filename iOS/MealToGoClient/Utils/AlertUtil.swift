//
//  AlertUtil.swift
//  MealToGoClient
//
//  Created by 若狭渓一郎 on 2020/06/26.
//  Copyright © 2020 Kurosuke. All rights reserved.
//

import Foundation
import UIKit

class AlertUtil {
    static func ShowErrorAlert(error: NSError) {
        let alert: UIAlertController = UIAlertController(title: "おや？何かがおかしいようです。", message: "Error: \(error.domain)\nMessage:\(error.localizedDescription)", preferredStyle:  .alert)
        
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler:{
            (action: UIAlertAction!) -> Void in
            print("OK")
        })
        alert.addAction(defaultAction)
        
        alert.presentAlert()
    }
}


// https://stackoverflow.com/questions/58548569/how-do-i-present-a-uialertcontroller-in-swiftui
extension UIViewController {
    class func getCurrentVC() -> UIViewController? {
        var result: UIViewController?
        var window = UIApplication.shared.windows.first { $0.isKeyWindow }
        if window?.windowLevel != UIWindow.Level.normal {
            let windows = UIApplication.shared.windows
            for tmpWin in windows {
                if tmpWin.windowLevel == UIWindow.Level.normal {
                    window = tmpWin
                    break
                }
            }
        }
        let fromView = window?.subviews[0]
        if let nextRespnder = fromView?.next {
            if nextRespnder.isKind(of: UIViewController.self) {
                result = nextRespnder as? UIViewController
                result?.navigationController?.pushViewController(result!, animated: false)
            } else {
                result = window?.rootViewController
            }
        }
        return result
    }
}

extension UIAlertController {
    //Setting our Alert ViewController, presenting it.
    func presentAlert() {
        UIViewController.getCurrentVC()?.present(self, animated: true, completion: nil)
    }
    
    func dismissAlert() {
        UIViewController.getCurrentVC()?.dismiss(animated: true, completion: nil)
    }
}
