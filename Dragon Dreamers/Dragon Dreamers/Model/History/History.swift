//
//  History.swift
//  Dragon Dreamers
//
//  Created by Kevin Ribeiro on 20/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class History {
    
    var chapters = [Chapter(speechs: [Speech(text: "1balão1"),
                                      Speech(text: "1balão2", decisionText: ["1","2","3","4","5"])]),
                    Chapter(speechs: [Speech(text: "As conversas com a minha vó me fizeram perceber melhor as maneiras como eu interagi com o mundo"),
                                      Speech(text: "Olhando para trás, eu percebo como muitas vezes tomei decisões na minha vida pensando nessas conversas"),
                                      Speech(text: "Eu lembro da minha infância..."),
                                      Speech(text: "Na escola..."),
                                      Speech(text: "Entre as outras crianças eu era...", decisionText: ["Eu fui o mais tranquilo da turma, consegui ter vários amigos e todos gostavam de mim","Eu fiz poucos amigos, mas fiquei muito próximo deles. Eu os defendia, eles me defendiam.","Eu era a criança responsável, alguns me admiravam por isso, alguns se irritavam com isso, mas todos prestavam atenção quando eu falava","Eu era o líder da galera, e todos sabiam disso. Todos me seguiam, e ninguém me enfrentava.","5"]),
                                      Speech(text: "Durante as aulas...", decisionText: ["Eu era obediente e prestativo, sempre me oferecendo para ajudar os professores","Eu era quieto, no meu canto. As vezes me distraia, as vezes não conseguia prestar muita atenção no que falavam","Eu sempre tirava minhas dúvidas, sempre ouvia com atenção e fazia anotações.","Eu fui o pesadelo dos professores. Eu era indomável, malandro e provocador.","5"]),
                                      Speech(text: "Em casa quando eu ia me divertir...", decisionText: ["Eu saía com os meus amigos, geralmente algum deles bolava alguma ideia pra gente fazer pra passar o tempo","Eu ficava em casa jogando alguma coisa, as vezes jogava algo com meus amigos","Eu geralmente lia alguma coisa. Passei boa parte da minha infância em casa lendo.","Eu chamava a galera, a gente dava uma volta no bairro, jogava futebol, caçador, ou a gente apostava corrida para ver quem de nós era mais rápido","5"]),
                                      Speech(text: "Nos meus estudos, eu...", decisionText: ["Aprendia mais pedindo ajuda para outras pessoas do que estudando por minha própria conta","Eu me dedicava o máximo que podia para garantir notas altas e tentava ao máximo não ir mal nas provas.","Eu gostava de estudar, e sempre ia bem nas provas. Meus amigos geralmente pediam ajuda para mim quando precisavam.","Eu chamava a galera, a gente dava uma volta no bairro, jogava futebol, caçador, ou a gente apostava corrida para ver quem de nós era mais rápido","5"]),
                                      Speech(text: "E nos meus deveres...", decisionText: ["Eu sempre fui um filho obediente e dedicado, ajudando meus pais nas tarefas de casa.","Eu geralmente fazia o que meus pais mandavam fazer.","Eu passava boa parte do tempo estudando, mas sempre ajudava na limpeza da casa nos finais de semana.","Eu não fui um filho muito obediente. Meu quarto era desorganizado e não ajudava muito em casa.","5"])]),
                    Chapter(speechs: [Speech(text: "3balão1"),
                                      Speech(text: "3balão2", decisionText: ["1","2","3","4","5"])]),
                    Chapter(speechs: [Speech(text: "4balão1"),
                                      Speech(text: "4balão2", decisionText: ["1","2","3","4","5"])])]
    
    
    init() {
        
    }
    
    func getAvaliableChapter() -> Chapter? {
        for chapter in self.chapters {
            if chapter.isConsumed == false {
                return chapter
            }
        }
        return nil
    }
    
    func getAvaliableSpeech() -> Speech?{
        
        let auxChapter = self.getAvaliableChapter()
        
        if auxChapter == nil {
            return nil
        }
        else {
            for speech in auxChapter!.speechs {
                if speech.isConsumed == false {
                    return speech
                }
            }
        }
        return nil
    }
    
    func consumeSpeech() -> Speech?{
        let auxSpeech = self.getAvaliableSpeech()
        if auxSpeech == nil {
            return nil
        }
        else{
            auxSpeech?.setIsConsumed(isConsumed: true)
            
            return auxSpeech
        }
    
    }
    
    func resetAllChapters() {
        for chapter in self.chapters {
            chapter.setIsConsumed(isConsumed: false)
            for speech in chapter.speechs {
                speech.setIsConsumed(isConsumed: false)
            }
        }
    }
    
    func resetAvaliableChapter() -> Bool{
        let auxChapter = self.getAvaliableChapter()
        
        if auxChapter == nil {
            return false
        }
        
        auxChapter!.setIsConsumed(isConsumed: false)
        
        for speech in auxChapter!.speechs {
            speech.setIsConsumed(isConsumed: false)
        }
        
        return true
    }
    
    func consumeChapter() -> Chapter?{
        
        let auxChapter = self.getAvaliableChapter()
        
        if auxChapter == nil {
            return nil
        }
        
        //auxChapter!.setIsConsumed(isConsumed: true)
        
//        for speech in auxChapter!.speechs {
//            speech.setIsConsumed(isConsumed: true)
//        }
        
        return auxChapter!
        
    }
    
}
