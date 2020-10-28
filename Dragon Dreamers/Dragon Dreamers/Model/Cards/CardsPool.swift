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
        let semNomeCard = getSemNomeCard()
        let desviarCard = getDesviarCard()
        let defenderCard = getDefenderCard()
        let fugirCard = getFugirCard()
        let prevenirCard = getNoEffectCard()
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
        
        allCards.append(contentsOf: [reclamarCard, afirmarCard, incomodarCard, comandarCard, semNomeCard, desviarCard, defenderCard, fugirCard, prevenirCard, evitarCard, planejarCard, questionarCard, argumentarCard, examinarCard, comentarCard, agradarCard, concordarCard, aceitarCard, aprovarCard])
        
        enemyCards.append(aceitarCard)
        
    }
    
    func getADeck(){
        setupCardAvailable()
        for card in allCards{
            card.setupEffectsFunction()
            deck.addCard(card)
        }
        allCards.removeAll()
        enemyCards.removeAll()
    }
    
    func getEnemyDeck(){
        setupCardAvailable()
        for card in enemyCards{
            card.setupEffectsFunction()
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
        return newCard
    }
    
    func getAfirmarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Afirmar"
        newCard.effectsEnum.append(.afirmar)
        newCard.humorInfluence = -30
        newCard.cost = 2
        newCard.emotion = .criticize
        return newCard
    }
    
    func getIncomodarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Incomodar"
        newCard.effectsEnum.append(.incomodar)
        newCard.humorInfluence = -15
        newCard.cost = 1
        newCard.emotion = .criticize
        return newCard
    }
    
    func getComandarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Comandar"
        newCard.effectsEnum.append(.comandar)
        newCard.humorInfluence = -15
        newCard.cost = 1
        newCard.emotion = .criticize
        return newCard
    }
    
    func getSemNomeCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "SemNome"
        newCard.effectsEnum.append(.semNome)
        newCard.humorInfluence = -15
        newCard.cost = 1
        newCard.emotion = .criticize
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
        return newCard
    }
    
    func getDefenderCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Defender"
        newCard.effectsEnum.append(.defender)
        newCard.humorInfluence = 0
        newCard.cost = 2
        newCard.emotion = .avoid
        return newCard
    }
    
    func getFugirCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Fugir"
        newCard.effectsEnum.append(.fugir)
        newCard.humorInfluence = 0
        newCard.cost = 2
        newCard.emotion = .avoid
        return newCard
    }
    
    func getPrevenirCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Prevenir"
        newCard.effectsEnum.append(.prevenir)
        newCard.humorInfluence = 0
        newCard.cost = 1
        newCard.emotion = .avoid
        return newCard
    }
    
    func getEvitarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Evitar"
        newCard.effectsEnum.append(.evitar)
        newCard.humorInfluence = 0
        newCard.cost = 1
        newCard.emotion = .avoid
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
        return newCard
    }
    
    func getExaminarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Examinar"
        newCard.effectsEnum.append(.examinar)
        newCard.humorInfluence = 0
        newCard.cost = 1
        newCard.emotion = .questioning
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
        return newCard
    }
    
    func getConcordarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Concordar"
        newCard.effectsEnum.append(.concordar)
        newCard.humorInfluence = 30
        newCard.cost = 2
        newCard.emotion = .agree
        return newCard
    }
    
    func getAceitarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Aceitar"
        newCard.effectsEnum.append(.aceitar)
        newCard.humorInfluence = 30
        newCard.cost = 2
        newCard.emotion = .agree
        return newCard
    }
    
    func getAprovarCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Aprovar"
        newCard.effectsEnum.append(.aprovar)
        newCard.humorInfluence = 15
        newCard.cost = 1
        newCard.emotion = .agree
        return newCard
    }
    
    
//    func getAgreeIncreaseCard(amount: Int) -> Card{
//        let newCard = getNoEffectCard()
//        newCard.name = "Agree+"
//        newCard.effectsEnum.append(contentsOf: [.addAgree])
//        newCard.amount = amount
//        return newCard
//    }
//
//    func getAgreeDecreaseCard(amount: Int) -> Card{
//        let newCard = getNoEffectCard()
//        newCard.name = "Agree-"
//        newCard.effectsEnum.append(contentsOf: [.removeAgree])
//        newCard.amount = amount
//        return newCard
//    }
//
//    func getAvoidIncreaseCard(amount: Int) -> Card{
//        let newCard = getNoEffectCard()
//        newCard.name = "Avoid+"
//        newCard.effectsEnum.append(contentsOf: [.addAvoid])
//        newCard.amount = amount
//        return newCard
//    }
//
//    func getAvoidDecreaseCard(amount: Int) -> Card{
//        let newCard = getNoEffectCard()
//        newCard.name = "Avoid-"
//        newCard.effectsEnum.append(contentsOf: [.removeAvoid])
//        newCard.amount = amount
//        return newCard
//    }
//    func getQuestioningIncreaseCard(amount: Int) -> Card{
//        let newCard = getNoEffectCard()
//        newCard.name = "Questioning+"
//        newCard.effectsEnum.append(contentsOf: [.addQuestioning])
//        newCard.amount = amount
//        return newCard
//    }
//    func getQuestioningDecreaseCard(amount: Int) -> Card{
//        let newCard = getNoEffectCard()
//        newCard.name = "Questioning-"
//        newCard.effectsEnum.append(contentsOf: [.removeQuestioning])
//        newCard.amount = amount
//        return newCard
//    }
//    func getCriticizeIncreaseCard(amount: Int) -> Card{
//        let newCard = getNoEffectCard()
//        newCard.name = "Criticize+"
//        newCard.effectsEnum.append(contentsOf: [.addCriticize])
//        newCard.amount = amount
//        return newCard
//    }
//
//    func getCriticizeDecreaseCard(amount: Int) -> Card{
//        let newCard = getNoEffectCard()
//        newCard.name = "Criticize-"
//        newCard.effectsEnum.append(contentsOf: [.removeCriticize])
//        newCard.amount = amount
//        return newCard
//    }
//
//    func getReasoningIncreaseCard(amount: Int) -> Card{
//        let newCard = getNoEffectCard()
//        newCard.name = "Reasoning+"
//        newCard.effectsEnum.append(contentsOf: [.addReasoning])
//        newCard.amount = amount
//        return newCard
//    }
//    func getReasoningDecreaseCard(amount: Int) -> Card{
//        let newCard = getNoEffectCard()
//        newCard.name = "Reasoning-"
//        newCard.effectsEnum.append(contentsOf: [.removeReasoning])
//        newCard.amount = amount
//        return newCard
//    }
//    func getReasoningStatusCard(amount: Int) -> Card{
//        let newCard = getNoEffectCard()
//        newCard.name = "ReasStatus"
//        newCard.effectsEnum.append(contentsOf: [.setReasoningStatus])
//        newCard.amount = amount
//        return newCard
//    }
//    func getVulnerableStatusCard() -> Card{
//        let newCard = getNoEffectCard()
//        newCard.name = "VulnStatus"
//        newCard.effectsEnum.append(contentsOf: [.setVulnerableStatus])
//        return newCard
//    }
//
//
//    func getBolarPlano() -> Card{
//        let newCard = getNoEffectCard()
//        newCard.name = "Bolar Plano"
//        newCard.effectsEnum.append(contentsOf: [.setReasoningStatus])
//        newCard.amount = 2
//        newCard.cost = 1
//        newCard.type = .yellow
//        return newCard
//    }
//
//    func getOdioAcumulado() -> Card{
//        let newCard = getNoEffectCard()
//        newCard.name = "Odio Acumulado"
//        newCard.effectsEnum.append(contentsOf: [.setReasoningStatus])
//        newCard.amount = 2
//        newCard.cost = 1
//        newCard.type = .yellow
//        return newCard
//    }
}
