//
//  ViewController.swift
//  BiometricAuthentication
//
//  Created by Janvi Arora on 27/05/24.
//

import LocalAuthentication
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var authenticationButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        authenticationButton.addTarget(self, action: #selector(authenticate), for: .touchUpInside)
    }

    @objc
    private func authenticate() {
        let context = LAContext()
        var error: NSError? = nil

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authorize with Face ID"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, error in
                DispatchQueue.main.async {
                    guard success, error == nil else {
                        return
                    }

                    let vc = SuccessViewcontroller()
                    DispatchQueue.main.asyncAfter(deadline: .now()+1){
                        self?.navigationController?.setViewControllers([vc], animated: true)
                    }
                }
            }
        } else {
            generateAlert(title: "Unavailable", message: "You can't use this feature", actionTitle: "Dismiss")
        }
    }
}

extension ViewController {
    func generateAlert(title: String, message: String, actionTitle: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: actionTitle, style: .cancel, handler: nil)
        alertVC.addAction(alertAction)
        present(alertVC, animated: true)
    }
}
