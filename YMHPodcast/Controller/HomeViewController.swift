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

class HomeViewController: UIViewController {
    /// *** NEED TO ADD TABLEVIEW DS AND DELEGATE AND UNCOMMENT ALL TABLEVIEW REFERENCES/ARRAYS IF ADDING TABLEVIEW BACK TO APP. REMOVED TO CLEAR ERRORS WHEN ADDING SOUND DROP SITE ***
    ///
    
    // OUTLETS
    
    // MARK: PART OF TABLEVIEW FOR DROPS
    //    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mommyImageView: UIImageView!
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var webView: WKWebView!
    
    //Variables and Constants
    var player: AVAudioPlayer!
    var biteArray: [SoundBite] = []
    var audioPlayerArray: [AVAudioPlayer] = []
    
    // MARK: PART OF TABLEVIEW FOR DROPS. SECTION TITLES IS AN ARRAY OF TITLES FOR TABLEVIEW
    //    let sectionTitles = ["Moose Soup Lady", "Nigga Hotline","Kim Anne", "Asian Jeans"]
    //    var dropArray = [
    //        [SoundBite(title: "Oh My Lord!", filePath: Bundle.main.url(forResource: "MooseSoupLadyOhMyLord", withExtension: "mp3")!)
    //            ],
    //        [SoundBite(title: "Wanna Talk Some Shit?", filePath: Bundle.main.url(forResource: "WannaTalkSomeShit", withExtension: "mp3")!),
    //         SoundBite(title: "Just Dial", filePath: Bundle.main.url(forResource: "JustDial", withExtension: "mp3")!),
    //         SoundBite(title: "Sup Nigga", filePath: Bundle.main.url(forResource: "SupNigga", withExtension: "mp3")!)
    //         ],
    //        [SoundBite(title: "Asshoooole", filePath: Bundle.main.url(forResource: "KimAsshole", withExtension: "mp3")!)
    //            ],
    //        [SoundBite(title: "You Wanna Fuck With Meme", filePath: Bundle.main.url(forResource: "youWannaFuckWitMeMe", withExtension: "mp3")!),
    //         SoundBite(title: "Ching Chong", filePath: Bundle.main.url(forResource: "chingChong", withExtension: "mp3")!),
    //         SoundBite(title: "Fuck Me Tonight!", filePath: Bundle.main.url(forResource: "FuckMeTonight", withExtension: "mp3")!),
    //         SoundBite(title: "Poop in My Mouth", filePath: Bundle.main.url(forResource: "Scatman", withExtension: "mp3")!)
    //            ]
    //    ]
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: PART OF TABLEVIEW FOR DROPS
        //        tableView.dataSource = self
        //        tableView.delegate = self
        //		biteArray = createArray()
        mommyImageView.image = UIImage(named: "mainImg.jpg")!
        loadSite(site: youtubeVideoPlaylist)
        playIntro()
        
        
    }
    
    // FUNCTIONS
    
    // Segmented control case function to switch views
    @IBAction func segmentControllerTapped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mommyImageView.image = UIImage(named: "dancingMommies.gif")!
            showWebView()
            loadSite(site: youtubeVideoPlaylist)
        case 1:
            mommyImageView.image = UIImage(named: "momSoundBoard.jpg")!
            showWebView()
            loadSite(site: momDropSiteURL)
            
            // MARK: PART OF TABLEVIEW FOR DROPS
        //            showTableView()
        case 2:
            mommyImageView.image = UIImage(named: "mommies.jpg")!
            showWebView()
            loadSite(site: ymhClipsPlaylist)
        case 3:
            mommyImageView.image = UIImage(named: "theo.JPG")!
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
            
            // MARK: PART OF TABLEVIEW FOR DROPS
            //            tableView.isHidden = true
        }
    }
    
    // MARK: PART OF TABLEVIEW FOR DROPS
    //     // Show tableview if hidden and set webview to hidden
    //    func showTableView() {
    //        if tableView.isHidden {
    //            tableView.isHidden = false
    //            webView.isHidden = true
    //        }
    //    }
    
    // PLAY SOUNDS
    
    func playIntro() {
        
        let introSoundArray = [SoundBite(title: "jeans", filePath: Bundle.main.url(forResource: "jeans", withExtension: "mp3")!),
                               SoundBite(title: "talkShit", filePath: Bundle.main.url(forResource: "talkShit", withExtension: "mp3")!),
                               SoundBite(title: "BigWords", filePath: Bundle.main.url(forResource: "BigWords", withExtension: "mp3")!),
                               SoundBite(title: "DoingGood", filePath: Bundle.main.url(forResource: "DoingGood", withExtension: "mp3")!),
                               SoundBite(title: "BirthBitch", filePath: Bundle.main.url(forResource: "DirtyBitch", withExtension: "mp3")!),
                               SoundBite(title: "WipeDown", filePath: Bundle.main.url(forResource: "WipeDown", withExtension: "mp3")!)
                            ]
        
        let randomNumber = arc4random_uniform(6)
        let randomBiteNumber = Int(randomNumber)
        
        
        do {
            player = try AVAudioPlayer(contentsOf: introSoundArray[randomBiteNumber].filePath)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
        } catch {
            print(error)
        }
    }
    
    // MARK: PART OF TABLEVIEW FOR DROPS
    // ** TABLEVIEW DEPENDANCIES **
    
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return sectionTitles[section]
    //    }
    //
    //
    //    func numberOfSections(in tableView: UITableView) -> Int {
    //        return dropArray.count
    //    }
    //
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        return dropArray[section].count
    //    }
    //
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let soundBite = dropArray[indexPath.section][indexPath.row]
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "soundBiteCell") as! SoundBiteCell
    //
    //        cell.setSoundBite(soundBite: soundBite)
    //
    //        return cell
    //    }
    //
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        if audioPlayerArray != [] {
    //            dropArray[indexPath.section][indexPath.row].stopAllPlayback(audioPlayerArray: audioPlayerArray)
    //        }
    //        dropArray[indexPath.section][indexPath.row].playSound(filePath: dropArray[indexPath.section][indexPath.row].filePath)
    //        audioPlayerArray.append(dropArray[indexPath.section][indexPath.row].audioPlayer)
    //
    //
    //    }
    //
}


