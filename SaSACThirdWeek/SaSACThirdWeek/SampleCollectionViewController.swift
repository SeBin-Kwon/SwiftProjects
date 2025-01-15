//
//  SampleCollectionViewController.swift
//  SaSACThirdWeek
//
//  Created by Sebin Kwon on 1/9/25.
//

import UIKit


class SampleCollectionViewController: UIViewController {
    // 전체 데이터
    var totalaList: [Int] = Array(1...100)
    // 필터링된 데이터
    lazy var list: [Int] = totalaList
    
    @IBOutlet var bannerCollectionView: UICollectionView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var listCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        configureCollectionView()
        configureCollectionViewLayout()
        configureListCollectionViewLayout()
    }
    
    func configureCollectionView() {
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        let id = SampleCollectionViewCell.identifier
        let xib = UINib(nibName: id, bundle: nil)
        bannerCollectionView.register(xib, forCellWithReuseIdentifier: id)
        
        listCollectionView.delegate = self
        listCollectionView.dataSource = self
        listCollectionView.register(xib, forCellWithReuseIdentifier: id)
    }
    
    func configureListCollectionViewLayout() {
        let sectionInset: CGFloat = 16
        let cellSpacing: CGFloat = 16
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let deviceWidth = UIScreen.main.bounds.width
        let cellWidth = deviceWidth - (sectionInset * 2) - (cellSpacing * 3)
        
        layout.itemSize = CGSize(width: cellWidth/4, height: (cellWidth/4) * 1.2)
        layout.sectionInset = UIEdgeInsets(top: sectionInset, left: sectionInset, bottom: sectionInset, right: sectionInset)
        listCollectionView.collectionViewLayout = layout
    }
    
    
    func configureCollectionViewLayout() {
        bannerCollectionView.isPagingEnabled = true
        bannerCollectionView.backgroundColor = .black
        bannerCollectionView.collectionViewLayout = collectionViewLayout()
    }
}

extension SampleCollectionViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        searchBar.showsCancelButton = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        searchBar.showsCancelButton = false
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print(#function)
        searchBar.showsCancelButton = true
        // searchBar.setShowsCancelButton(<#T##showsCancelButton: Bool##Bool#>, animated: <#T##Bool#>)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(#function)
        var result: [Int] = []
        for item in list {
            
            if searchText == "" {
                result = totalaList
            } else {
                if item == Int(searchText)! {
                    result.append(item)
                }
            }
        }
        list = result
        listCollectionView.reloadData()
    }
}

extension SampleCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SampleCollectionViewCell.identifier, for: indexPath) as! SampleCollectionViewCell
        cell.backgroundColor = .red
        cell.photoImageView.backgroundColor = .white
        // View Drawing Cycle
//        cell.photoImageView.layer.cornerRadius = cell.photoImageView.frame.width / 2
        DispatchQueue.main.async {
            cell.photoImageView.layer.cornerRadius = cell.photoImageView.frame.width / 2
        }
        cell.titleLabel.text = "\(list[indexPath.item])"
        return cell
    }
    
    
}
