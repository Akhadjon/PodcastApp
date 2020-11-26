//
//  PlayerDetailsView.swift
//  PodcastApp
//
//  Created by Akhadjon Abdukhalilov on 11/26/20.
//

import UIKit

class PlayerDetailsView:UIView{
    
    var episode:Episode!{
        didSet{
            titleLabel.text = episode.title
            guard let url = URL(string: episode.imageUrl?.toSecureHTTPS() ?? "") else{return}
            episodeImageView.sd_setImage(with: url, completed: nil)
        }
    }
    @IBAction func handleDismiss(_ sender: Any) {
        self.removeFromSuperview()
    }
   
    
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
}
