//
//  ViewController.swift
//  FlickrGallery
//
//  Created by Yuliia Khrupina on 6/25/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var textView: UITextField!
    @IBOutlet weak var clearTextFieldButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let FLICKR_SEARCH_URL = "https://www.flickr.com/services/api/explore/flickr.photos.search"
    let API_KEY = "ff83247590ff7fe2a1967cc9add636e9"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        requestTest(searchWord: "cat")
    }
    
    func requestTest(searchWord: String) {
        let requestURL = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(API_KEY)&text=\(searchWord)&format=json&nojsoncallback=1"
        
        AF.request(requestURL, method: .get).responseJSON { (responce) in
            switch responce.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                print(castingValue)
               // guard let userData = Mapper<NewsListRestObjects>().map(JSON: castingValue) else { return }
               // self.articles = (userData.articles)!
               // print(self.articles.count)
               // self.table.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getImageUrl(serverId: String, id: String, secret: String, size: String) -> String {
        return "https://live.staticflickr.com/\(serverId)/\(id)_\(secret)_\(size).jpg"
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

