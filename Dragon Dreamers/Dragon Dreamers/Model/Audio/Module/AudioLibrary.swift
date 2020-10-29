import AVFoundation

enum SongLibrary : String, CaseIterable {
    case dance = ""
}

enum IntroWithLoopLibrary: CaseIterable {
    case first
    
    var info : (intro: String, loop: String, outro: String) {
        switch self {
        case .first:
            return ("intro.mp3", "loop.mp3", "intro.mp3")
        }
    }
}

enum SoundEffectLibrary : String, CaseIterable {
    case synth = "click-synth.mp3"
    case double = "click-double.mp3"
}
