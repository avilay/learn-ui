//: [Previous](@previous)

import Foundation


// Interfaces are defined as the Protocol type. A class or a struct or an enum can all implement
// a protocol. The usual rules of implicit upcasting apply, i.e., if a function accepts a protocol
// then only that part of the class/struct will be visible inside the function.

protocol MediaPlayer {
    var sizeMB: Double {get}
    mutating func play()
    mutating func pause()
    mutating func stop()
    func remainingPlayTime(timeMarker: Double) -> Double
}

class VideoPlayer: MediaPlayer {
    var sizeMB: Double
    var name: String
    
    init(name: String, sizeMB: Double) {
        self.name = name
        self.sizeMB = sizeMB
    }
    
    func play() {
        print("VideoPlayer.play does not need mutating keyword")
    }
    
    func pause() {
        print("VideoPlayer.pause")
    }
    
    func stop() {
        print("VideoPlayer.stop")
    }
    
    func remainingPlayTime(timeMarker: Double) -> Double {
        // Even though this is supposed to be non-mutating
        // nothing is stopping me from doing it.
        sizeMB += 10
        return 42
    }
}

var player = VideoPlayer(name: "vp1", sizeMB: 5)
player.play()
player.remainingPlayTime(timeMarker: 2)


//: [Next](@next)
