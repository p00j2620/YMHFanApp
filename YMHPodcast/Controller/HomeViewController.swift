//
//  ViewController.swift
//  YMHPodcast
//
//  Created by Arthur Pujols on 11/12/17.
//  Copyright © 2017 Arthur Pujols. All rights reserved.
//

import UIKit
import WebKit
import AVFoundation

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	// OUTLETS
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var mommyImageView: UIImageView!
	@IBOutlet weak var segmentController: UISegmentedControl!
	@IBOutlet weak var webView: WKWebView!
	
	//Variables and Constants
	var player: AVAudioPlayer!
	var biteArray: [SoundBite] = []
	var audioPlayerArray: [AVAudioPlayer] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.dataSource = self
		tableView.delegate = self
		biteArray = createArray()
		loadSite(site: youtubeVideoPlaylist)
		playIntro()
		
		
	}
	
	// FUNCTIONS
	
	// Segmented control case function to switch views
	@IBAction func segmentControllerTapped(_ sender: UISegmentedControl) {
		switch sender.selectedSegmentIndex {
		case 0:
			showWebView()
			loadSite(site: youtubeVideoPlaylist)
		case 1:
			showTableView()
			print("TableView")
		case 2:
			showWebView()
			loadSite(site: ymhClipsPlaylist)
		case 3:
			showWebView()
			loadSite(site: ymhMerchPage)
		case 4:
			performSegue(withIdentifier: "toTourDateVC", sender: self)
		default:
			print("Error: \(debugDescription)")
		}
	}
	
	// Load website data for controller depending on segment id
	func loadSite(site: String) {
		if let url = URL(string: site) {
			let request = URLRequest(url: url)
			webView.load(request)
		} else {
			print(debugDescription)
		}
	}
	
	// Show webview if hidden and set tableview to hidden
	func showWebView() {
		if webView.isHidden {
			webView.isHidden = false
			tableView.isHidden = true
		}
	}
	
	// Show tableview if hidden and set webview to hidden
	func showTableView() {
		if tableView.isHidden {
			tableView.isHidden = false
			webView.isHidden = true
		}
	}
	
	// PLAY SOUNDS
	
	func playIntro() {
		do {
			player = try AVAudioPlayer(contentsOf: introSoundBite!)
			guard let player = player else { return }
			
			player.prepareToPlay()
			player.play()
		} catch let error as Error {
			print(error.localizedDescription.debugDescription)
		}
	}
	
	// ** TABLEVIEW DEPENDANCIES **
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return biteArray.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let soundBite = biteArray[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: "soundBiteCell") as! SoundBiteCell
		
		cell.setSoundBite(soundBite: soundBite)
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if audioPlayerArray != [] {
			biteArray[indexPath.row].stopAllPlayback(audioPlayerArray: audioPlayerArray)
		}
		biteArray[indexPath.row].playSound(filePath: biteArray[indexPath.row].filePath)
		audioPlayerArray.append(biteArray[indexPath.row].audioPlayer)
		
		
	}
	
	func createArray() -> [SoundBite] {
		var tempSoundBites: [SoundBite] = []
		
		let chingChong = SoundBite(title: "Ching Chong Bing Bong", filePath: Bundle.main.url(forResource: "chingChong", withExtension: "mp3")!)
		let doNotHitMeMommy = SoundBite(title: "Do Not Hit Me Mommy", filePath: Bundle.main.url(forResource: "DoNotHitMeMommy", withExtension: "mp3")!)
		let dontBuyPizza = SoundBite(title: "Don't Buy Pizza at a Gas Station", filePath: Bundle.main.url(forResource: "DontBuyPizzaAtAGasStation", withExtension: "mp3")!)
		let ecoSex = SoundBite(title: "WTF is Eco Sex!?", filePath: Bundle.main.url(forResource: "EcoSexWTF", withExtension: "mp3")!)
		let fuckMeTonight = SoundBite(title: "I Want You to Fuck Me Tonight", filePath: Bundle.main.url(forResource: "FuckMeTonight", withExtension: "mp3")!)
		let shitInHere = SoundBite(title: "Smells Like Shit in Here", filePath: Bundle.main.url(forResource: "ShitInHere", withExtension: "mp3")!)
		let asshole = SoundBite(title: "Asssshole", filePath: Bundle.main.url(forResource: "KimAsshole", withExtension: "mp3")!)
		let knowWhatImSaying = SoundBite(title: "Know What I'm Sayin'!?", filePath: Bundle.main.url(forResource: "KnowWhatImSayin", withExtension: "mp3")!)
		let ohMyLord = SoundBite(title: "Moose Soup Lady - Oh My Lord..", filePath: Bundle.main.url(forResource: "MooseSoupLadyOhMyLord", withExtension: "mp3")!)
		let respek = SoundBite(title: "Put Some Respeck On My Name!", filePath: Bundle.main.url(forResource: "Respek", withExtension: "mp3")!)
		let scatman = SoundBite(title: "He Poop In My Mouth", filePath: Bundle.main.url(forResource: "Scatman", withExtension: "mp3")!)
		let beEasy = SoundBite(title: "This Shit Should Be Easy!", filePath: Bundle.main.url(forResource: "ThisShitShouldBeEasy", withExtension: "mp3")!)
		let dial = SoundBite(title: "Just Dial Nigga..", filePath: Bundle.main.url(forResource: "JustDial", withExtension: "mp3")!)
		let supNigga = SoundBite(title: "Sup Nigga", filePath: Bundle.main.url(forResource: "SupNigga", withExtension: "mp3")!)
		let talkShit = SoundBite(title: "Wanna Talk Some Shit?", filePath: Bundle.main.url(forResource: "WannaTalkSomeShit", withExtension: "mp3")!)
		let randy = SoundBite(title: "Who's Randy?", filePath: Bundle.main.url(forResource: "WhosRandy", withExtension: "mp3")!)
		let finished = SoundBite(title: "Y'all Finished or Y'all Done", filePath: Bundle.main.url(forResource: "YallFinished", withExtension: "mp3")!)
		let fuckWithMeme = SoundBite(title: "You Wanna Fuck With MeMe!?", filePath: Bundle.main.url(forResource: "youWannaFuckWitMeMe", withExtension: "mp3")!)
		
		
		
		
		
		
		
		
		tempSoundBites.append(fuckWithMeme)
		tempSoundBites.append(finished)
		tempSoundBites.append(randy)
		tempSoundBites.append(talkShit)
		tempSoundBites.append(supNigga)
		tempSoundBites.append(dial)
		tempSoundBites.append(beEasy)
		tempSoundBites.append(scatman)
		tempSoundBites.append(respek)
		tempSoundBites.append(ohMyLord)
		tempSoundBites.append(knowWhatImSaying)
		tempSoundBites.append(asshole)
		tempSoundBites.append(shitInHere)
		tempSoundBites.append(fuckMeTonight)
		tempSoundBites.append(chingChong)
		tempSoundBites.append(doNotHitMeMommy)
		tempSoundBites.append(dontBuyPizza)
		tempSoundBites.append(ecoSex)
		
		return tempSoundBites
	}
	
}


