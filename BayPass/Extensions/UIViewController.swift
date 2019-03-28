//
//  ViewController.swift
//  BayPass
//
//  Created by Tim Roesner on 3/2/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//

import UIKit

extension UIViewController {
    func displayAlert(title: String, msg: String, dismissAfter: Bool) {
        let confirm = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        confirm.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (_: UIAlertAction) in
            if dismissAfter {
                self.dismissOrPop(animated: true)
            }
        }))

        present(confirm, animated: true, completion: nil)
    }

    func dismissOrPop(animated: Bool) {
        if let navController = self.navigationController {
            navController.popViewController(animated: animated)
        } else {
            dismiss(animated: animated, completion: nil)
        }
    }
}
