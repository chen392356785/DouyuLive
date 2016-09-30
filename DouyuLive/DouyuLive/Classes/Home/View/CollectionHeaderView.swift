//
//  CollectionHeaderView.swift
//  DouyuLive
//
//  Created by chenxiaolei on 2016/9/30.
//  Copyright © 2016年 chenxiaolei. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var group : AnchorGroup? {
        didSet {
            titleLabel.text = group?.tag_name
            iconImageView.image = UIImage(named:group?.icon_name ?? "home_header_normal")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
