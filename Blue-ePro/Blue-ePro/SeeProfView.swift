//
//  SeeProfView.swift
//  Blue-ePro
//
//  Created by Ryosuke Ozuno on 2021/12/16.
//

import UIKit



class SeeProfView: UIViewController {


    /// ページ数(サンプルのため固定)
    private let numberOfPages = 10


    @IBOutlet private weak var mainScrollView: UIScrollView!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet weak var button: UIButton!


    /// 現在のページインデックス
    private var currentPage = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageControl()
    }


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupMainScrollView()
        (0..<numberOfPages).forEach { page in
            let subScrollView = generateSubScrollView(at: page)
            mainScrollView.addSubview(subScrollView)
            let imageView = generateImageView(at: page)
            subScrollView.addSubview(imageView)
        }
    }

    private func setupPageControl() {
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage


        // タップされたときのイベントハンドリングを設定
        pageControl.addTarget(
            self,
            action: #selector(didValueChangePageControl),
            for: .valueChanged
        )
    }

    private func setupMainScrollView() {
        mainScrollView.delegate = self
        mainScrollView.isPagingEnabled = true
        mainScrollView.showsVerticalScrollIndicator = false
        mainScrollView.showsHorizontalScrollIndicator = false
        // コンテンツ幅 = ページ数 x ページ幅
        mainScrollView.contentSize = CGSize(
            width: calculateX(at: numberOfPages),
            height: mainScrollView.bounds.height
        )
    }

    private func generateSubScrollView(at page: Int) -> UIScrollView {
        let frame = calculateSubScrollViewFrame(at: page)
        let subScrollView = UIScrollView(frame: frame)

        subScrollView.delegate = self
        subScrollView.maximumZoomScale = 3.0
        subScrollView.minimumZoomScale = 1.0
        subScrollView.showsHorizontalScrollIndicator = false
        subScrollView.showsVerticalScrollIndicator = false

        // ダブルタップされたときのイベントハンドリングを設定
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didDoubleTapSubScrollView(_:)))
        gesture.numberOfTapsRequired = 2
        subScrollView.addGestureRecognizer(gesture)

        return subScrollView
    }

    private func generateImageView(at page: Int) -> UIImageView {
        let frame = mainScrollView.bounds
        let imageView = UIImageView(frame: frame)

        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = image(at: page)

        return imageView
    }

    /// ページコントロールを操作された時
    @objc private func didValueChangePageControl() {
        currentPage = pageControl.currentPage
        let x = calculateX(at: currentPage)
        mainScrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }

    /// サブスクロールビューがダブルタップされた時
    @objc private func didDoubleTapSubScrollView(_ gesture: UITapGestureRecognizer) {
        guard let subScrollView = gesture.view as? UIScrollView else { return }

        if subScrollView.zoomScale < subScrollView.maximumZoomScale {
            // タップされた場所を中心に拡大する
            let location = gesture.location(in: subScrollView)
            let rect = calculateRectForZoom(location: location, scale: subScrollView.maximumZoomScale)
            subScrollView.zoom(to: rect, animated: true)
        } else {
            subScrollView.setZoomScale(subScrollView.minimumZoomScale, animated: true)
        }
    }

    /// ページ幅 x position でX位置を計算
    private func calculateX(at position: Int) -> CGFloat {
        return mainScrollView.bounds.width * CGFloat(position)
    }

    /// スクロールビューのオフセット位置からページインデックスを計算
    private func calculatePage(of scrollView: UIScrollView) -> Int {
        let width = scrollView.bounds.width
        let offsetX = scrollView.contentOffset.x
        let position = (offsetX - (width / 2)) / width
        return Int(floor(position) + 1)
    }

    /// タップされた位置と拡大率から拡大後のCGRectを計算する
    private func calculateRectForZoom(location: CGPoint, scale: CGFloat) -> CGRect {
        let size = CGSize(
            width: mainScrollView.bounds.width / scale,
            height: mainScrollView.bounds.height / scale
        )
        let origin = CGPoint(
            x: location.x - size.width / 2,
            y: location.y - size.height / 2
        )
        return CGRect(origin: origin, size: size)
    }

    /// サブスクロールビューのframeを計算
    private func calculateSubScrollViewFrame(at page: Int) -> CGRect {
        var frame = mainScrollView.bounds
        frame.origin.x = calculateX(at: page)
        return frame
    }

    private func resetZoomScaleOfSubScrollViews(without exclusionSubScrollView: UIScrollView) {
        for subview in mainScrollView.subviews {
            guard
                let subScrollView = subview as? UIScrollView,
                subScrollView != exclusionSubScrollView
                else {
                    continue
            }
            subScrollView.setZoomScale(subScrollView.minimumZoomScale, animated: false)
        }
    }

    private func image(at page: Int) -> UIImage? {
        return UIImage(named: "\(page)")
    }
}

extension SeeProfView: UIScrollViewDelegate {

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView != mainScrollView { return }

        let page = calculatePage(of: scrollView)
        if page == currentPage { return }
        currentPage = page

        pageControl.currentPage = page

        // 他のすべてのサブスクロールビューの拡大率をリセット
        resetZoomScaleOfSubScrollViews(without: scrollView)
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollView.subviews.first as? UIImageView
    }

    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        guard let imageView = scrollView.subviews.first as? UIImageView else { return }

        scrollView.contentInset = UIEdgeInsets(
            top: max((scrollView.frame.height - imageView.frame.height) / 2, 0),
            left: max((scrollView.frame.width - imageView.frame.width) / 2, 0),
            bottom: 0,
            right: 0
        )
    }
}

//class SeeProfView: UIViewController, UIScrollViewDelegate {
//
//    private var scrollView: UIScrollView!
//    private var pageControl: UIPageControl!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // scrollViewの画面表示サイズを指定
//        scrollView = UIScrollView(frame: CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: 200))
//        // scrollViewのサイズを指定（幅は1メニューに表示するViewの幅×ページ数）
//        scrollView.contentSize = CGSize(width: self.view.frame.size.width*3, height: 200)
//        // scrollViewのデリゲートになる
//        scrollView.delegate = self
//        // メニュー単位のスクロールを可能にする
//        scrollView.isPagingEnabled = true
//        // 水平方向のスクロールインジケータを非表示にする
//        scrollView.showsHorizontalScrollIndicator = false
//        self.view.addSubview(scrollView)
//
//        // scrollView上にUIImageViewをページ分追加する(今回は3ページ分)
//        let imageView1 = createImageView(x: 0, y: 0, width: self.view.frame.size.width, height: 200, image: "image1")
//        scrollView.addSubview(imageView1)
//
//        let imageView2 = createImageView(x: self.view.frame.size.width, y: 0, width: self.view.frame.size.width, height: 200, image: "image2")
//        scrollView.addSubview(imageView2)
//
//        let imageView3 = createImageView(x: self.view.frame.size.width*2, y: 0, width: self.view.frame.size.width, height: 200, image: "image3")
//        scrollView.addSubview(imageView3)
//
//        // pageControlの表示位置とサイズの設定
//        pageControl = UIPageControl(frame: CGRect(x: 0, y: 370, width: self.view.frame.size.width, height: 30))
//        // pageControlのページ数を設定
//        pageControl.numberOfPages = 3
//        // pageControlのドットの色
//        pageControl.pageIndicatorTintColor = UIColor.lightGray
//        // pageControlの現在のページのドットの色
//        pageControl.currentPageIndicatorTintColor = UIColor.black
//        self.view.addSubview(pageControl)
//    }
//
//    // UIImageViewを生成
//    func createImageView(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, image: String) -> UIImageView {
//        let imageView = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
//        let image = UIImage(named:  image)
//        imageView.image = image
//        return imageView
//    }
//}
//
//// scrollViewのページ移動に合わせてpageControlの表示も移動させる
//extension SeeProfView: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
//    }
//}
