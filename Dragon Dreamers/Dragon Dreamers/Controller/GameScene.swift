//
//  GameScene.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 04/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    var deckNode      : SKNode!
    var deckNumber    : SKLabelNode!
    var discardNode   : SKNode!
    var discardNumber : SKLabelNode!
    
    var handNode      : SKNode!
    var handNodes     : [SKNode] = []
    var playAreaNode  : SKNode!
    var playAreaNodes : [SKNode] = []
    
    
    func initScene () { // ALWAYS CALL THIS BEFORE PRESENTING SCENE
        deckNode = childNode(withName: "Deck")!
        deckNumber = deckNode.childNode(withName: "DeckCardAmmount") as? SKLabelNode
        
        discardNode = childNode(withName: "Discard")!
        discardNumber = discardNode.childNode(withName: "DeckCardAmmount") as? SKLabelNode
        
        
        let hand = childNode(withName: "Hand")!
        handNode = hand.childNode(withName: "Cards")!
        for node in handNode.children {
            if node.name == "Card" {
                handNodes.append(node)
            }
        }
        
        let playArea = childNode(withName: "PlayArea")!
        playAreaNode = playArea.childNode(withName: "Cards")!
        for node in playAreaNode.children {
            if node.name == "Card" {
                playAreaNodes.append(node)
            }
        }
    }
    
    /// >>>----------> BASE FUNCs
    
    func createCardNode (card : Card, at pos: SKNode) {
        let cardBase = childNode(withName: "CardBase")!
        let cardNode = cardBase.copy() as! SKNode
        cardNode.position = pos.position
        
        card.node = cardNode
        card.node.name = "\(card.id)"
        self.addChild(card.node)
    }
    
    func moveCard (card: Card, to pos: CGPoint, completion: @escaping () -> () = { }) {
        // Moves a card to another node's location
        let move = SKAction.move(to: pos, duration: 0.5)
        card.node.run(move) {
            completion()
        }
    }
    
    
    /// >>>----------> GAMEPLAY FUNCs
    
    func drawCards () {
        // Changes cards between decks (from deck to hand)
        Player.shared.drawCards(ammount: handNodes.count)
        
        // Create card nodes from top cards in player's deck
        for card in Player.shared.hand.cards {
            createCardNode(card: card, at: deckNode)
        }
        
        // Animate moving the card nodes from deck node to hand nodes
        for index in 0 ..< Player.shared.hand.cards.count {
            let pos = self.convert(handNodes[index].position, from: handNode)
            moveCard(card: Player.shared.hand.cards[index], to: pos)
        }
        
    }
    
    func playCard (index i: Int) {
        // Moves card node to play area
        let index = Player.shared.ongoing.cards.count
        let pos = self.convert(playAreaNodes[index].position, from: playAreaNode)
        let card = Player.shared.hand.cards[i]
        
        moveCard(card: card, to: pos) {
            // Changes card between decks (from hand to ongoing)
            Player.shared.playCard(index: i)
        }
        
        // Discart rest of hand
        self.discardHand()
    }
    
    func getCardsFromDiscard () {
        // Make sure discard deck is shuffled
        Player.shared.discard.shuffle()
        
        // Create actions
        let delay = SKAction.wait(forDuration: 0.1)
        let code  = SKAction.run {
            self.runCardFromDiscardToDeck(card: Player.shared.discard.cards[0])
            Player.shared.getCardFromDiscard(0)
        }
        let sequence = SKAction.sequence([delay, code])
        let loop = SKAction.repeat(sequence, count: Player.shared.discard.cards.count)
        
        // Run loop of actions
        print("Started loop")
        discardNode.run(loop) {
            print("Ended Loop")
        }
    }
    
    
    /// >>>----------> GAMEPLAY ASSIST FUNCs
    
    func discardHand () {
        // Runs through all cards in player's hand and discards them
        for card in Player.shared.hand.cards {
            discardCard(card: card)
        }
        Player.shared.hand.removeAllCards()
        //Player.shared.discardHand()
    }
    
    func discardOngoing () {
        // Runs through all cards in player's ongoing deck and discarts them
        for card in Player.shared.ongoing.cards {
            discardCard(card: card)
            Player.shared.discard.addCard(card)
        }
        Player.shared.ongoing.removeAllCards()
    }
    
    func discardCard (card : Card) {
        // Moves card's node into discart deck node
        let move = SKAction.move(to: discardNode.position, duration: 0.5)
        card.node.run(move) {
            Player.shared.discard.addCard(card)
            card.node.removeFromParent()
        }
    }
    
    func runCardFromDiscardToDeck (card: Card) {
        createCardNode(card: card, at: discardNode)
        
        moveCard(card: card, to: deckNode.position) {
            print("removed card")
            card.node.removeFromParent()
        }
    }
    
    
    /// >>>----------> EXTRA FUNCs
    
    func updateValues () {
        let deckCardsAmmount = Player.shared.deck.cards.count
        deckNumber.text = "\(deckCardsAmmount)"
        
        let discartCardsAmmount = Player.shared.discard.cards.count
        discardNumber.text = "\(discartCardsAmmount)"
    }
    
    
    
    /// >>>----------> PLAYER INTERACTION FUNCs
    
    override func didMove(to view: SKView) {
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        // Make Player "grab" a card
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        // Move card if any is grabbed
    }
    
    func touchUp(atPoint pos : CGPoint) {
        // Release card into nearest node (hand or ongoing)
    }
    
    var movingCard      : Card!
    var movingCardIndex : Int!
    var movingCardDeck  : Deck!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes.reversed() {
                if node.name == "CardShape" {
                    if let parentNode = node.parent {
                        var found = false
                        
                        while !found {
                            for i in 0 ..< Player.shared.hand.cards.count {
                                let card = Player.shared.hand.getCard(i)
                                if parentNode.name == "\(card.id)" {
                                    movingCard = card
                                    movingCardDeck = Player.shared.hand
                                    movingCardIndex = i
                                    found = true
                                }
                            }
                            for i in 0 ..< Player.shared.ongoing.cards.count {
                                let card = Player.shared.ongoing.getCard(i)
                                if parentNode.name == "\(card.id)" {
                                    movingCard = card
                                    movingCardDeck = Player.shared.ongoing
                                    movingCardIndex = i
                                    found = true
                                }
                            }
                        }
                        
                        print(">>---> Draging Card!")
                        print("Card ID: \(movingCard.id)")
                        print("Deck   : \(movingCardDeck.name)")
                        print("Index  : \(movingCardIndex)")
                        
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let card = self.movingCard {
            let touchLocation = touch.location(in: self)
            card.node.position = touchLocation
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Put card in nearest node!
        
        
        
        self.movingCard = nil
        self.movingCardIndex = nil
        self.movingCardDeck = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.movingCard = nil
        self.movingCardIndex = nil
        self.movingCardDeck = nil
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        self.updateValues()
    }
}
