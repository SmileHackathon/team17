//
//  ViewController.swift
//  eProf
//
//  Created by Ryosuke Ozuno on 2021/12/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapButton() {
        
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        
        navigationController?.pushViewController(vc, animated: true)
    }

}

