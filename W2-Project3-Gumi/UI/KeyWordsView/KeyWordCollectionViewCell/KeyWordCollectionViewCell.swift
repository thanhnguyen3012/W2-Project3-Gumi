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
        truncLine()
        tagLabel.sizeToFit()
    }
    
    func truncLine() {
        let text = tagLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        print(text)
        let size = text.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .regular)])
        if size.width > 200 {
            
            let length = text.count
            var left = text.index(text.startIndex, offsetBy: length / 2)
            var right = text.index(after: left)
            while (String(text[left..<text.index(after: left)]) != " ") && (String(text[text.index(before: right)..<right]) != " ") {
                left = text.index(before: left)
                right = text.index(after: right)
            }
            if (String(text[left..<text.index(after: left)]) == " ") {
                tagLabel.text = String(text[text.startIndex..<left]) + "\n" + String(text[text.index(after: left)..<text.endIndex])
            } else {
                tagLabel.text = String(text[text.startIndex..<text.index(before: right)]) + "\n" + String(text[right..<text.endIndex])
            }
            
            
//            let listOfWord = text.split(separator: " ")
//            var result = ""
//            for i in 0..<listOfWord.count {
//                if result.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .regular)]).width < (size.width / 2) {
//                    result += "\(listOfWord[i]) "
//                } else {
//                    result += "\n"
//                    for j in i..<listOfWord.count {
//                        result += "\(listOfWord[j]) "
//                    }
//                    break
//                }
//            }
//            print(result)
//            tagLabel.text = result
        }
    }

    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib : UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

}
