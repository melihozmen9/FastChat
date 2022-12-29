//
//  RegisterViewController.swift
//  FastChat
//
//  Created by Kullanici on 28.12.2022.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    var warning : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        warningLabel.text = warning
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          // ...
            if let e = error {
                self.warning = e.localizedDescription
                print(e.localizedDescription)
            } else {
                // navigate to the chatViewController
                self.performSegue(withIdentifier: K.registerToChat, sender: self)
            }
        }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
