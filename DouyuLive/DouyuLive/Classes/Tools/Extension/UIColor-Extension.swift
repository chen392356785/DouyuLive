//
//  UIColor-Extension.swift
//  DouyuLive
//
//  Created by chenxiaolei on 2016/9/29.
//  Copyright © 2016年 chenxiaolei. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r : CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
}
