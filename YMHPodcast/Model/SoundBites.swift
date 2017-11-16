//
//  SoundBites.swift
//  YMHPodcast
//
//  Created by Arthur Pujols on 11/13/17.
//  Copyright © 2017 Arthur Pujols. All rights reserved.
//

import Foundation
import AVFoundation


//var biteArray = [SoundBite]()


struct SoundBite {
	let title: String
	let filePath: URL

	
	init(title: String, filePath: URL) {
		self.title = title
		self.filePath = filePath
	}

	var audioPlayer: AVAudioPlayer!
	
	func stopAllPlayback(audioPlayerArray: [AVAudioPlayer]) {
		for player in audioPlayerArray {
			player.stop()
		}
	}
	
	mutating func playSound(filePath: URL) {
		let path = filePath
		
		do {
			audioPlayer = try AVAudioPlayer(contentsOf: path)
			guard let audioPlayer = audioPlayer else { return }
			audioPlayer.prepareToPlay()
			
			audioPlayer.play()
		
		} catch let err as Error {
			print(err.localizedDescription.debugDescription)
		}
	}
}


