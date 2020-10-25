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
    
    func setupCardAvailable(){
        let agreeAdd = getAgreeIncreaseCard(amount: 5)
        let agreeRemove = getAgreeDecreaseCard(amount: 5)
        let avoidAdd = getAgreeIncreaseCard(amount: 5)
        let avoidRemove = getAgreeDecreaseCard(amount: 5)
        let questioningAdd = getQuestioningIncreaseCard(amount: 5)
        let questioningRemove = getQuestioningDecreaseCard(amount: 5)
        let criticizeAdd = getCriticizeIncreaseCard(amount: 5)
        let criticizeRemove = getCriticizeDecreaseCard(amount: 5)
        let reasoningAdd = getReasoningIncreaseCard(amount: 5)
        let reasoningRemove = getReasoningDecreaseCard(amount: 5)
        let reasoningStatus = getReasoningStatusCard(amount: 4)
        let vulnerableStatus = getVulnerableStatusCard()
        
        allCards.append(contentsOf: [agreeAdd, agreeRemove, avoidAdd, avoidRemove, questioningAdd, questioningRemove, criticizeAdd, criticizeRemove, reasoningAdd, reasoningRemove, reasoningStatus, vulnerableStatus])
//        allCards.append(contentsOf: [criticizeRemove, reasoningAdd, reasoningRemove, reasoningStatus, vulnerableStatus])
    }
    
    func getADeck(){
        setupCardAvailable()
        for card in allCards{
            card.setupEffectsFunction()
            setHumorInfluence(card: card, amount: 5)
            deck.addCard(card)
        }
        allCards.removeAll()
    }
    
    func setHumorInfluence(card: Card, amount: Int){
        card.humorInfluence = amount
    }
    
    //### Create one card of each effect
    func getNoEffectCard() -> Card {
        let card = Card(name: "No name", effects: [], cost: 1, cardType: .green, humanType: .enemy, humorInfluence: 0)
        return card
    }
    
    func getAgreeIncreaseCard(amount: Int) -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Agree+"
        newCard.effectsEnum.append(contentsOf: [.addAgree])
        newCard.amount = amount
        return newCard
    }
    
    func getAgreeDecreaseCard(amount: Int) -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Agree-"
        newCard.effectsEnum.append(contentsOf: [.removeAgree])
        newCard.amount = amount
        return newCard
    }
    
    func getAvoidIncreaseCard(amount: Int) -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Avoid+"
        newCard.effectsEnum.append(contentsOf: [.addAvoid])
        newCard.amount = amount
        return newCard
    }
    
    func getAvoidDecreaseCard(amount: Int) -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Avoid-"
        newCard.effectsEnum.append(contentsOf: [.removeAvoid])
        newCard.amount = amount
        return newCard
    }
    func getQuestioningIncreaseCard(amount: Int) -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Questioning+"
        newCard.effectsEnum.append(contentsOf: [.addQuestioning])
        newCard.amount = amount
        return newCard
    }
    func getQuestioningDecreaseCard(amount: Int) -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Questioning-"
        newCard.effectsEnum.append(contentsOf: [.removeQuestioning])
        newCard.amount = amount
        return newCard
    }
    func getCriticizeIncreaseCard(amount: Int) -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Criticize+"
        newCard.effectsEnum.append(contentsOf: [.addCriticize])
        newCard.amount = amount
        return newCard
    }
    
    func getCriticizeDecreaseCard(amount: Int) -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Criticize-"
        newCard.effectsEnum.append(contentsOf: [.removeCriticize])
        newCard.amount = amount
        return newCard
    }
    
    func getReasoningIncreaseCard(amount: Int) -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Reasoning+"
        newCard.effectsEnum.append(contentsOf: [.addReasoning])
        newCard.amount = amount
        return newCard
    }
    func getReasoningDecreaseCard(amount: Int) -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Reasoning-"
        newCard.effectsEnum.append(contentsOf: [.removeReasoning])
        newCard.amount = amount
        return newCard
    }
    func getReasoningStatusCard(amount: Int) -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "ReasStatus"
        newCard.effectsEnum.append(contentsOf: [.setReasoningStatus])
        newCard.amount = amount
        return newCard
    }
    func getVulnerableStatusCard() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "VulnStatus"
        newCard.effectsEnum.append(contentsOf: [.setVulnerableStatus])
        return newCard
    }
    
    
    func getBolarPlano() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Bolar Plano"
        newCard.effectsEnum.append(contentsOf: [.setReasoningStatus])
        newCard.amount = 2
        newCard.cost = 1
        newCard.type = .yellow
        return newCard
    }
    
    func getOdioAcumulado() -> Card{
        let newCard = getNoEffectCard()
        newCard.name = "Odio Acumulado"
        newCard.effectsEnum.append(contentsOf: [.setReasoningStatus])
        newCard.amount = 2
        newCard.cost = 1
        newCard.type = .yellow
        return newCard
    }
}
