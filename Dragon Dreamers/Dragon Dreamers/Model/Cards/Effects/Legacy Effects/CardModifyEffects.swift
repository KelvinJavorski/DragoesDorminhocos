//
//  CardModifyEffects.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 09/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class DrawCard : EffectProtocol{
    func applyEffects(card: Card) {
        card.owner.drawCards(amount: card.amount)
    }
}

class DiscardCard : EffectProtocol{
    func applyEffects(card: Card) {
        card.owner.hand.removeCard(id: card.cardTargetId)
    }
}

class BanCard : EffectProtocol{
    func applyEffects(card: Card) {
        let cardToBan = card.owner.hand.getCard(card.cardTargetId)
        card.owner.banished.addCard(cardToBan)
        card.owner.hand.removeCard(Card: cardToBan)
    }
}

class SendCardToDiscard : EffectProtocol{
    func applyEffects(card: Card) {
        let copy = card.copy() as! Card
        card.owner.discard.addCard(copy)
    }
}

class AddLastPlayedCardToDeck : EffectProtocol{
    func applyEffects(card: Card) {
        let lastCard = card.owner.ongoing.cards.last
        card.owner.deck.cards.insert(lastCard!, at: 0)
    }
}
