//
//  ViewController.swift
//  calmWave
//
//  Created by 권규리 on 2023/11/18.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    
    // Audio player component.
    @objc var player1: AVAudioPlayer!
    @objc var player2 : AVAudioPlayer!
    @objc var player3 : AVAudioPlayer!
    @objc var player4 : AVAudioPlayer!
    @objc var player5 : AVAudioPlayer!
    
    
    @IBOutlet weak var Audio: UIView!
    @IBOutlet weak var Video: UIView!
    
    @IBOutlet weak var myId: UITextField!
    @IBOutlet weak var myPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        
        // Load the audio track.
        loadAudio(file_name: "relax", player: &player1)
        loadAudio(file_name: "softRain", player: &player2)
        loadAudio(file_name: "forest", player: &player3)
        loadAudio(file_name: "lightRain", player: &player4)
        loadAudio(file_name: "meditation", player: &player5)
        
    }
    @IBAction func switchViews(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            Audio.alpha = 1
            Video.alpha = 0
        } else {
            Audio.alpha = 0
            Video.alpha = 1
        }
    }
    
    @IBAction func actionPlay(_ sender: UIButton) {
        player1.play()
    }
    
    @IBAction func actioStop(_ sender: Any) {
        player1.stop()
        player1.currentTime = 0
    }
    
    @IBAction func actionPlay2(_ sender: Any) {
        player2.play()
    }
    @IBAction func actionStop2(_ sender: Any){
        player2.stop()
        player2.currentTime = 0
    }
    
    @IBAction func actionPlay3(_ sender: Any) {
        player3.play()
    }
    @IBAction func actionStop3(_ sender: Any){
        player3.stop()
        player3.currentTime = 0
    }
    
    @IBAction func actionPlay4(_ sender: Any) {
        player4.play()
    }
    @IBAction func actionStop4(_ sender: Any){
        player4.stop()
        player4.currentTime = 0
    }
    
    @IBAction func actionPlay5(_ sender: Any) {
        player5.play()
    }
    @IBAction func actionStop5(_ sender: Any){
        player5.stop()
        player5.currentTime = 0
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {

        if let tabBarController = self.tabBarController {
            tabBarController.selectedIndex = 1
        }
    }

    
    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        if let videoURL = Bundle.main.url(forResource: "pilates1", withExtension: "mp4") {
            print("Video URL: \(videoURL)")
            playVideo(url: videoURL as NSURL)
        } else {
            print("Error: Video file not found!")
        }

    }

    private func playVideo(url: NSURL) {
        let playerController = AVPlayerViewController()
        let player = AVPlayer(url: url as URL)
        playerController.player = player
        self.present(playerController, animated: true) {
            player.play()
        }
    }


    func loadAudio(file_name:String, player: inout AVAudioPlayer!)  {
        guard let sound = NSDataAsset(name: file_name) else {
            print("Error: Audio track not found!")
            return
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(data: sound.data)
        } catch let error as NSError {
            print("Error de reproducción: \(error.localizedDescription)")
        }
    }
    
}
