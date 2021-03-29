//
//  VideoModel.swift
//  W2-Project3-Gumi
//
//  Created by Thành Nguyên on 26/03/2021.
//

import UIKit

class Video {
    var url : URL?
    var tag = "UNDEFINED"
    var title = "Unknown"
    
    init(url: String, tag: String, title: String) {
        self.url = URL(string: url)
        self.tag = tag
        self.title = title
    }
    
    init(url: String) {
        self.url = URL(string: url)
    }
}
