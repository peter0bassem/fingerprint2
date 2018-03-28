//
//  ViewController.swift
//  fingerprint2
//
//  Created by Peter Bassem on 3/28/18.
//  Copyright © 2018 Peter Bassem. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showAlertController(_ message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func AuthenticateButtonEvent(_ sender: Any) {
        let context = LAContext()
        var error: NSError?
        let reason = "Authenticatin with touchID"
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics		, localizedReason: reason, reply: { (success, error) in
                if success {
                    self.showAlertController("Touch ID Authentication Succeeded")
                } else {
                    self.showAlertController("Touch ID Authentication Failed")
                }
            })
        } else {
            showAlertController("Touch Id not available")
        }
    }
}

