//
//  PianoSoundManager.swift
//  Kadai04
//
//  Created by Yuma Satake on 2025/05/29.
//

import Foundation
import AVFoundation
import UIKit

class PianoSoundManager: NSObject {
    // Variables for audio data and player
    var pianoData: Data!
    var pianoSound: AVAudioPlayer!
    
    override init() {
        super.init()
        setupAudioSession()
    }
    
    // Setup audio session for playback
    private func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to setup audio session: \(error.localizedDescription)")
        }
    }
    
    // Generic function to play piano sound based on string parameter
    func playPianoSound(soundName: String) {
        // Get the sound data from NSDataAsset
        guard let dataAsset = NSDataAsset(name: soundName) else {
            print("Could not find sound data asset: \(soundName)")
            return
        }
        
        // Create and configure the audio player with the data from NSDataAsset
        do {
            let audioPlayer = try AVAudioPlayer(data: dataAsset.data)
            pianoSound = audioPlayer
            pianoSound.prepareToPlay()
            pianoSound.play()
        } catch {
            print("Error creating audio player: \(error.localizedDescription)")
        }
    }
} 
