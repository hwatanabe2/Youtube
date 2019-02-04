//
//  MenuBar.swift
//  YouTube
//
//  Created by Hikaru Watanabe on 2/3/19.
//  Copyright © 2019 Hikaru Watanabe. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "menuCell"
    let cellImageNames = ["home", "fire", "playlist", "profile"]
    override init(frame: CGRect){
        super.init(frame:frame)
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        addSubview(collectionView)
        addConstraints(withVisualFormat: "H:|[v0]|", views: collectionView)
        addConstraints(withVisualFormat: "V:|[v0]|", views: collectionView)
        
        DispatchQueue.main.async {[unowned self] in
            self.collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: [])
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        
        cell.imageView.image = UIImage(named: cellImageNames[indexPath.row])?.withRenderingMode(.alwaysTemplate)
        cell.imageView.tintColor = UIColor(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MenuCell: BaseCell{
    let imageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    override var isHighlighted: Bool {
        didSet{
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
        }
    }
    
    override var isSelected: Bool {
        didSet{
            imageView.tintColor = isSelected ? UIColor.white : UIColor(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        addConstraints(withVisualFormat: "V:[v0(28)]", views: imageView)
        addConstraints(withVisualFormat: "H:[v0(28)]", views: imageView)
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
    }
}
