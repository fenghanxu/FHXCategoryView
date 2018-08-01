//
//  ViewController.swift
//  FHXCategoryView
//
//  Created by fenghanxu on 08/01/2018.
//  Copyright (c) 2018 fenghanxu. All rights reserved.
//

import UIKit
import Then
import FHXCategoryView

class ViewController: UIViewController {
  
  let categoryView = CategoryUnitView(cellH: 100, rowNum: 2, columnsNum: 5).then { (view) in
    view.cellSet.imageH = 40
    view.cellSet.imageW = 40
    view.cellSet.imageT = 5
    view.cellSet.nameT = 5
    view.cellSet.nameFont = 14
    view.cellSet.nameColor = UIColor.orange
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    buildUI()
    categoryView.model.imageList = ["tab_category_normal","tab_category_selected","tab_home_normal","tab_home_selected","tab_msg_normal",
                                    "tab_msg_selected","tab_myprofile_normal","tab_myprofile_selected","tab_Shopcart_normal","tab_Shopcart_selected"]
    categoryView.model.nameList = ["好令优选","水产海产","田园蔬菜","新鲜水果","分享有奖","调味香料","缅甸寿司","熟食豆腊","粮油旦类","肉类"]
  }
  
  func buildUI(){
    view.backgroundColor = UIColor.white
    view.addSubview(categoryView)
    buildSubview()
    buildLayout()
  }
  
  func buildSubview(){
    categoryView.backgroundColor = UIColor.white
  }
  
  func buildLayout(){
    categoryView.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
      make.width.equalToSuperview()
      make.height.equalTo(categoryView.viewHeight)
    }
  }



}

