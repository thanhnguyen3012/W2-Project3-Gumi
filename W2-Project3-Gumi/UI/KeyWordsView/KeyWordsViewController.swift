//
//  KeyWordsViewController.swift
//  W2-Project3-Gumi
//
//  Created by Thành Nguyên on 26/03/2021.
//

import UIKit

class KeyWordsViewController: UIViewController {
    
    //Outlet
    @IBOutlet weak var keyWorldCollectionView: UICollectionView!
    
    //Data
    var listOfTag : [String] = ["CARTOON", "AMNINAL", "SOCIAL", "NEWS", "MEDIA", "SITCOM", "TV SHOW", "GAME SHOW", "REALISTIC SHOW", "COMEDY", "FAMILY", "KIDS", "K-POP", "MUSIC VIDEO", "TRENDING"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        title = "ALL TAGS"
        
        keyWorldCollectionView.register(KeyWordCollectionViewCell.nib, forCellWithReuseIdentifier: KeyWordCollectionViewCell.identifier)
        keyWorldCollectionView.delegate = self
        keyWorldCollectionView.dataSource = self
        keyWorldCollectionView.allowsMultipleSelection = true
        let customFlowLayout = CustomFlowLayout()
        customFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        keyWorldCollectionView.collectionViewLayout = customFlowLayout
    }
}

extension KeyWordsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfTag.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeyWordCollectionViewCell.identifier, for: indexPath) as! KeyWordCollectionViewCell
        cell.bindData(tag: listOfTag[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? KeyWordCollectionViewCell {
            cell.toggleSelected()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? KeyWordCollectionViewCell {
            cell.toggleSelected()
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath) as? KeyWordCollectionViewCell {
////            cell.contentView.backgroundColor = .red
//            cell.tapped()
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath) as? KeyWordCollectionViewCell {
//            cell.tapped()
//        }
//    }
}
