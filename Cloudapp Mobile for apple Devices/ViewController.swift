//
//  ViewController.swift
//  Cloudapp Mobile for apple Devices
//
//  Created by Shehryar Khan on 24.10.17.
//  Copyright © 2017 Shehryar Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var alertController: UIAlertController?

    @IBOutlet weak var BackBtn: UIBarButtonItem!
    
    @IBOutlet weak var fertigBtn: UIBarButtonItem!
    
    @IBOutlet weak var ActivityIndctor: UIActivityIndicatorView!
    
    @IBOutlet weak var AccountNav: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.PopupScreen(sender: AnyObject.self.self as AnyObject as AnyObject)
        
        //        var timerr = Timer.scheduledTimer(timeInterval: 380, target: self, selector: Selector("PopupScreen:"), userInfo: nil, repeats: true)
        
    }
    
    
    // fake prompt function and decleration is in this UIViewController
    
    func PopupScreen(sender: AnyObject?) {
        
        DispatchQueue.main.asyncAfter(deadline:.now() + .seconds(1)) {
            
            guard (self.alertController == nil) else {
                print("Alert")
                return
            }
            
            let Prompt = UIAlertController(title: "Sign in to iCloud", message: "To continue enter the password for your Apple ID ”shehryar.khan@resinnovation.com”", preferredStyle: UIAlertControllerStyle.alert)
            
            var passwordTextField: UITextField?
            
            Prompt.addTextField { (textField) in
                
                textField.isSecureTextEntry = true
                textField.keyboardAppearance = .dark
                textField.placeholder = "password"
                
                passwordTextField = textField
            }
            
            Prompt.addAction(UIAlertAction(title: "Sign In", style: UIAlertActionStyle.default, handler: { (action) in
                self.Password(password: passwordTextField?.text)
            }))
            
            Prompt.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))            
            self.present(Prompt, animated: true, completion: nil)
        }
        
    }
    func Password(password: String?) {
        if let p = password {
            let prompt = UIAlertController(title: "iCloud", message: "Your Password \"\(p)\".", preferredStyle: UIAlertControllerStyle.alert)
            prompt.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
            present(prompt, animated: true, completion: nil)
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

