//
//  RecommendViewModel.swift
//  DouyuLive
//
//  Created by chenxiaolei on 2016/9/30.
//  Copyright © 2016年 chenxiaolei. All rights reserved.
//

import UIKit

class RecommendViewModel {
    // MARK:- 懒加载属性
    lazy var anchorGroup : [AnchorGroup] = [AnchorGroup]()
    
    fileprivate lazy var bigDataGroup : AnchorGroup = AnchorGroup()
    fileprivate lazy var prettyGroup : AnchorGroup = AnchorGroup()
    
    // MARK: - 发送网络请求
    func requestData(_ finishCallback : @escaping () -> ()) {
        
        // 0.定义参数
        let parameters = ["limit": "4", "offset": "0", "time": NSDate.getCurrentTime()]
        
        // 2.创建Group
        let dGroup = DispatchGroup()
        
        // 1.请求推荐数据
        dGroup.enter()
        NetWorkManage.shared.getWithPath(path: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", paras: ["time" : NSDate.getCurrentTime()], success: { (result) in
            // 1.将result转成字典类型
            guard let resultDict = result as? [String : NSObject] else { return }
            
            // 2.根据data该key,获取数组
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            
            // 3.遍历字典,并且转成模型对象
            // 3.1.设置组的属性
            self.bigDataGroup.tag_name = "热门"
            self.bigDataGroup.icon_name = "home_header_hot"
            
            // 3.2.获取主播数据
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                self.bigDataGroup.anchors.append(anchor)
            }
            // 3.3。离开数据
            dGroup.leave()
            
        }) { (error) in
            print(error)
            // 4.离开组
            dGroup.leave()
        }
        
        // 2.请求颜值数据
        dGroup.enter()
        NetWorkManage.shared.getWithPath(path: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", paras: parameters, success: { (result) in
            // 1.将result转成字典类型
            guard let resultDict = result as? [String : NSObject] else { return }
            
            // 2.根据data该key,获取数组
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            
            // 3.遍历字典,并且转成模型对象
            // 3.1.设置组的属性
            self.prettyGroup.tag_name = "颜值"
            self.prettyGroup.icon_name = "home_header_phone"
            
            // 3.2.获取主播数据
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                self.prettyGroup.anchors.append(anchor)
            }
            // 3.3.离开组
            dGroup.leave()

            }) { (error) in
                print(error)
                // 4.离开组
                dGroup.leave()
        }
        
        // 3.请求后面部分游戏数据
        dGroup.enter()
        NetWorkManage.shared.getWithPath(path: "http://capi.douyucdn.cn/api/v1/getHotCate", paras: parameters, success: { (result) in
            print(result)
            // 1.将result转成字典类型
            guard let resultDict = result as? [String : NSObject] else { return }
            
            // 2.根据data该key，获取数据
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return}
            
            // 3.遍历数组，获取字典，并且将字典转成模型对象
            for dict in dataArray {
                let group = AnchorGroup(dict: dict)
                self.anchorGroup.append(group)
            }
            
            for group in self.anchorGroup {
                for anchor in group.anchors {
                    print(anchor.nickname)
                }
            }
            // 4.离开组
            dGroup.leave()
            
        }) { (error) in
            print(error)
            // 4.离开组
            dGroup.leave()
        }
        
        // 6.所有的数据都请求到,之后进行排序
        dGroup.notify(queue: DispatchQueue.main) {
            self.anchorGroup.insert(self.prettyGroup, at: 0)
            self.anchorGroup.insert(self.bigDataGroup, at: 0)
            
            finishCallback()
        }
    }
}
