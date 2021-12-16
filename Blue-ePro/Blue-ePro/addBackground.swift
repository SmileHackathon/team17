//
//  addBackground.swift
//  Blue-ePro
//
//  Created by Ryosuke Ozuno on 2021/12/16.
//

import Foundation
import UIKit

//https://qiita.com/ninoko1995/items/f068c812b5175275689a
//【swift5】背景画像をスクリーンサイズに合わせて表示させる方法

extension UIView {
    func addBackground(name: String) {
        // スクリーンサイズの取得
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height

        // スクリーンサイズにあわせてimageViewの配置
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        //imageViewに背景画像を表示
        imageViewBackground.image = UIImage(named: name)

        // 画像の表示モードを変更。
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill

        // subviewをメインビューに追加
        self.addSubview(imageViewBackground)
        // 加えたsubviewを、最背面に設置する
        self.sendSubviewToBack(imageViewBackground)
    }
}

/*
 他のviewControllerで以下のように記述すると、背景画像をFull表示することができる。
 
 override func viewDidLoad() {
     super.viewDidLoad()

     // 表示したい画像の名前(拡張子含む)を引数とする。
     self.view.addBackground(name: "画像名")
 }
 */
