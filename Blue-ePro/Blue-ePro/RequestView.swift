//
//  RequestView.swift
//  Blue-ePro
//
//  Created by Ryosuke Ozuno on 2021/12/17.
//

import UIKit
import DropDown

class RequestView: UIViewController {

    @IBOutlet weak var vwDropDown: UIView!
    @IBOutlet weak var lblTitle: UILabel!

    @IBOutlet weak var onSend: UIButton!
    
    let dropDown = DropDown()
    let dropDownValues = ["阿部伊緒莉 ちゃん","藤野加代 ちゃん","森本真以 ちゃん"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBackground(name: "background")
        
        onSend.backgroundColor = UIColor(hex: "8ACC1E")
        
        DropDown.appearance().cornerRadius = 10
        
        lblTitle.text = "なまえをえらんでね"
        
        dropDown.anchorView = vwDropDown
        dropDown.dataSource = dropDownValues
        
        // Top of drop down will be below the anchorView
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .bottom
        
        // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.lblTitle.text = dropDownValues[index]
        }
    }

    @IBAction func ShowPeopleOptions(_ sender:Any) {
        dropDown.show()
    }
}
