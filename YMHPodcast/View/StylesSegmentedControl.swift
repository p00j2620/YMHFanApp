//
//  StylesSegmentedControl.swift
//  YMHPodcast
//
//  Created by Arthur Pujols on 11/14/17.
//  Copyright © 2017 Arthur Pujols. All rights reserved.
//

import UIKit


class StylesSegmentedControl: UISegmentedControl {
	
	let selectedBackgroundColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 0.50)
	var sortedViews: [UIView]!
	var currentIndex: Int = 0
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		configure()
	}
	
	private func configure() {

		self.tintColor = UIColor.gray
		self.layer.cornerRadius = 0
		self.clipsToBounds = true
	
	}
	
	func changeSelectedIndex(to newIndex: Int) {
		sortedViews[currentIndex].backgroundColor = UIColor.gray
		currentIndex = newIndex
		self.selectedSegmentIndex = UISegmentedControlNoSegment
		sortedViews[currentIndex].backgroundColor = selectedBackgroundColor
	}
	
}
