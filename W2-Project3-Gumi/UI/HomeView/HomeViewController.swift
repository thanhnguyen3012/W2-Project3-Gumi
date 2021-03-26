//
//  HomeViewController.swift
//  W2-Project3-Gumi
//
//  Created by Thành Nguyên on 26/03/2021.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        title = "HOME"
    }

    @IBAction func showTable(_ sender: Any) {
        let storyboard = UIStoryboard(name: "VideoLibraryView", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "VideoLibraryViewController") as! VideoLibraryViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func showCollection(_ sender: Any) {
        let storyboard = UIStoryboard(name: "KeyWordsView", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "KeyWordsViewController") as! KeyWordsViewController
        
        let alert = UIAlertController(title: "Choose an option", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Automation", style: .default, handler: {_ in
            self.navigationController?.pushViewController(vc, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Input from key board", style: .default, handler: {_ in
            vc.listOfTag.removeAll()
            self.navigationController?.pushViewController(vc, animated: true)
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
   
}
