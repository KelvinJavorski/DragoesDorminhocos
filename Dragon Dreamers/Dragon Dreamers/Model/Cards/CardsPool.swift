//
//  DeckPool.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 21/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

//mudar nome da classe
class CardsPool{
    var deck : Deck! = Deck()
    var allCards : [Card] = []
    var enemyCards: [Card] = []
    
    func setupCardAvailable(){
        let reclamarCard = getReclamarCard()
        let afirmarCard = getAfirmarCard()
        let incomodarCard = getIncomodarCard()
        let comandarCard = getComandarCard()
        let criticarCard = getCriticarCard()
        let desviarCard = getDesviarCard()
        let defenderCard = getDefenderCard()
        let fugirCard = getFugirCard()
//        let prevenirCard = getNoEffectCard()
        let evitarCard = getEvitarCard()
        let planejarCard = getPlanejarCard()
        let questionarCard = getQuestionarCard()
        let argumentarCard = getArgumentarCard()
        let examinarCard = getExaminarCard()
        let comentarCard = getComentarCard()
        let agradarCard = getAgradarCard()
        let concordarCard = getConcordarCard()
        let aceitarCard = getAceitarCard()
        let aprovarCard = getAprovarCard()
        
        allCards.append(contentsOf: [reclamarCard, afirmarCard, incomodarCard, comandarCard, criticarCard, desviarCard, defenderCard, fugirCard, evitarCard, planejarCard, questionarCard, argumentarCard, examinarCard, comentarCard, agradarCard, concordarCard, aceitarCard, aprovarCard])
        
        let criticarWeakCard = getCriticarWeakCard()
        let incomodarWeakCard = getIncomodarWeakCard()
        let defenderWeakCard = getDefenderWeakCard()
        let desviarWeakCard = getDesviarWeakCard()
        let comentarWeakCard = getComentarWeakCard()
        let planejarWeakCard = getPlanejarWeakCard()
        let aprovarWeakCard = getAprovarWeakCard()
        let aceitarWeakCard = getAceitarWeakCard()
        
        enemyCards.append(contentsOf: [criticarWeakCard, incomodarWeakCard, defenderWeakCard, desviarWeakCard, comentarWeakCard, planejarWeakCard, aprovarWeakCard, aceitarWeakCard])
        
    }
    
    func getADeck(){
        setupCardAvailable()
        for card in allCards{
//            card.setupEffectsFunction()
            deck.addCard(card)
        }
        allCards.removeAll()
        enemyCards.removeAll()
    }
    
    func getEnemyDeck(){
        setupCardAvailable()
        for card in enemyCards{
//            card.setupEffectsFunction()
            deck.addCard(card)
        }
        allCards.removeAll()
        enemyCards.removeAll()
    }
    
    func setHumorInfluence(card: Card, amount: Int){
        card.humorInfluence = amount
    }
    
    //### Create one card of each effect
    func getNoEffectCard() -> Card {
        let card = Card(name: "No name", effects: [], cost: 1, cardType: .green, humanType: .enemy, humorInfluence: 0)
        return card
    }
    
    //Sun cards
    func getReclamarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Reclamar"
        newCard.effectsEnum.append(.reclamar)
        newCard.humorInfluence = -30
        newCard.cost = 2
        newCard.emotion = .criticize
        newCard.type = .red
        return newCard
    }
    
    func getAfirmarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Afirmar"
        newCard.effectsEnum.append(.afirmar)
        newCard.humorInfluence = -30
        newCard.cost = 2
        newCard.emotion = .criticize
        newCard.type = .red
        return newCard
    }
    
    func getIncomodarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Incomodar"
        newCard.effectsEnum.append(.incomodar)
        newCard.humorInfluence = -15
        newCard.cost = 1
        newCard.emotion = .criticize
        newCard.type = .red
        return newCard
    }
    
    func getComandarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Comandar"
        newCard.effectsEnum.append(.comandar)
        newCard.humorInfluence = -15
        newCard.cost = 1
        newCard.emotion = .criticize
        newCard.type = .red
        return newCard
    }
    
    func getCriticarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Criticar"
        newCard.effectsEnum.append(.criticar)
        newCard.humorInfluence = -15
        newCard.cost = 1
        newCard.emotion = .criticize
        newCard.type = .red
        return newCard
    }
    
    //Sand Cards
    func getDesviarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Desviar"
        newCard.effectsEnum.append(.desviar)
        newCard.humorInfluence = 0
        newCard.cost = 2
        newCard.emotion = .avoid
        newCard.type = .yellow
        return newCard
    }
    
    func getDefenderCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Defender"
        newCard.effectsEnum.append(.defender)
        newCard.humorInfluence = 0
        newCard.cost = 2
        newCard.emotion = .avoid
        newCard.type = .yellow
        return newCard
    }
    
    func getFugirCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Fugir"
        newCard.effectsEnum.append(.fugir)
        newCard.humorInfluence = 0
        newCard.cost = 2
        newCard.emotion = .avoid
        newCard.type = .yellow
        return newCard
    }
    
//    func getPrevenirCard() -> Card{
//        let newCard = getNoEffectCard()
//        newCard.name = "Prevenir"
//        newCard.effectsEnum.append(.prevenir)
//        newCard.humorInfluence = 0
//        newCard.cost = 1
//        newCard.emotion = .avoid
//        newCard.type = .yellow
//        return newCard
//    }
    
    func getEvitarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Evitar"
        newCard.effectsEnum.append(.evitar)
        newCard.humorInfluence = 0
        newCard.cost = 1
        newCard.emotion = .avoid
        newCard.type = .yellow
        return newCard
    }
    
    //Breeze Cards
    func getPlanejarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Planejar"
        newCard.effectsEnum.append(.planejar)
        newCard.humorInfluence = 0
        newCard.cost = 0
        newCard.emotion = .questioning
        newCard.type = .green
        return newCard
    }
    
    func getQuestionarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Questionar"
        newCard.effectsEnum.append(.questionar)
        let humorOption = [-14,14]
        newCard.humorInfluence = humorOption.randomElement()
        newCard.cost = 2
        newCard.emotion = .questioning
        newCard.type = .green
        return newCard
    }
    
    func getArgumentarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Argumentar"
        newCard.effectsEnum.append(.argumentar)
        let humorOption = [-7,7]
        newCard.humorInfluence = humorOption.randomElement()
        newCard.cost = 1
        newCard.emotion = .questioning
        newCard.type = .green
        return newCard
    }
    
    func getExaminarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Examinar"
        newCard.effectsEnum.append(.examinar)
        newCard.humorInfluence = 0
        newCard.cost = 1
        newCard.emotion = .questioning
        newCard.type = .green
        return newCard
    }
    
    func getComentarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Comentar"
        newCard.effectsEnum.append(.comentar)
        let humorOption = [-7,7]
        newCard.humorInfluence = humorOption.randomElement()
        newCard.cost = 1
        newCard.emotion = .questioning
        newCard.type = .green
        return newCard
    }
    
    //Ocean Cards
    func getAgradarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Agradar"
        newCard.effectsEnum.append(.agradar)
        newCard.humorInfluence = 30
        newCard.cost = 2
        newCard.emotion = .agree
        newCard.type = .blue
        return newCard
    }
    
    func getConcordarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Concordar"
        newCard.effectsEnum.append(.concordar)
        newCard.humorInfluence = 30
        newCard.cost = 2
        newCard.emotion = .agree
        newCard.type = .blue
        return newCard
    }
    
    func getAceitarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Aceitar"
        newCard.effectsEnum.append(.aceitar)
        newCard.humorInfluence = 30
        newCard.cost = 2
        newCard.emotion = .agree
        newCard.type = .blue
        return newCard
    }
    
    func getAprovarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Aprovar"
        newCard.effectsEnum.append(.aprovar)
        newCard.humorInfluence = 15
        newCard.cost = 1
        newCard.emotion = .agree
        newCard.type = .blue
        return newCard
    }
    
    
// MARK: -Enemy Cards
    func getEnemyNoEffectCard() -> Card {
        let card = Card(name: "No name", effects: [], cost: 1, cardType: .green, humanType: .player, humorInfluence: 0)
        return card
    }
    
    func getCriticarWeakCard() -> Card{
        let newCard = getEnemyNoEffectCard()
        newCard.name = "Criticar"
        newCard.effectsEnum.append(.criticarWeak)
        newCard.cost = 1
        newCard.emotion = .criticize
        newCard.type = .red
        return newCard
    }
    
    func getIncomodarWeakCard() -> Card{
        let newCard = getEnemyNoEffectCard()
        newCard.name = "Incomodar"
        newCard.effectsEnum.append(.incomodarWeak)
        newCard.cost = 2
        newCard.emotion = .criticize
        newCard.type = .red
        return newCard
    }
    
    func getDefenderWeakCard() -> Card{
        let newCard = getEnemyNoEffectCard()
        newCard.name = "Defender"
        newCard.effectsEnum.append(.defenderWeak)
        newCard.cost = 1
        newCard.emotion = .avoid
        newCard.type = .yellow
        return newCard
    }
    
    func getDesviarWeakCard() -> Card{
        let newCard = getEnemyNoEffectCard()
        newCard.name = "Desviar"
        newCard.effectsEnum.append(.desviarWeak)
        newCard.cost = 2
        newCard.emotion = .avoid
        newCard.type = .yellow
        return newCard
    }
    
    func getComentarWeakCard() -> Card{
        let newCard = getEnemyNoEffectCard()
        newCard.name = "Comentar"
        newCard.effectsEnum.append(.comentarWeak)
        newCard.cost = 1
        newCard.emotion = .questioning
        newCard.type = .green
        return newCard
    }
    
    func getPlanejarWeakCard() -> Card{
        let newCard = getEnemyNoEffectCard()
        newCard.name = "Planejar"
        newCard.effectsEnum.append(.planejarWeak)
        newCard.cost = 3
        newCard.emotion = .questioning
        newCard.type = .green
        return newCard
    }
    
    func getAprovarWeakCard() -> Card{
        let newCard = getEnemyNoEffectCard()
        newCard.name = "Aprovar"
        newCard.effectsEnum.append(.aprovarWeak)
        newCard.cost = 1
        newCard.emotion = .agree
        newCard.type = .blue
        return newCard
    }
    
    func getAceitarWeakCard() -> Card{
        let newCard = getEnemyNoEffectCard()
        newCard.name = "Aceitar"
        newCard.effectsEnum.append(.aceitarWeak)
        newCard.cost = 3
        newCard.emotion = .agree
        newCard.type = .blue
        return newCard
    }
    
}
