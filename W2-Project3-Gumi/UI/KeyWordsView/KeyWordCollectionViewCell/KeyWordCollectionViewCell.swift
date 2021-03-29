//
//  KeyWordCollectionViewCell.swift
//  W2-Project3-Gumi
//
//  Created by Thành Nguyên on 26/03/2021.
//

import UIKit

class KeyWordCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius =  (self.frame.height / 2) - 5
        self.toggleSelected()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func toggleSelected() {
        if (isSelected){
            contentView.backgroundColor = .systemYellow
        } else {
            contentView.backgroundColor = .systemGray5
        }
    }
    
    func bindData(tag: String) {
        tagLabel.text = tag
        tagLabel.sizeToFit()
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib : UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

}
