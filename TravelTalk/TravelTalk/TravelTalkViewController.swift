//
//  ViewController.swift
//  TravelTalk
//
//  Created by Sebin Kwon on 1/10/25.
//

import UIKit

class TravelTalkViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    private let id = TravelTalkCollectionViewCell.identifier
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let xib = UINib(nibName: id, bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: id)
        collectionView.delegate = self
        collectionView.dataSource = self
    }


}

extension TravelTalkViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! TravelTalkCollectionViewCell
        
        
        return cell
    }
    
    
    
    
}
