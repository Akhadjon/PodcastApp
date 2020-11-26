//
//  APIServiceClass.swift
//  PodcastApp
//
//  Created by Akhadjon Abdukhalilov on 11/25/20.
//

import Foundation
import Alamofire
import FeedKit


class APIService {
    
    //Singleton
    static let shared = APIService()
    let baseiTunesSearchURL = "https://itunes.apple.com/search"
    
    func fetchEpisodes(feedUrl:String,completionHandler:@escaping([Episode])->()){
        
        
        let secureFeedUrl = feedUrl.contains("https") ? feedUrl : feedUrl.replacingOccurrences(of: "http", with: "https")
        guard let url = URL(string: secureFeedUrl) else{return}
        let parser = FeedParser(URL: url)
        
        
        parser.parseAsync { (result) in
            print("Parsed successfully : " , result.self)
           
            switch result {
            case .success(let feed):
                switch feed {
                
                case let .rss(feed):
                    let episodes = feed.toEpisodes()
                    completionHandler(episodes)
                default:
                    print("Found a feed ...")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchPodcast(searchText:String,completionHandler:@escaping([Podcast])->()){
        print("Searching for podacast")
        
      
        let parameters = ["term":searchText,"media":"podcast"]

        AF.request(baseiTunesSearchURL, method: .get, parameters: parameters, encoder:URLEncodedFormParameterEncoder.default, headers: nil).response { (dataResponse) in
            if let error = dataResponse.error {
                print("Failed to contact yahoo", error)
                return
            }
            guard let data = dataResponse.data else{return}
            do {
                let searchResult =   try JSONDecoder().decode(SearchResult.self, from: data)
                completionHandler(searchResult.results)
               
            }catch let decodeError{
                print("Failed to decode", decodeError)
            }
        }
    }
    
    
    
    struct SearchResult:Decodable{
        let resultCount:Int
        let results:[Podcast]
    }
    
    
    
}

