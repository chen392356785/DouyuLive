//
//  PageTitleView.swift
//  DouyuLive
//
//  Created by chenxiaolei on 2016/9/29.
//  Copyright © 2016年 chenxiaolei. All rights reserved.
//

import UIKit

private let kScrollLineH : CGFloat = 2

class PageTitleView: UIView {
    
    //MARK:- 定义属性
    private var titles: [String]
    
    // MARK:- 懒加载属性
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false;
        scrollView.scrollsToTop = false;
        scrollView.bounces = false;
        return scrollView;
    }()
    
    private lazy var scrollLine: UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    private lazy var titleLabels : [UILabel] = [UILabel]()
    
    //MARK:- 自定义构造函数
    
    init(frame: CGRect, titles: [String]) {
        self.titles = titles;
        
        super.init(frame: frame);
        
        
        // 设置UI界面
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- 设置UI界面
    private func setupUI() {
        // 1.添加UIScrollView
        addSubview(scrollView)
        scrollView.frame = bounds;
        
        // 2.添加titles对应的Label上
        setupTitleLables()
        
        // 3.设置底线和滚动的滑块
        setupBottomMenuAndScrollLine()
    }
    
    private func setupTitleLables() {
        
        // 0.确定label的一些frame的值
        let LabelW: CGFloat = frame.width / CGFloat(titles.count)
        let LabelH: CGFloat = frame.height - kScrollLineH
        let LabelY: CGFloat = 0
        
        for (index, title) in titles.enumerated() {
            // 1. 创建UILabel
            let label = UILabel()
            
            // 2.设置Lable的属性
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            
            // 3.设置label的frame
            let LabelX: CGFloat = LabelW * CGFloat(index)
            
            label.frame = CGRect(x: LabelX, y: LabelY, width: LabelW, height: LabelH)
            
            // 4.将lable添加到scrollView中
            scrollView.addSubview(label)
            titleLabels.append(label)
        }
        
    }
    
    private func setupBottomMenuAndScrollLine() {
        // 1.添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH : CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        
        // 2.添加scrollLine
        // 2.1.获取第一个Label
        guard let firstLabel = titleLabels.first else { return}
        firstLabel.textColor = UIColor.orange
        
        scrollView.addSubview(scrollLine)
        
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
    }

}
