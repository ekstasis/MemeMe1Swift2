//
//  MemeMeDetailViewController.swift
//  MemeMe Swift 2
//
//  Created by Ekstasis on 9/29/15.
//  Copyright © 2015 Baxter Heavy Industries. All rights reserved.
//

import UIKit

class MemeMeDetailViewController: UIViewController {

    @IBOutlet weak var memeImageView: UIImageView!
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    var memeIndex : Int!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let meme = appDelegate.allMemes[memeIndex]
        memeImageView.image = meme.memedImage
        
        let editButton = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: "showEditor")
        let deleteButton = UIBarButtonItem(title: "Delete  |", style: .Plain, target: self, action: "deleteMeme")
        
        let rightButtonItems = [editButton, deleteButton]
        navigationItem.setRightBarButtonItems(rightButtonItems, animated: true)
        
        tabBarController?.tabBar.hidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        tabBarController?.tabBar.hidden = false
    }
    
    func showEditor() {
        let editorVC = storyboard?.instantiateViewControllerWithIdentifier("MemeEditor") as! MemeEditorVC
        editorVC.memeIndex = memeIndex
        presentViewController(editorVC, animated: true, completion: nil)
    }
    
    func deleteMeme() {
        appDelegate.allMemes.removeAtIndex(memeIndex)
        navigationController?.popToRootViewControllerAnimated(true)
    }
}

