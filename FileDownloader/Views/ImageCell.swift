//
//  ImageCell.swift
//  FileDownloader
//
//  Created by Mostafa sayed on 5/17/19.
//  Copyright © 2019 Mostafa sayed. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    var fileDownloader: FileDownloader!
    @IBOutlet weak var image: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func downloadImage(imgUrl: String) {
        image.image = nil
        if let url = URL(string: imgUrl) {
            fileDownloader = FileDownloader(url: url)
            fileDownloader.download() {data in
                self.image.image = UIImage(data: data)
            }
        }
        
    }
}
