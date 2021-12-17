//
//  LoginView.swift
//  Blue-ePro
//
//  Created by Ryosuke Ozuno on 2021/12/17.
//

import UIKit

class LoginView: UIViewController {

    @IBOutlet weak var SchoolName: UITextField!
    @IBOutlet weak var FamilyName: UITextField!
    @IBOutlet weak var FirstName: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.addBackground(name: "LoginBackGround")
    }


    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        }
}
