//
//  PlayerView.swift
//  TiktokClone
//
//  Created by Engineer 144 on 29/05/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation;

class PlayerView: UIView {
    override static var layerClass: AnyClass {
        return AVPlayerLayer.self;
    }
    
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer;
    }
    
    var player: AVPlayer? {
        get {
            return playerLayer.player;
        }
        set {
            playerLayer.player = newValue;
        }
    }
}
