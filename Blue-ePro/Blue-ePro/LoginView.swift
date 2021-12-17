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
    
    @IBOutlet weak var onLogin: UIButton!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.addBackground(name: "LoginBackGround")
        onLogin.backgroundColor = UIColor(hex: "8ACC1E")
    }


    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let v = Int("000000" + hex, radix: 16) ?? 0
        let r = CGFloat(v / Int(powf(256, 2)) % 256) / 255
        let g = CGFloat(v / Int(powf(256, 1)) % 256) / 255
        let b = CGFloat(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }
}
