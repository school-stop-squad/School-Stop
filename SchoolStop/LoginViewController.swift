//
//  LoginViewController.swift
//  SchoolStop
//
//  Created by Miro on 3/14/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onLogin(_ sender: Any) {
        let username = loginTextField.text!
        let password = passwordTextField.text!
        
        PFUser.logInWithUsername(inBackground:username, password:password) {
          (user, error) in
          if user != nil {
            // Do stuff after successful login.
              self.performSegue(withIdentifier: "loginSegue", sender: nil)

          } else {
            // The login failed. Check error to see why.
              print("Error: \(error?.localizedDescription)")

          }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = loginTextField.text
        user.password = passwordTextField.text
        
        user.signUpInBackground{(success,error) in
            if error != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print("Error: \(error?.localizedDescription)")
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

