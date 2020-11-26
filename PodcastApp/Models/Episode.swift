//
//  Episode.swift
//  PodcastApp
//
//  Created by Akhadjon Abdukhalilov on 11/25/20.
//

import Foundation
import FeedKit

struct Episode {
    let title:String
    let pubDate:Date
    let description:String
    var imageUrl:String?
    
    init(feedItem:RSSFeedItem){
        self.title = feedItem.title ?? ""
        self.pubDate = feedItem.pubDate ?? Date()
        self.description = feedItem.iTunes?.iTunesSubtitle ?? feedItem.description ?? ""
        self.imageUrl = feedItem.iTunes?.iTunesImage?.attributes?.href
    }
}
