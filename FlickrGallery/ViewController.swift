//
//  ViewController.swift
//  FlickrGallery
//
//  Created by Yuliia Khrupina on 6/25/22.
//

import UIKit
import Alamofire
import ObjectMapper
import Kingfisher

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var textView: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let cellReuseIdentifier = "CellItem"
    
    let FLICKR_SEARCH_URL = "https://www.flickr.com/services/api/explore/flickr.photos.search"
    let API_KEY = "ff83247590ff7fe2a1967cc9add636e9"
    
    var photos : Array<Photo> = []
    let childView = SpinnerViewController()
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        requestTest(searchWord: textField.text ?? "")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.textView.addTarget(self, action: #selector(self.textFieldDidChange(sender:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(sender: UITextField){
        requestTest(searchWord: sender.text)
    }
    
    func requestTest(searchWord: String?) {
        print(searchWord)
        if (searchWord == nil) {
            return
        }
        let requestURL = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(API_KEY)&text=\(searchWord ?? "")&format=json&nojsoncallback=1"
        
        AF.request(requestURL, method: .get).responseJSON { (responce) in
            switch responce.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                print(castingValue)
                guard let data = Mapper<PhotosSearchResponse>().map(JSON: castingValue) else { return }
                if (data.photos?.photo != nil) {
                    self.photos = (data.photos?.photo!)!
                    print(self.photos.count)
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func eraseSearch() {}
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as? ImageCollectionViewCell else { return  UICollectionViewCell() }
        
                
        let data = self.photos[indexPath.row]
        
        let urlString = data.getImageUrl(size: "q")
        print(urlString)
        
        guard let url = URL.init(string: urlString) else {
                return cell
            }
        
        cell.image.kf.setImage(with: url)
     
        self.stopIndicator()
         
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UICollectionViewCell,
            let indexPath = self.collectionView.indexPath(for: cell) {

             let vc = segue.destination as! DetailViewController
             //Now simply set the title property of vc
             vc.photo = photos[indexPath.row]
         }
    }
    
    func willDisplay() {}
    
    func searchBarButtonTapped() {}
    
    func textSearchAction(text: String) {}
    
    func stopIndicator() {
        self.childView.willMove(toParent: nil)
        self.childView.view.removeFromSuperview()
        self.childView.removeFromParent()
    }
        
    func moveIndicator() {
        addChild(childView)
        childView.view.frame = view.frame
        view.addSubview(childView.view)
        childView.didMove(toParent: self)
    }
}

