//
//  UIViewExtension.swift
//  YouTube
//
//  Created by Hikaru Watanabe on 2/3/19.
//  Copyright © 2019 Hikaru Watanabe. All rights reserved.
//

import UIKit
extension UIView{
    func addConstraints(withVisualFormat: String, views: UIView...){
        var viewDict = [String:UIView]()
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDict[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: withVisualFormat, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDict))
    }
}
