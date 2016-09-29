//
//  MainViewController.swift
//  DouyuLive
//
//  Created by chenxiaolei on 2016/9/29.
//  Copyright © 2016年 chenxiaolei. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildVC(storyName: "Home")
        addChildVC(storyName: "Live")
        addChildVC(storyName: "Follow")
        addChildVC(storyName: "Profile")
        
    }
    
    private func addChildVC(storyName: String) {
        // 1.通过storyboard获取控制器
        let childVC = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        
        // 2.将childVC作为子控制器
        addChildViewController(childVC)
    }

}
