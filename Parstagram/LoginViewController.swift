//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Joseph Shimonov on 3/27/19.
//  Copyright © 2019 Joseph Shimonov. All rights reserved.
//

import UIKit
import Parse


class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //view.setFiveBackground(colorOne: Colors.princetonOrange, colorTwo: Colors.jasmine, colorThree: Colors.vividCerise, colorFour: Colors.grape, colorFive: Colors.iris)
        
        view.setThreeBackground(colorOne: Colors.brightOrange, colorTwo: Colors.eucalyplus, colorThree: Colors.richBlack)
        
        //loginButton.backgroundColor = Colors.princetonOrange
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 0.8
        loginButton.layer.borderColor = (Colors.black).cgColor
        
        
    }
    

    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password)
        { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
            
        }
        
    }
    
    @IBAction func onSignup(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground{ (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
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
