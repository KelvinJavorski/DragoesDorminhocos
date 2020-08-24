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
    var bannedNode    : SKNode!
    var bannedNumber  : SKLabelNode!
    
    var handNode      : SKNode!
    var handNodes     : [SKNode] = []
    var playAreaNode  : SKNode!
    var playAreaNodes : [SKNode] = []
    var manaNode      : SKNode!
    var manaNodes     : [SKNode] = []
    
    var circles : [SKShapeNode] = []
    var lines   : [SKShapeNode] = []
    
    var halfHeight : CGFloat = 60
    var halfWidth  : CGFloat = 130
    
    
    func initScene () { // ALWAYS CALL THIS BEFORE PRESENTING SCENE
        deckNode = childNode(withName: "Deck")!
        deckNumber = deckNode.childNode(withName: "DeckCardAmount") as? SKLabelNode
        
        discardNode = childNode(withName: "Discard")!
        discardNumber = discardNode.childNode(withName: "DeckCardAmount") as? SKLabelNode
        
        bannedNode = childNode(withName: "Banned")!
        bannedNumber = bannedNode.childNode(withName: "DeckCardAmount") as? SKLabelNode
        
        manaNode = childNode(withName: "Mana")!
        for node in manaNode.children {
            if node.name == "Mana" {
                manaNodes.append(node)
            }
        }
        
        handNode = childNode(withName: "Hand")!
        let cardsNode = handNode.childNode(withName: "Cards")!
        for node in cardsNode.children {
            if node.name == "Card" {
                handNodes.append(node)
            }
        }
        
        let playArea = childNode(withName: "Play")!
        playAreaNode = playArea.childNode(withName: "Cards")!
        for node in playAreaNode.children {
            if node.name == "Card" {
                playAreaNodes.append(node)
            }
        }
        
        //fillPool() só está sendo executado aqui pelo alpha, ele deveria ser executado a partir fa primeira fase
        Player.shared.manaManager.fillPool(manas: [ManaType.b, ManaType.b, ManaType.r])
        for i in 0 ..< Player.shared.manaManager.manaPool.count {
            let pos = self.convert(manaNodes[i].position, from: manaNode)
            createManaNode(mana: Player.shared.manaManager.manaPool[i], at: pos)
        }
        
        
        createHandEllipse()
        distributeCardNodes()
    }
    
    func createHandEllipse () {
        let rect = CGRect(x: handNode.position.x - halfWidth, y: handNode.position.y - halfHeight, width: halfWidth*2 , height: halfHeight*2 )
        
        let ellipse = SKShapeNode.init(ellipseIn: rect)
        ellipse.fillColor = .black
        ellipse.strokeColor = .blue
        ellipse.lineWidth = 2
        
        self.addChild(ellipse)
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
    
    func createManaNode (mana: Mana, at pos: CGPoint) {
        let manaType = mana.getType()
        var manaBase = childNode(withName: "B")!
        
        switch manaType {
        case .b:
            manaBase = childNode(withName: "B")!
        case .g:
            manaBase = childNode(withName: "G")!
        case .r:
            manaBase = childNode(withName: "R")!
        case .y:
            manaBase = childNode(withName: "Y")!
        default:
            break
        }
        
        let manaNode = manaBase.copy() as! SKNode
        manaNode.position = pos
        mana.node = manaNode
        self.addChild(mana.node!)
    }
    
    func moveCard (card: Card, to pos: CGPoint, completion: @escaping () -> () = { }) {
        // Moves a card to another node's location
        let move = SKAction.move(to: pos, duration: 0.5)
        card.node.run(move) {
            completion()
        }
    }
    
    func rotateCard (card: Card, to angle: CGFloat, completion: @escaping () -> () = { }) {
        let rotate = SKAction.rotate(toAngle: degrees2radians(angle), duration: 0.2, shortestUnitArc: true)
        card.node.run(rotate) {
            completion()
        }
    }
    
    func moveAndRotateCard (card: Card, to pos: CGPoint, to angle: CGFloat, completion: @escaping () -> () = { }) {
        let move = SKAction.move(to: pos, duration: 0.5)
        let rotate = SKAction.rotate(toAngle: degrees2radians(angle), duration: 0.5, shortestUnitArc: true)
        
        let actions = SKAction.group([move, rotate])
        card.node.run(actions) {
            completion()
        }
    }
    
    func calculateCardPosition (angle: CGFloat) -> CGPoint {
        let tang = angle * CGFloat(Double.pi / 180.0)
        let x = handNode.position.x + halfWidth  * CGFloat(cos(Double(tang)))
        let y = handNode.position.y + halfHeight * CGFloat(sin(Double(tang)))
        
        return CGPoint(x: x, y: y)
    }
    
    func calculateCardAngle (angle: CGFloat) -> CGFloat {
        let difference = 90 - angle
        let newAngle = difference * -1 / 2
        return newAngle
    }
    
    
    /// >>>----------> GAMEPLAY FUNCs
    
    func distributeCardNodes () {
        //Verify number of cards the player has
        let numberOfCards = Player.shared.hand.cards.count
        
        // Divide the space between the cards
        let angle : CGFloat = 180.0 / CGFloat(numberOfCards + 1) //CGFloat(cards + 1)
        
        // Move the nodes to the correct positions
        for i in 0 ..< numberOfCards {
            
            let ang = 180.0 - CGFloat(i + 1) * angle
            let pos = calculateCardPosition(angle: ang)
            let cardAngle = calculateCardAngle(angle: ang)
            
            //createCircle(at: pos, i: i)
            //createAngleLine(at: pos, angle: cardAngle, i: i)
            
            handNodes[i].position = self.convert(pos, to: handNode)
            
            if i < numberOfCards {
                moveAndRotateCard(card: Player.shared.hand.cards[i], to: pos, to: cardAngle)
            }
        }
    }
    
    func drawCards () {
        
        Player.shared.manaManager.resetAllManaFromManaPool()
        
        // Make sure Player's deck has all cards needed
        let cardsToDraw = 5 - Player.shared.hand.cards.count
        if Player.shared.deck.cards.count < cardsToDraw {
            let remainingCards = cardsToDraw - Player.shared.deck.cards.count
            print("Remaining cards: \(remainingCards)")
            self.getCardsFromDiscard() {
                print("getting remaining cards")
                self.drawHandCards(remainingCards)
            }
        }
        drawHandCards(cardsToDraw)
    }
    
    func drawHandCards (_ amount: Int) {
        // Changes cards between decks (from deck to hand)
        Player.shared.drawCards(amount: amount)
        
        // Create card nodes from top cards in player's deck
        for card in Player.shared.hand.cards {
            if card.node == nil {
                createCardNode(card: card, at: deckNode)
            }
        }
        
        // Make sure card nodes are in the correct place
        distributeCardNodes()
        
        // Animate moving the card nodes from deck node to hand nodes
        for index in 0 ..< Player.shared.hand.cards.count {
            let pos = self.convert(handNodes[index].position, from: handNode)
            moveCard(card: Player.shared.hand.cards[index], to: pos)
        }
        
        print("Player Hand Amount: \(Player.shared.hand.cards.count)")
    }
    
    func playCard (index: Int, manaType: ManaType) {
        // Moves card node to play area
        if Player.shared.manaManager.useManaFromManaPool(type: manaType) {
            let i = Player.shared.ongoing.cards.count
            let pos = self.convert(playAreaNodes[i].position, from: playAreaNode)
            let card = Player.shared.hand.cards[index]
            
            moveCard(card: card, to: pos) {
                // Changes card between decks (from hand to ongoing)
                Player.shared.playCard(index: index)
                self.discardHand()
            }
        }
        // Make sure cards are distrubuted correctly
        distributeCardNodes()
    }
    
    var gettingCardsFromDiscard = false
    
    func getCardsFromDiscard (completion: @escaping () -> () = { }) {
        if !gettingCardsFromDiscard {
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
            gettingCardsFromDiscard = true
            discardNode.run(loop) {
                completion()
                self.gettingCardsFromDiscard = false
            }
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
        }
        Player.shared.ongoing.removeAllCards()
    }
    
    func discardCard (card : Card) {
        // Moves card's node into discart deck node
        moveAndRotateCard(card: card, to: discardNode.position, to: 0) {
            Player.shared.discard.addCard(card)
            card.node.removeFromParent()
        }
    }
    
    
    
    func runCardFromDiscardToDeck (card: Card) {
        createCardNode(card: card, at: discardNode)
        
        moveCard(card: card, to: deckNode.position) {
            card.node.removeFromParent()
        }
    }
    
    func degrees2radians(_ angle: CGFloat) -> CGFloat {
        return angle * CGFloat(Double.pi) / 180.0
    }
    
    
    /// >>>----------> EXTRA FUNCs
    
    func updateValues () {
        let deckCardsAmount = Player.shared.deck.cards.count
        deckNumber.text = "\(deckCardsAmount)"
        
        let discartCardsAmount = Player.shared.discard.cards.count
        discardNumber.text = "\(discartCardsAmount)"
        
        let bannedCardsAmount = Player.shared.banished.cards.count
        bannedNumber.text = "\(bannedCardsAmount)"
    }
    
    func createCircle (at pos: CGPoint, i: Int) {
        if circles.count > i {
            circles[i].position = pos
        } else {
            let circle = SKShapeNode.init(circleOfRadius: 5)
            circle.position  = pos
            circle.fillColor = .cyan
            circle.lineWidth = 0
            circles.append(circle)
            self.addChild(circle)
        }
    }
    
    func createAngleLine (at pos: CGPoint, angle: CGFloat, i: Int) {
        let path = UIBezierPath()
        let tang = Double(angle) * Double.pi / 180.0
        let coseno = CGFloat(cos(tang) * 5.0)
        let seno   = CGFloat(sin(tang) * 5.0)
        let startPoint = CGPoint(x: pos.x - coseno, y: pos.y - seno)
        let endPoint   = CGPoint(x: pos.x + coseno, y: pos.y + seno)
        
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        
        if lines.count > i {
            lines[i].path = path.cgPath
        } else {
            let line = SKShapeNode(path: path.cgPath)
            line.lineWidth = 2
            line.strokeColor = .magenta
            
            lines.append(line)
            
            self.addChild(line)
        }
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
    
    var movingCard      : Card?
    var movingCardIndex : Int?
    var movingCardDeck  : Deck?
    
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
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            let nodes = self.nodes(at: location)
            
            for node in nodes.reversed() {
                if node.name == "PlayArea" {
                    if let deckName = movingCardDeck?.name {
                        if deckName == "Hand" {
                            // play the card
                            print("Playing the card")
                            let card = Player.shared.hand.cards[movingCardIndex!]
                            let cardType = card.type
                            switch cardType {
                            case .blue:
                                playCard(index: movingCardIndex!, manaType: .b)
                            case .green:
                                playCard(index: movingCardIndex!, manaType: .g)
                            case .red:
                                playCard(index: movingCardIndex!, manaType: .r)
                            case .yellow:
                                playCard(index: movingCardIndex!, manaType: .y)
                            default:
                                break
                            }
                            clearVars()
                            return
                        }
                    }
                    
                }
            }
            
            if let deckName = movingCardDeck?.name {
                if deckName == "Hand" {
                    // snap card back to original position
                    print("Moving card back to hand")
                    let pos = self.convert(handNodes[movingCardIndex!].position, from: handNode)
                    let move = SKAction.move(to: pos, duration: 0.1)
                    movingCard!.node.run(move)
                    clearVars()
                
                } else if deckName == "Ongoing" {
                    // snap card back to original position
                    print("Moving card back to ongoing")
                    let pos = self.convert(playAreaNodes[movingCardIndex!].position, from: playAreaNode)
                    let move = SKAction.move(to: pos, duration: 0.1)
                    movingCard!.node.run(move)
                    clearVars()
                }
            }
        }
    }
    
    func clearVars () {
        self.movingCard = nil
        self.movingCardIndex = nil
        self.movingCardDeck = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        clearVars()
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        self.updateValues()
    }
}
