//
//  History.swift
//  Dragon Dreamers
//
//  Created by Kevin Ribeiro on 20/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class History {
    
    var chapters = [Chapter(speechs: [Speech(text: "Tutorial placeholder 1"),
                                      Speech(text: "Tutorial placeholder 2", decisionText: ["Tutorial placeholder 2","Tutorial placeholder 2","Tutorial placeholder 2","Tutorial placeholder 2","Tutorial placeholder 2"], posDecisionText: ["1","2","3","4"])]),
                    Chapter(speechs: [Speech(text: "As conversas com a minha vó me fizeram perceber melhor as maneiras como eu interagi com o mundo"),
                                      Speech(text: "Olhando para trás, eu percebo como muitas vezes tomei decisões na minha vida pensando nessas conversas"),
                                      Speech(text: "Eu lembro da minha infância..."),
                                      Speech(text: "Na escola..."),
                                      Speech(text: "Entre as outras crianças...", decisionText: ["Eu fui o mais tranquilo da turma","Eu fiz poucos amigos","Eu era a criança responsável","Eu era o líder da galera"], posDecisionText: ["Consegui ter vários amigos e todos gostavam de mim. Eu era o mais popular da turma. Hoje em dia cada um seguiu seu próprio caminho, mas lembro de todos eles com carinho","Mas fiquei muito próximo dos meus poucos amigos do que teria ficado se tivesse vários. Eu os defendia, eles me defendiam. Nós nos conversamos até hoje","Alguns me admiravam por isso, alguns se irritavam com isso, mas todos prestavam atenção quando eu falava, e todos vinham tirar dúvidas comigo ou pedir ajuda","As vezes eu entrava em alguma briga ou discussão, mas em geral todo mundo me seguia e admirava"]),
                                      Speech(text: "Durante as aulas...", decisionText: ["Eu era obediente e prestativo","Eu era quieto, no meu canto","Eu sempre tirava minhas dúvidas","Eu fui o pesadelo dos professores"], posDecisionText: ["Sempre me oferecendo para ajudar os professores e, por causa disso, sempre fui visto como um aluno exemplar","As vezes me distraia, as vezes não conseguia prestar muita atenção no que falavam","Sempre ouvia com atenção e fazia anotações, tinha um caderno lotado com o conteúdo da aula","Eu era o aluno bagunceiro e desordeiro da sala, fui algumas vezes para o diretor da escola por causa do meu comportamento"]),
                                      Speech(text: "Nos meus estudos...", decisionText: ["Eu estudava junto com outras pessoas","Eu me dedicava bastante aos estudos","Eu gostava de estudar","Eu... não estudava"], posDecisionText: ["Aprendia mais pedindo ajuda para outras pessoas do que estudando por minha própria conta","Eu fazia o máximo que podia para garantir notas altas e tentava ao máximo não ir mal nas provas","Eu sempre ia bem nas provas. Meus amigos geralmente pediam ajuda para mim quando precisavam","Eu não ia muito bem. Não gostava da pressão de fazer provas. Minhas notas não eram muito boas"]),
                                      Speech(text: "Para me divertir...", decisionText: ["Eu saía com os meus amigos","Eu ficava em casa jogando alguma coisa","Eu ficava em casa lendo","Eu chamava a galera"], posDecisionText: ["Geralmente algum deles bolava alguma ideia pra gente fazer pra passar o tempo","As vezes eu chamava meus amigos para jogarmos alguma coisa juntos","O que eu mais gostava de fazer quando era criança era ler","A gente dava uma volta no bairro, jogava futebol, caçador, ou a gente apostava corrida para ver quem de nós era mais rápido"]),
                                      Speech(text: "E quando estava em casa com os meus pais...", decisionText: ["Eu sempre fui um filho obediente","Eu fazia o que meus pais mandavam fazer","Eu ficava estudando","Eu não fui um filho muito obediente"], posDecisionText: ["Sempre ajudei meus pais nas tarefas de casa","Eles sempre precisavam de uma ajuda aqui e ali, e quando me avisavam eu ia ajudar","Quando eu parava de estudar eu ajudava com a limpeza em casa","Meu quarto era desorganizado e não ajudava muito em casa"]),
                                      Speech(text: "A lição que minha vó me deu sobre os Quatro Caminhos me acompanhou a minha vida inteira"),
                                      Speech(text: "Era uma maneira de enxergar como as coisas podiam ser resolvidas"),
                                      Speech(text: "E o que encontraríamos no final de cada caminho"),
                                      Speech(text: "Em uma das idas na casa da minha avó durante a minha infância, nós tivemos uma conversa sobre os caminhos que eu estava escolhendo")]),
                    Chapter(speechs: [Speech(text: "Os anos se passaram mais rápido do que eu imaginava"),
                                      Speech(text: "Eu cresci, e a minha relação com minha família começou a mudar"),
                                      Speech(text: "Não foi do dia para noite, claro"),
                                      Speech(text: "As coisas foram mudando pouco a pouco, conforme eu fui deixando de ser criança"),
                                      Speech(text: "Foram as coisas do dia a dia"),
                                      Speech(text: "Olhando para trás, eu percebo melhor como as coisas mudaram"),
                                      Speech(text: "Durante a minha adolescência, eu e minha mãe...", decisionText: ["Nos dávamos muito bem","Interagíamos pouco","Não nos dávamos muito bem","Brigávamos bastante"], posDecisionText: ["Sempre me mantive muito próximo dela","Eu não costumava falar muito com ela, a gente não tinha muito assunto","Eu estava constantemente questionando as decisões dela, muitas vezes isso causava conflitos entre nós","Eu queria ter minha independência e achava ela muito controladora"]),
                                      Speech(text: "E com o meu pai...", decisionText: ["Passávamos bastante tempo juntos","Nós éramos pessoas bem diferentes","Ele me ensinou muito","Não nos dávamos muito bem"], posDecisionText: ["Nós gostávamos de muitas coisas em comum, filmes, livros, jogos...","Não passamos muito tempo juntos, não sabíamos o que fazer juntos","Eu sempre estive ao lado dele, aprendendo muito sobre o trabalho dele e sobre a vida em geral","Eu achava ele um porre, ele me achava muito chato"]),
                                      Speech(text: "No dia-a-dia da nossa família...", decisionText: ["Nós éramos bem próximos","Nós ficávamos cada um no seu canto","Eu tentava entender meus pais","Nós vivíamos discutindo"], posDecisionText: ["Sempre tentei ser um filho mais próximo e presente na minha família","Cada um de nós tinha seus próprios afazeres e suas próprias atividades, então eu não passava muito tempo com eles","Eu queria compreender as razões das decisões deles, e muitas vezes me incomodava com a maneira que eles decidiam as coisas","Tínhamos muitas brigas e discussões, era difícil conseguirmos nos entender"]),
                                      Speech(text: "Quando chegou a época de me preparar pro vestibular...", decisionText: ["Eu tive dificuldade em estudar sozinho","Eu só conseguia estudar por conta própria","Eu me esforcei muito nos meus estudos","Eu não consegui estudar"], posDecisionText: ["Sempre busquei ajuda dos meus amigos","Tive muita dificuldade em participar das aulas e tirar dúvidas","Busquei ter o melhor desempenho possível para entrar em uma boa universidade","Eu tive muitos problemas em me concentrar nos meus estudos e me dedicar"]),
                                      Speech(text: "E na hora de escolher um curso...", decisionText: ["Eu segui os conselhos dos meus pais","Eu já sabia o que queria","Eu escolhi o curso depois de muita pesquisa","Eu não fiz o curso que meus pais queriam"], posDecisionText: ["Fiz o mesmo curso que eles fizeram. É uma carreira boa, que paga relativamente bem","Não precisei pensar muito nem conversar muito com ninguém, me inscrevi no curso que eu sempre quis","Passei muito tempo vendo todas as opções possíveis, demorei um pouco mas encontrei algo que eu realmente gostava de fazer","Eu não queria seguir o mesmo rumo que eles, e escolhi algo completamente diferente, algo que eu realmente queria"]),
                                      Speech(text: "Quando eu passei na universidade minha avó veio conversar comigo..."),
                                      Speech(text: "E falar comigo sobre ser adulto"),
                                      Speech(text: "E lidar com minhas responsabilidades")]),
                    Chapter(speechs: [Speech(text: "Quando eu vi, eu já era adulto"),
                                      Speech(text: "Minhas escolhas eram só minhas agora, eu já tinha minha independência"),
                                      Speech(text: "E as consequências das minhas escolhas também eram só minhas"),
                                      Speech(text: "Conforme eu fui criando minha própria vida, eu percebia que me sentia mais distante da minha família"),
                                      Speech(text: "Minha universidade ficava em outra cidade, então tive que me mudar para longe dos lugares que eu conhecia desde criança"),
                                      Speech(text: "Era uma sensação curiosa, quase um começar do zero"),
                                      Speech(text: "As pessoas que eu conheci na universidade...", decisionText: ["Eram pessoas divertidas","Eram pessoas mais tímidas","Eram alunos dedicados e estudiosos","Eram pessoas engajadas"], posDecisionText: ["Eu busquei pessoas ao meu redor que me agradavam, que me faziam me sentir bem","Eu fiz poucos amigos, mas são amigos que eu converso até hoje","Eu escolhi as pessoas mais esforçadas e estudiosas, pessoas que eu admirava e que me inspiravam","Eu me aproximei de pessoas inquietas, que buscavam mudança e lutavam por um mundo melhor"]),
                                      Speech(text: "Entre os meus amigos, havia uma pessoa especial, por quem eu me interessei...", decisionText: ["Eu me aproximei dela","Ela veio falar comigo","Nós dois gostávamos da mesma coisa","Nós lutávamos pelas mesmas causas"], posDecisionText: ["Tudo o que eu queria era agradá-la, deixá-la feliz e confortável","Eu era bem desajeitado, foi ela quem tomou o primeiro passo para ficar comigo","Nós nos aproximamos pelos nossos gostos em comum e nossos interesses","Nos frustrávamos com os mesmos problemas, e organizamos juntos manifestos e protestos contra aquilo que nos incomodava"]),
                                      Speech(text: "Nos formamos e fomos viver juntos, construir nossa vida juntos"),
                                      Speech(text: "Nessa mesma época eu comecei minha vida profissional, conseguindo um emprego bom"),
                                      Speech(text: "Era uma empresa grande, pagava bem, mesmo que o trabalho fosse puxado"),
                                      Speech(text: "Infelizmente havia um grande problema que eu tinha que enfrentar diariamente"),
                                      Speech(text: "Meu chefe"),
                                      Speech(text: "Começou aos poucos, algum tempo depois de eu conseguir o emprego"),
                                      Speech(text: "Algumas piadas desconfortáveis, algumas falas desagradáveis"),
                                      Speech(text: "Demorou para eu perceber o quanto o comportamento dele me afetava", decisionText: ["Eu tentei levar na brincadeira","Eu fiquei quieto","Eu tentei entendê-lo","Eu fiquei furioso"], posDecisionText: ["Eu tentei aturar o máximo possível, talvez ele parasse","Eu me permaneci calado, não queria causar nenhuma confusão","Eu comecei a analisar o comportamento dele, perceber quais os motivos para ele agir daquele jeito","Eu chegava em casa furioso, desabafando com minha companheira sobre a situação"]),
                                      Speech(text: "Infelizmente as coisas permaneceram ruins por muito tempo"),
                                      Speech(text: "O ambiente foi ficando cada vez mais hostil e desagradável"),
                                      Speech(text: "Eu sentia meu rendimento caindo, e só de pensar no trabalho já me causava estresse"),
                                      Speech(text: "Chegou um momento que eu não aguentava mais"),
                                      Speech(text: "Eu fui até meu chefe...", decisionText: ["Pedi transferência","Pedi minha demissão","Expliquei o que estava acontecendo","Confrontei o desgraçado"], posDecisionText: ["E pedi para ser direcionado para outra área da empresa, onde eu pudesse trabalhar melhor","Demorou um tempo para eu conseguir outro emprego, mas consegui arranjar algo que me pagava bem","Eu expliquei o melhor possível sobre como o comportamento dele era inadequado e afetava negativamente a empresa. Não fui escutado e levei minhas reclamações para a ouvidoria, ele foi demitido","Disse tudo o que eu pensava dele e do comportamento dele. A briga foi parar na justiça. Eu entrei com um processo por assédio moral e venci, mas fui demitido da empresa"]),
                                      Speech(text: "Fora um ou outro problema pontual, eu posso dizer que minha vida estava muito boa"),
                                      Speech(text: "Nós começamos a pensar no nosso futuro juntos"),
                                      Speech(text: "Estava indo tudo bem, até que o telefone tocou um dia..."),
                                      Speech(text: "Minha parceira atendeu o telefone, quando eu cheguei na sala ela me olhou, trêmula, com os olhos marejados..."),
                                      Speech(text: "Ela me passou o telefone e eu recebi a notícia...", decisionText: ["...","...","...","..."], posDecisionText: ["Eu tinha que ir ver a minha avó","Eu tinha que ir ver a minha avó","Eu tinha que ir ver a minha avó","Eu tinha que ir ver a minha avó"]),
                                      Speech(text: "Eu entrei no hospital e fui o mais rápido para o quarto em que ela estava"),
                                      Speech(text: "Ela estava tão miúda, tão magra..."),
                                      Speech(text: "Eu me aproximei da cama...")])]
    
    
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
