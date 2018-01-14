//
//  CircleButton.swift
//  YMHPodcast
//
//  Created by Arthur Pujols on 1/11/18.
//  Copyright © 2018 Arthur Pujols. All rights reserved.
//

import UIKit
@IBDesignable

class CircleButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    private func setUpView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
        self.imageView?.contentMode = UIViewContentMode.scaleAspectFill
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
    }

}
