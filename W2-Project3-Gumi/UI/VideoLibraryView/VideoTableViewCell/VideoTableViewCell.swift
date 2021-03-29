//
//  VideoTableViewCell.swift
//  W2-Project3-Gumi
//
//  Created by Thành Nguyên on 26/03/2021.
//

import UIKit
import AVFoundation

class VideoTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var playButton: UIButton!
    
    var video : Video?
    var player = AVPlayer()
    var isPlaying = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if video?.url != nil {
            getVideo(forUrl: (video?.url)!)
        } else {
            print("nil")
        }
    }
    
    func bindData(video: Video) {
        self.video = video
        tagLabel.text = video.tag
        titleLabel.text = "▶️ \(video.title)"
    }
    
    func getVideo(forUrl url: URL) {
        let asset = AVAsset(url: url)
        let playerItem = AVPlayerItem(asset: asset)
        player = AVPlayer(playerItem: playerItem)
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.videoView.bounds //bounds of the view in which AVPlayer should be displayed
        playerLayer.videoGravity = .resizeAspect
        
        self.videoView.layer.addSublayer(playerLayer)
    }

    @IBAction func playButtonTapped(_ sender: Any) {
        if isPlaying {
            player.pause()
            playButton.tintColor = .white
        } else {
            player.play()
            playButton.tintColor = .clear
        }
        isPlaying = !isPlaying
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib : UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}
