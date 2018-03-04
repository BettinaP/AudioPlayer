//
//  ViewController.swift
//  AudioPlayer
//
//  Created by Bettina on 3/3/18.
//  Copyright © 2018 Bettina Prophete. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player = AVAudioPlayer()
    var timer = Timer()
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scrubber: UISlider!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let audioPath = Bundle.main.path(forResource: "Manifesting Abundance", ofType: "mp3")
    
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            scrubber.maximumValue = Float(player.duration)
            
        } catch let error as NSError {
            print("error: \(error)")
            //process any errors
        
        }
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func playButtonPressed(_ sender: UIButton) {
        
        player.play()
        //scrubber to move as music is playing
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateScrubber), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateScrubber() {
        
        scrubber.value = Float(player.currentTime)
    
    }
    
    
    @IBAction func rewindSkip15Seconds(_ sender: Any) {
        player.currentTime -= 15
        scrubber.value = Float(player.currentTime)
    }
    
    
    @IBAction func pauseButtonPressed(_ sender: UIButton) {
        
        player.pause()
        timer.invalidate()
    
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        
        player.volume = slider.value
        
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        //userDefaults
        
        
    }
    
    @IBAction func scrubberMoved(_ sender: UISlider) {
        
        player.currentTime = TimeInterval(scrubber.value)
    
    }
    
    @IBAction func skipForward15Seconds(_ sender: Any) {
        player.currentTime += 15
        scrubber.value = Float(player.currentTime)
    }
    
}

