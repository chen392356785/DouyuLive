//
//  CollectionPrettyCell.swift
//  DouyuLive
//
//  Created by chenxiaolei on 2016/9/30.
//  Copyright © 2016年 chenxiaolei. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionPrettyCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var onlineButton: UIButton!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var cityButton: UIButton!
    
    var anchor : AnchorModel? {
        didSet {
            
            // 0.校验模型是否有值
            guard let anchor = anchor else {
                return
            }
            // 1.取出在线人数显示的文字
            var onLineStr : String = ""
            if anchor.online >= 10000 {
                onLineStr = "\(Int(anchor.online / 10000))万在线"
            } else {
                onLineStr = "\(anchor.online)在线"
            }
            onlineButton.setTitle(onLineStr, for: .normal)
            
            // 2.昵称的显示
            nickNameLabel.text = anchor.nickname
            
            // 3.所在的城市
            cityButton.setTitle(anchor.anchor_city, for: .normal)
            
            // 4.设置封面图片
            guard let iconURL = URL(string: anchor.vertical_src) else { return }
            iconImageView.kf.setImage(with: iconURL)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
