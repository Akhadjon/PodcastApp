//
//  EpisodeCell.swift
//  PodcastApp
//
//  Created by Akhadjon Abdukhalilov on 11/25/20.
//

import UIKit

class EpisodeCell: UITableViewCell {

    var episode:Episode!{
        didSet{
          
           titleLabel.text = episode.title
           descriptionLabel.text = episode.description
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy"
            pubDateLabel.text = dateFormatter.string(from: episode.pubDate)
        
            let url = URL(string: episode.imageUrl?.toSecureHTTPS() ?? "")
            episodeImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    @IBOutlet weak var episodeImageView: UIImageView!{
        didSet{
            episodeImageView.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var pubDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
}
