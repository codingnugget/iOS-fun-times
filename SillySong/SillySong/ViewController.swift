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
        //set lyrics to the textview
        lyricsView.text! = lyricsFromName(lyricsTemplate: bananaTemplate, fullName: nameField.text!)
    }
    
}

//test lyrics
let bananaTemplate = ["<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
                      "Banana Fana Fo F<SHORT_NAME>",
                      "Me My Mo M<SHORT_NAME>",
                      "<FULL_NAME>"].joined(separator: "\n")

//creates the flow in lyrics. returns name in all lowercase, and remove any consonents (if they exist) before the first vowel
func shortenName(name:String)->String
{
    var lowercaseName = name.lowercased()
    let vowels = CharacterSet(charactersIn: "aeiou")
    
    //check for empty string
    if(lowercaseName == "")
    {
        return ""
    }
    
    //check if first character in name contains a vowel
    if(String(lowercaseName[lowercaseName.startIndex]).rangeOfCharacter(from: vowels) != nil)
    {
        //if vowel is the first character, simply return the name
        return String(lowercaseName)
    }
    else
    {
        //iterate through the name until the first vowel
        for index in lowercaseName.indices
        {
            //check if current index is a vowel
            if(String(lowercaseName[index]).rangeOfCharacter(from: vowels) != nil)
            {
                return String(lowercaseName[index...])
            }
        }
        //should never reach here
        return "vowels were not found"
    }
}

//function with the lyric template
func lyricsFromName(lyricsTemplate: String, fullName: String) -> String
{
    let shortenedName = shortenName(name: fullName)
    //replace full and short names in lyrics template
    let lyrics = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: shortenedName).replacingOccurrences(of: "<SHORT_NAME>", with: fullName)
    return lyrics
}
