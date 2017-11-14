//
//  SoundBiteCell.swift
//  YMHPodcast
//
//  Created by Arthur Pujols on 11/13/17.
//  Copyright © 2017 Arthur Pujols. All rights reserved.
//

import UIKit

class SoundBiteCell: UITableViewCell {
	
	@IBOutlet weak var titleLabel:UILabel!
	
	func setSoundBite(soundBite: SoundBite) {
		titleLabel.text = soundBite.title
	}

}
