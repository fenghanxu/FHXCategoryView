//
//  CategoryUnitCell.swift
//  collectionViews
//
//  Created by 冯汉栩一体机 on 2018/7/31.
//  Copyright © 2018年 com.fenghanxu.demol. All rights reserved.
//

import UIKit
import SnapKit

class CategoryUnitCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    let label = UILabel()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
         buildUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateLayout(imageT:CGFloat, imageW:CGFloat, imageH:CGFloat, nameT:CGFloat){
        
        imageView.snp.updateConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(imageT)
            make.width.equalTo(imageW)
            make.height.equalTo(imageH)
        }
        
        label.snp.updateConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(nameT)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        
    }
    
    func updateControlSet(nameFont:CGFloat, nameColor:UIColor){
        label.font = UIFont.systemFont(ofSize: nameFont)
        label.textColor = nameColor
    }
    
}

extension CategoryUnitCell {
    
    func buildUI(){
        backgroundColor = UIColor.white
        addSubview(imageView)
        addSubview(label)
        buildSubview()
        buildLayout()
    }
    
    func buildSubview(){
        imageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(0)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }

        label.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
    }
    
    func buildLayout(){
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black    
    }
    
}
