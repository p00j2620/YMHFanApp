//
//  DonationPageVC.swift
//  YMHPodcast
//
//  Created by Arthur Pujols on 1/13/18.
//  Copyright © 2018 Arthur Pujols. All rights reserved.
//

import UIKit
import WebKit

class ArtDonationPage: UIViewController {

    // Variables
    @IBOutlet weak var artWebView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSite(site: artDonationPage)
    }
    
    // Actions
    
    @IBAction func dismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func loadSite(site: String) {
        if let url = URL(string: site) {
            let request = URLRequest(url: url)
            artWebView.load(request)
        } else {
            print(debugDescription)
        }
    }
 
}
