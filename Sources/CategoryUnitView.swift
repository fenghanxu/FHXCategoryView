//
//  CategoryUnitView.swift
//  collectionViews
//
//  Created by 冯汉栩一体机 on 2018/7/31.
//  Copyright © 2018年 com.fenghanxu.demol. All rights reserved.
//

import UIKit
protocol CategoryUnitViewDelegate:NSObjectProtocol {
    func categoryUnitView(view:CategoryUnitView, didSelectItemAt indexPath: IndexPath)
}

public class CategoryUnitView: UIView {
  
    weak var delegate:CategoryUnitViewDelegate?
    //cell高度
    var cellHeight:CGFloat = 0
    //行数
    var rowCount:CGFloat = 0
    //列数
    var columnsCount:CGFloat = 0
    //整个view的高度
    public var viewHeight:CGFloat = 0
    
    public var cellSet = CellSet()
    
    public var model = DataModel(){
       didSet{
           collectionView.reloadData()
       }
    }
    
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    public init(cellH: CGFloat = 85, rowNum: CGFloat, columnsNum: CGFloat ) {
        cellHeight = cellH
        rowCount = rowNum
        columnsCount = columnsNum
        viewHeight = cellHeight * rowCount
        super.init(frame: CGRect.zero)
        buildUI()
    }
    
  required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   public struct CellSet {
       public var imageT:CGFloat = 5
       public var imageW:CGFloat = 40
       public var imageH:CGFloat = 40
       public var nameT:CGFloat = 5
        
       public var nameFont:CGFloat = 12
       public var nameColor:UIColor = UIColor.black
    }
    
  public struct DataModel {
       public var imageList = [String]()
       public var nameList = [String]()
    }
    
}

public extension CategoryUnitView {
    
    func buildUI(){
       backgroundColor = UIColor.white
       addSubview(collectionView)
       buildSubview()
       buildLayout()
    }
    
    func buildSubview(){
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.isScrollEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.register(CategoryUnitCell.self, forCellWithReuseIdentifier: "kCategoryUnitCell")
    }
    
    func buildLayout(){        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let collectionViewT:NSLayoutConstraint = NSLayoutConstraint(item: collectionView, attribute: .top, relatedBy:.equal, toItem:self, attribute:.top, multiplier:1.0, constant: 0.0)
        collectionView.superview?.addConstraint(collectionViewT)
        let collectionViewL:NSLayoutConstraint = NSLayoutConstraint(item: collectionView, attribute: .left, relatedBy:.equal, toItem:self, attribute:.left, multiplier:1.0, constant: 0.0)
        collectionView.superview?.addConstraint(collectionViewL)
        let collectionViewR:NSLayoutConstraint = NSLayoutConstraint(item: collectionView, attribute: .right, relatedBy:.equal, toItem:self, attribute:.right, multiplier:1.0, constant: 0.0)
        collectionView.superview?.addConstraint(collectionViewR)
        let collectionViewB:NSLayoutConstraint = NSLayoutConstraint(item: collectionView, attribute: .bottom, relatedBy:.equal, toItem:self, attribute:.bottom, multiplier:1.0, constant: 0.0)
        collectionView.superview?.addConstraint(collectionViewB)
    }
    
}

extension CategoryUnitView: UICollectionViewDelegateFlowLayout {
    
  public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        return CGSize(width: bounds.size.width/columnsCount, height: cellHeight)
    }
    
  public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
  public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

extension CategoryUnitView: UICollectionViewDelegate, UICollectionViewDataSource {
    
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.nameList.count
    }
    
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kCategoryUnitCell", for: indexPath) as! CategoryUnitCell
        cell.updateLayout(imageT: cellSet.imageT, imageW: cellSet.imageW, imageH: cellSet.imageH, nameT: cellSet.nameT)
        cell.updateControlSet(nameFont: cellSet.nameFont, nameColor: cellSet.nameColor)
        cell.imageView.image = UIImage(named: model.imageList[indexPath.item])
        cell.label.text = model.nameList[indexPath.item]
        return cell
    }
    
  public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.categoryUnitView(view: self, didSelectItemAt: indexPath)
    }
    
}

