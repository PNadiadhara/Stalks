//
//  ViewController.swift
//  Stalks
//
//  Created by Pritesh Nadiadhara on 2/19/21.
//

import UIKit
import SwifteriOS

class ViewController: UIViewController {
    
    let swifter = Swifter(consumerKey: TwitterAPI.init().APIKey, consumerSecret: TwitterAPI.init().APIKeySeceret)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //only these 3 paramenters needed for now
        swifter.searchTweet(using: "@Apple") { (results, metadata) in
            print(results)
        } failure: { (error) in
            print("Encountered Error with API Request: \(error)")
        }

        
    }


}

