//
//  ProfCollectionView.swift
//  Blue-ePro
//
//  Created by Ryosuke Ozuno on 2021/12/16.
//



//import UIKit
//
//let imageArr = [
//    UIImage(named: "hitsuji-hai")!,
//    UIImage(named: "hitsuji-homeru")!,
//    UIImage(named: "hitsuji-okoru")!
//  ]
//
//var currentIndex = 0
//
//class ProfCollectionView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    }
//
//    @IBOutlet weak var collectionView: UICollectionView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        collectionView.delegate = self
//        collectionView.dataSource = self
//    }
//}
//
//extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    return imageArr.count
//  }
//
//  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCell
//    cell.image = imageArr[indexPath.item]
//    return cell
//  }
//
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
//  }
//
//  func scrollViewDidScroll(_ scrollView: UIScrollView) {
//    currentIndex = Int(scrollView.contentOffset.x / collectionView.frame.size.width)
//  }
//}
