//
//  ViewController.swift
//  SillySong
//
//  Created by R.H. Nguyen on 11/29/17.
//  Copyright © 2017 R.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //set the text view and text field to null
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    //takes text from namefield and generate lyrics in lyrics textview
    @IBAction func displayLyrics(_ sender: Any) {
    
    }
    
}

