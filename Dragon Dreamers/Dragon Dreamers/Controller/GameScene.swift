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
    
    func initScene () {
        
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
        
        self.updateValues()
    }
    
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
    
    func createCardNode (card : Card, at pos: SKNode) {
        
        let cardBase = childNode(withName: "CardBase")!
        let cardNode = cardBase.copy() as! SKNode
        cardNode.position = pos.position
        
        card.node = cardNode
        self.addChild(card.node)
    }
    
    func playCard (index i: Int) {
        // Moves card node to play area
        let index = Player.shared.ongoing.cards.count
        let pos = self.convert(playAreaNodes[index].position, from: playAreaNode)
        let card = Player.shared.hand.cards[i]
        
        moveCard(card: card, to: pos)
        
        // Changes card between decks (from hand to ongoing)
        Player.shared.playCard(index: i)
        
        // Discart rest of hand
        self.discardHand()
    }
    
    func discardHand () {
        // Runs through all cards in player's hand and discards them
        for card in Player.shared.hand.cards {
            discardCard(card: card)
        }
        
        Player.shared.discardHand()
    }
    
    func discardOngoing () {
        // Runs through all cards in player's ongoing deck and discarts them
        for card in Player.shared.ongoing.cards {
            discardCard(card: card)
            Player.shared.ongoing.removeCard(card: card)
        }
        Player.shared.ongoing.cards = []
    }
    
    func discardCard (card : Card) {
        // Moves card's node into discart deck node
        let move = SKAction.move(to: discardNode.position, duration: 0.5)
        card.node.run(move) {
            //Player.shared.discard.cards.append(card)
            card.node.removeFromParent()
        }
    }
    
    func getCardsFromDiscard () {
        
        /*
        let delay = SKAction.wait(forDuration: 0.05)
        let action = SKAction.repeat(delay, count: Player.shared.discard.cards.count-1)
        
        var i = 0
        
        print("Started loop")
        discardNode.run(action) {
            print("Ran \(i) times")
            self.runCardFromDiscardToDeck(card: Player.shared.discard.cards[i])
            i += 1
        }
        */
        
        for i in 0 ..< Player.shared.discard.cards.count {
            let card = Player.shared.discard.cards[i]
            createCardNode(card: card, at: discardNode)
            
            let delay = SKAction.wait(forDuration: Double(i)/10)
            let move  = SKAction.move(to: deckNode.position, duration: 0.5)
            let sequence = SKAction.sequence([delay, move])
            
            card.node.run(sequence) {
                card.node.removeFromParent()
            }
        }
        
        Player.shared.getNewDeckFromDiscart()
    }
    
    func runCardFromDiscardToDeck (card: Card) {
        createCardNode(card: card, at: discardNode)
        
        moveCard(card: card, to: deckNode.position) {
            card.node.removeFromParent()
        }
    }
    
    func moveCard (card: Card, to pos: CGPoint, completion: @escaping () -> () = { }) {
        // Moves a card to another node's location
        let move = SKAction.move(to: pos, duration: 0.5)
        card.node.run(move) {
            completion()
        }
    }
    
    func updateValues () {
        let deckCardsAmmount = Player.shared.deck.cards.count
        deckNumber.text = "\(deckCardsAmmount)"
        
        let discartCardsAmmount = Player.shared.discard.cards.count
        discardNumber.text = "\(discartCardsAmmount)"
    }
    
    
    
    
    override func didMove(to view: SKView) {
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        self.updateValues()
    }
}
