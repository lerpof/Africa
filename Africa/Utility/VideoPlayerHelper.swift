//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Leonardo Lazzari on 02/05/23.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    if let videoUrl = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
        videoPlayer = AVPlayer(url: videoUrl)
        videoPlayer?.play()
    }
    return videoPlayer!
}
