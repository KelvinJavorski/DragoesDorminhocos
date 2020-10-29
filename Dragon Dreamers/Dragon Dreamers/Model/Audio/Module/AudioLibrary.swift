import AVFoundation

enum SongLibrary : String, CaseIterable {
    case dance = ""
}

enum IntroWithLoopLibrary: CaseIterable {
    case infancia
    
    var info : (intro: String, loop: String, outro: String) {
        switch self {
        case .infancia:
            return ("INTRO_infancia.wav", "LOOP_infancia.wav", "OUTRO_infancia.wav")
        }
    }
}

enum SoundEffectLibrary : String, CaseIterable {
    case synth = "click-synth.mp3"
    case double = "click-double.mp3"
}
