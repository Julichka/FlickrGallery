//
//  DetailViewController.swift
//  FlickrGallery
//
//  Created by Yuliia Khrupina on 6/25/22.
//

import Foundation
import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    var photo: Photo?
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = photo?.getImageUrl(size: "w")
        print("-----------------------")
        print(urlString)
        
        guard let url = URL.init(string: urlString ?? "") else {
            return
        }
        
        image.kf.setImage(with: url)
        label.text = photo?.title
    }
}
