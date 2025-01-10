//
//  ViewController.swift
//  TravelTalk
//
//  Created by Sebin Kwon on 1/10/25.
//

import UIKit

class TravelTalkViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var searchBar: UISearchBar!
    
    private let id = TravelTalkCollectionViewCell.identifier
//    var nameList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let xib = UINib(nibName: id, bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: id)
        collectionView.delegate = self
        collectionView.dataSource = self
        configureCollectionViewLayout()
//        mockChatList.forEach {
//            nameList.append(<#T##newElement: String##String#>)
//        }
    }
    
    private func configureCollectionViewLayout() {
        let minimumLineSpacing: CGFloat = 5
        let minimumInteritemSpacing: CGFloat = 5
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = minimumLineSpacing
        layout.minimumInteritemSpacing = minimumInteritemSpacing
        let width = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: width, height: 80)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.collectionViewLayout = layout
    }
    
    
    
}

extension TravelTalkViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}


extension TravelTalkViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: ChattingViewController.identifier) as? ChattingViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        mockChatList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! TravelTalkCollectionViewCell
        cell.configureData(mockChatList[indexPath.item])
        return cell
    }
    
    
    
    
}
