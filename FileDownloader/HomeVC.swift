//
//  HomeVC.swift
//  FileDownloader
//
//  Created by Mostafa sayed on 5/17/19.
//  Copyright © 2019 Mostafa sayed. All rights reserved.
//

import UIKit

enum RefreshType {
    case PullToRefresh
    case Pagination
}
class HomeVC: UIViewController {
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    var refreshControl: UIRefreshControl!
    var images = [ImageItem]()
    let service = Service()
    var refresh: RefreshType?
    var pageNumber = 0
    var totalPages = 9
    override func viewDidLoad() {
        super.viewDidLoad()
        initRefresher()
        loadImages()
    }
    func loadImages() {
        service.getData() {images in
            self.refreshControl?.endRefreshing()
            self.startEndActivity(start: false)
            if images != nil {
                if self.refresh != nil && self.refresh! == .PullToRefresh {
                    self.images.removeAll()
                }
                self.images.append(contentsOf: images!)
                self.refresh = nil
                self.collectionView.reloadData()
            }
        }
    }

    func startEndActivity(start: Bool) {
        if start {
            activity.isHidden = false
            activity.startAnimating()
        }
        else {
            activity.isHidden = true
            activity.stopAnimating()
        }
    }

    func initRefresher() {
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(self.refreshStream), for: .valueChanged)
        refreshControl = refresher
        if !collectionView.subviews.contains(refreshControl) {
            collectionView!.addSubview(refreshControl)
        }
    }
    @objc func refreshStream() {
        //Reset Pagination counters
        pageNumber = 0
        refresh = .PullToRefresh
        loadImages()
    }
    
}
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCell else {return UICollectionViewCell()}
        cell.downloadImage(imgUrl: images[indexPath.row].urls?.regular ?? "")
        return cell
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = floor(collectionView.frame.width)
        return CGSize(width: collectionWidth/2.1, height: collectionWidth/1.8)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == collectionView {
            let bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height
            if floor(bottomEdge) >= floor(scrollView.contentSize.height) {
                if refresh != .PullToRefresh {
                    pageNumber+=1
                    if pageNumber < totalPages {
                        refresh = .Pagination
                        startEndActivity(start: true)
                        loadImages()
                    }
                }
            }
        }
    }
    
}
