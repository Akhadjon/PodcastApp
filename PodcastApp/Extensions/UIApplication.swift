//
//  UIApplication.swift
//  PodcastApp
//
//  Created by Akhadjon Abdukhalilov on 12/1/20.
//

import UIKit

extension UIApplication {
    static func mainTabbarController()->MainTabbarController?{
        return shared.keyWindow?.rootViewController as? MainTabbarController
    }
}
