//
//  String.swift
//  PodcastApp
//
//  Created by Akhadjon Abdukhalilov on 11/26/20.
//

import Foundation

extension String {
    func toSecureHTTPS()->String{
        return self.contains("http") ? self : self.replacingOccurrences(of: "http", with: "https")
    }
}
