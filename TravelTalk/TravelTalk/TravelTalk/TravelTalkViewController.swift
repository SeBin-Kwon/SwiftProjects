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
    var isSearched = false
    var filteredList = [ChatRoom]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let xib = UINib(nibName: id, bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: id)
        collectionView.delegate = self
        collectionView.dataSource = self
        configureCollectionViewLayout()
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

// MARK: SearchBar
extension TravelTalkViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isSearched = false
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        if text.isEmpty {
            isSearched = false
            collectionView.reloadData()
            return
        }
        isSearched = true
        filteredList = mockChatList.filter {
            $0.chatroomName.localizedCaseInsensitiveContains(text)
        }
        collectionView.reloadData()
    }
}

// MARK: CollectionView
extension TravelTalkViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: ChattingViewController.identifier) as? ChattingViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        isSearched ? filteredList.count : mockChatList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! TravelTalkCollectionViewCell
        let list = isSearched ? filteredList : mockChatList
        cell.configureData(list[indexPath.item])
        return cell
    }
    
    
    
    
}