//
//  CollectionCell.swift
//  ZHBaseKit_Swift
//
//  Created by pzh on 2020/7/15.
//  Copyright © 2020 pzh. All rights reserved.
//

import UIKit

class CollectionCellModel: ZHBaseCellModel {
    
    var title:String = "";
    
    override init() {
        super.init();
        
        self.cellClassName = "CollectionCell";
        self.cellWidth     = (kScreenWidth-30)/2;
        self.cellHeight    = self.cellWidth;
    }
}

class CollectionCell: ZHBaseCell {

    lazy var titleLb: UILabel = {
           let titleLb = UILabel.init();
           titleLb.textColor = UIColor.black;
           titleLb.font      = kFont(14);
           self.addSubview(titleLb);
           return titleLb;
    }()
    
    
    override func onLoad() {
        super.onLoad();
        self.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2);
        self.layer.cornerRadius  = 5.0;
        self.layer.masksToBounds = true;
        self.titleLb.snp.makeConstraints { (make) in
            make.center.equalTo(self);
        }
    }
    
    override func dataDidChange() {
        if self.data == nil {return};
        
        let model = self.data as! CollectionCellModel;
        self.titleLb.text = model.title;
    }

    override func onTouch() {
        
        let model = self.data as! CollectionCellModel;
        model.title = "Touch reload";
        self.reloadRowsClosure?(UITableView.RowAnimation.none);
    }
}
