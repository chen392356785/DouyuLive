//
//  NSDate-Extension.swift
//  DouyuLive
//
//  Created by chenxiaolei on 2016/9/30.
//  Copyright © 2016年 chenxiaolei. All rights reserved.
//

import Foundation

extension NSDate {
    class func getCurrentTime() -> String {
        let nowDate = NSDate()
        let interval = Int(nowDate.timeIntervalSince1970)
        return "\(interval)"
    }
}
