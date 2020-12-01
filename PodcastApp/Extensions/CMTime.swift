//
//  CMTime.swift
//  PodcastApp
//
//  Created by Akhadjon Abdukhalilov on 11/26/20.
//

import Foundation
import AVKit

extension CMTime{
    
    func toDisplayString()->String{
        if CMTimeGetSeconds(self).isNaN {
            return "__:__"
        }
        let totalSeconds = Int(CMTimeGetSeconds(self))
        let seconds = totalSeconds % 60
        let minuts = totalSeconds / 60
        let timeFormatString = String(format: "%02d:%02d",minuts,seconds)
        return timeFormatString
    }
}
