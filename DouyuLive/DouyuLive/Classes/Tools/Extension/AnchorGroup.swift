//
//  AnchorGroup.swift
//  DouyuLive
//
//  Created by chenxiaolei on 2016/9/30.
//  Copyright © 2016年 chenxiaolei. All rights reserved.
//

import UIKit

class AnchorGroup: NSObject {
    /// 该组中对应的房间信息
    var room_list : [[String : NSObject]]? 
    /// 组显示的标题
    var tag_name : String = ""
    /// 组显示的图标
    var icon_name : String = "home_header_normal"
    /// 游戏对应的图标
    var icon_url : String = ""
    /// 定义主播的模型对象数组
    lazy var anchors : [AnchorModel] = [AnchorModel]()
    
    // MARK:- 构造函数
    override init() {
        
    }
    
    init(dict: [String : NSObject]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "room_list" {
            if let dataArray = value as? [[String: NSObject]] {
                for dict in dataArray {
                    anchors.append(AnchorModel(dict: dict))
                }
            }
        }
        
        if key == "tag_name" {
            tag_name = value as! String
        }
        
        if key == "icon_name" {
            if let iconName = value as? String {
                icon_name = iconName
            }
        }
        
        if key == "icon_url" {
            icon_url = value as! String
        }
    }
}
