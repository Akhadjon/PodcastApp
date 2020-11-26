//
//  Podcast.swift
//  PodcastApp
//
//  Created by Akhadjon Abdukhalilov on 11/24/20.
//

import Foundation


struct Podcast:Decodable{
    var trackName:String?
    var artistName:String?
    var artworkUrl600:String?
    var trackCount:Int?
    var feedUrl:String?
}
