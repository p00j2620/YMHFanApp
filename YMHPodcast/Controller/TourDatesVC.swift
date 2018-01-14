//
//  TourDatesVC.swift
//  YMHPodcast
//
//  Created by Arthur Pujols on 11/15/17.
//  Copyright © 2017 Arthur Pujols. All rights reserved.
//

import UIKit
import WebKit

class TourDatesVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var tourSegmentController: StylesSegmentedControl!
    
    @IBOutlet weak var tourWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSite(siteURL: tomTourURL)
    }
    
    // Functions
    
    func loadSite(siteURL: String) {
        if let url = URL(string: siteURL) {
            let request = URLRequest(url: url)
            tourWebView.load(request)
        } else {
            print(debugDescription)
        }
    }
    
    @IBAction func tourSegmentController(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            loadSite(siteURL: tomTourURL)
        case 1:
            loadSite(siteURL: tinaTourURL)
        default:
            print("Couldn't load site")
        }
    }
    
    
    @IBAction func dismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
