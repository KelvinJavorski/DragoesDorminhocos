import AVFoundation

class IntroWithLoop : Song, AVAudioPlayerDelegate {
    
    private var introPlayer: AVAudioPlayer!
    
    var outro = false
    var outroPlayer : AVAudioPlayer!
    var outroFileName : String!
    
    init(introFileName: String, loopFileName: String, outroFileName: String) {
        super.init(fileName: loopFileName)
        self.outroPlayer = super.load(fileName: outroFileName)
        self.outroPlayer.numberOfLoops = 0
        self.introPlayer = super.load(fileName: introFileName)
        self.introPlayer.numberOfLoops = 0
        self.introPlayer.delegate = self
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        super.play()
    }
    
    override func play() {
        DispatchQueue.global().async {
            self.introPlayer.play()
        }
    }
    
    override func stop() {
        self.introPlayer.stop()
        self.introPlayer.currentTime = 0
        super.stop()
    }
    
    override func stopLoop() {
        super.stopLoop()
        print("stop loop start")

        
        let timeLeft = super.player.duration - super.player.currentTime
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeLeft, execute: {
            self.playOutro()
        })
    }
    
    func playOutro () {
        print("Playing outro")
        outroPlayer.play()
        outro = false
    }
    
}
 
