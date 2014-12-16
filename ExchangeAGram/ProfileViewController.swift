//
//  ProfileViewController.swift
//  ExchangeAGram
//
//  Created by Mauro Consiglio on 13/12/14.
//  Copyright (c) 2014 Mauro Consiglio. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, FBLoginViewDelegate {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var fbLoginView: FBLoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "publish_actions"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // IBActions
    
    @IBAction func mapViewButtonTapped(sender: UIButton) {
        self.performSegueWithIdentifier("mapSegue", sender: nil)
    }
    
    // FBLoginViewDelegate
    
    func loginViewShowingLoggedInUser(loginView: FBLoginView!) {
        profileImageView.hidden = false
        nameLabel.hidden = false
    }
    
    func loginViewFetchedUserInfo(loginView: FBLoginView!, user: FBGraphUser!) {
        
        println(user)
        
        nameLabel.text = user.name
        
        profileImageView.image = UIImage(data: NSData(contentsOfURL: NSURL(string: "https://graph.facebook.com/\(user.objectID)/picture?type=small")!)!)
    }
    
    func loginViewShowingLoggedOutUser(loginView: FBLoginView!) {
        profileImageView.hidden = true
        nameLabel.hidden = true
    }
    
    func loginView(loginView: FBLoginView!, handleError error: NSError!) {
        println("Error: \(error.localizedDescription)")
    }

}
