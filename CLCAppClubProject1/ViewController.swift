//
//  ViewController.swift
//  CLCAppClubProject1
//
//  Created by Trinity on 6/9/2018.
//  Copyright © 2018 CLC. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    //var handle: AuthStateDidChangeListenerHandle?

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var PasswordText: UITextField!
    @IBOutlet weak var SegmentControl: UISegmentedControl!
    @IBOutlet weak var actionButton: UIButton!
    
    
    @IBAction func action(_ sender: UIButton) {
        if emailText.text != "" && PasswordText.text != ""
        {
            if SegmentControl.selectedSegmentIndex == 0 //login user
            {
                Auth.auth().signIn(withEmail: emailText.text!, password: PasswordText.text!, completion: {(user, error) in
                        if user != nil
                        {
                            //sign in successful
                            print("SUCCESS")
                            self.performSegue(withIdentifier: "segue", sender: self)
                        }
                        else
                        {
                            if let myError = error?.localizedDescription
                            {
                                print(myError)
                            }
                            else
                            {
                                print("ERROR")
                            }
                        }
                })
            }
            else //sign up user
            {
                Auth.auth().createUser(withEmail: emailText.text!, password: PasswordText.text!, completion: {(user, error) in
                    if user != nil
                    {
                        print("SUCCESS")
                        self.performSegue(withIdentifier: "segue", sender: self)
                    }
                    else
                    {
                        if let myError = error?.localizedDescription
                        {
                            print(myError)
                        }
                        else
                        {
                            print("ERROR")
                        }
                    }
                })
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

