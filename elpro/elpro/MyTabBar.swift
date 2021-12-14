//
//  MyTabBar.swift
//  elpro
//
//  Created by enPiT2016MBP-01 on 2021/12/14.
//

import UIKit

class MyTabBar: UITabBar {

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        size.height = 58
        return size
    }

}
