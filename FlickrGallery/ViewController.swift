//
//  ViewController.swift
//  FlickrGallery
//
//  Created by Yuliia Khrupina on 6/25/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var textView: UITextField!
    @IBOutlet weak var clearTextFieldButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func eraseSearch() {}
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    // override func prepare(for segue: UIStoryboardSegue, sender: Any?) {}
    
    func willDisplay() {}
    
    func searchBarButtonTapped() {}
    
    func textSearchAction(text: String) {}
}

