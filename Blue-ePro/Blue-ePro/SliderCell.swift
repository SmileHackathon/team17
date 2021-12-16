//
//  SliderCell.swift
//  Blue-ePro
//
//  Created by Ryosuke Ozuno on 2021/12/16.
//

import UIKit

class SliderCell: UICollectionViewCell {
    @IBOutlet weak var imageField: UIImageView!
    
    var image: UIImage! {
      didSet {
        imageField.image = image
      }
    }
}
