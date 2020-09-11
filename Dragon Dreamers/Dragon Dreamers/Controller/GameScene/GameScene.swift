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
    
    //Provisório pro alpha mudar depois
    var enemyNode    : SKNode!
    var enemyLife    : SKLabelNode!
    var enemyLifeBar : SKShapeNode!
    var enemyOther   : SKLabelNode!
    var enemyOtherBar : SKShapeNode!
    
    var battleManager: BattleManager = BattleManager()
    
    
    func initScene () { // ALWAYS CALL THIS BEFORE PRESENTING SCENE
        deckNode = childNode(withName: "Deck")!
        deckNumber = deckNode.childNode(withName: "DeckCardAmount") as? SKLabelNode
        
        discardNode = childNode(withName: "Discard")!
        print("Discard Node Position: \(discardNode.position)")
        discardNumber = discardNode.childNode(withName: "DeckCardAmount") as? SKLabelNode
        
        bannedNode = childNode(withName: "Banned")!
        print("Banned Node Position: \(bannedNode.position)")
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
        
        playAreaNode = childNode(withName: "Play")!
        let playAreaCards = playAreaNode.childNode(withName: "Cards")!
        
        for node in playAreaCards.children {
            if node.name == "Card" {
                playAreaNodes.append(node)
            }
        }
        
        
        //Provisorio pro alpha, mudar depois
        enemyNode = childNode(withName: "Enemy")!
        let enemyLifeNode = enemyNode.childNode(withName: "LifeBar")!
        enemyLife = enemyLifeNode.childNode(withName: "Value") as? SKLabelNode
        enemyLifeBar = enemyLifeNode.childNode(withName: "Bar") as? SKShapeNode
        
        let enemyOtherNode = enemyNode.childNode(withName: "OtherBar")!
        enemyOther = enemyOtherNode.childNode(withName: "Value") as? SKLabelNode
        enemyOtherBar = enemyOtherNode.childNode(withName: "Bar") as? SKShapeNode
        
        
        //fillPool() só está sendo executado aqui pelo alpha, ele deveria ser executado a partir fa primeira fase
        Player.shared.manaManager.fillPool(manas: [ManaType.r, ManaType.r, ManaType.r, ManaType.r, ManaType.r])
        for i in 0 ..< Player.shared.manaManager.manaPool.count {
            let pos = self.convert(manaNodes[i].position, from: manaNode)
            createManaNode(mana: Player.shared.manaManager.manaPool[i], at: pos)
        }
        
        createHandEllipse()
        
        drawCards()
        
        battleManager.startBattle()
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
        let bases = self.childNode(withName: "Bases")!
        let cardBase = bases.childNode(withName: "CardBase")!
        let cardNode = cardBase.copy() as! SKNode
        cardNode.position = pos.position
        
        card.node = cardNode
        card.node.name = "\(card.id)"
        self.addChild(card.node)
    }
    
    func createManaNode (mana: Mana, at pos: CGPoint) {
        let manaType = mana.getType()
        
        let bases = self.childNode(withName: "Bases")!
        let manas = bases.childNode(withName: "Manas")!
        var manaBase = manas.childNode(withName: "B")!
        
        switch manaType {
        case .b:
            manaBase = manas.childNode(withName: "B")!
        case .g:
            manaBase = manas.childNode(withName: "G")!
        case .r:
            manaBase = manas.childNode(withName: "R")!
        case .y:
            manaBase = manas.childNode(withName: "Y")!
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
        let move = SKAction.move(to: pos, duration: 0.2)
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
        let move = SKAction.move(to: pos, duration: 0.2)
        let rotate = SKAction.rotate(toAngle: degrees2radians(angle), duration: 0.2, shortestUnitArc: true)
        
        let actions = SKAction.group([move, rotate])
        card.node.run(actions) {
            completion()
        }
    }
    
    func moveMana (mana: Mana, to pos: CGPoint) {
        let move = SKAction.move(to: pos, duration: 0.2)
        mana.node?.run(move)
    }
    
    func calculateCardPosition (angle: CGFloat) -> CGPoint {
        let tang = Double(angle) * Double.pi / 180.0
        let cose = CGFloat(cos(tang))
        let sine = CGFloat(sin(tang))
        let x = handNode.position.x + halfWidth  * cose
        let y = handNode.position.y + halfHeight * sine
        
        return CGPoint(x: x, y: y)
    }
    
    func calculateCardAngle (angle: CGFloat) -> CGFloat {
        let difference = 90 - angle
        let newAngle = difference * -1 / 3
        return newAngle
    }
    
    /// >>>----------> REARANGING STUFF
    
    func distributeCardNodes () {
        // Check if there are cards in the Player's Hand

            print("> Distributing cards!")
            if Player.shared.hand.isEmpty() && !nextTurning {
                print("Hand Empty: Trigger Next Turn")
                self.nextTurn()
            } else if !nextTurning {
                //Verify number of cards the player has
                let numberOfCards = Player.shared.hand.cards.count
                print("Number of Cards: \(numberOfCards)")
                // Divide the space between the cards
                let angle : CGFloat = 180.0 / CGFloat(numberOfCards + 1)
                
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
                print("-------")
            }
        
    }
    
    func rearangeManaNodes () {
        var availableManas : [Mana] = []
        for mana in Player.shared.manaManager.manaPool {
            if mana.isAvaliable && mana.node?.isHidden == false {
                availableManas.append(mana)
            }
        }
        
        for i in 0 ..< availableManas.count {
            let pos = self.convert(manaNodes[i].position, from: manaNode)
            let mana = availableManas[i]
            moveMana(mana: mana, to: pos)
        }
    }
    
    
    /// >>>----------> GAMEPLAY FUNCs
    
    var nextTurning = false
    func nextTurn () {
        nextTurning = true
        battleManager.enemyTurn(){
            
        }
        battleManager.endTurn()
        self.discardOngoing()
        self.discardHand() {
            print("Discard: \(Player.shared.discard.cards.count)")
            print("Deck   : \(Player.shared.deck.cards.count)")
            print("Hand   : \(Player.shared.hand.cards.count)")
            print(">> Drawing Cards")
            self.nextTurning = false
            self.drawCards()
            
            //self.distributeCardNodes()
        }
        Player.shared.manaManager.resetAllManaFromManaPool()
        
        for mana in Player.shared.manaManager.manaPool {
            if mana.node?.isHidden == true{
                mana.node?.isHidden = false
            }
        }
        
        print("new turn")

        self.rearangeManaNodes()
        
    }
    
    func drawCards () {
        let cardsToDraw = 5
        
        // If deck doesn't have all the cards
        if Player.shared.deck.cards.count < cardsToDraw {
            // Saves the number of cards that still need to be drawn
            let remainingCards = cardsToDraw - Player.shared.deck.cards.count
            print(">> Remaining cards: \(remainingCards)")
            
            // gets new deck from the discard pile
            self.getCardsFromDiscard() {
                print("Getting remaining cards")
                // draws the remaining cards
                self.drawHandCards(remainingCards)
                self.nextTurning = false
            }
            drawHandCards(cardsToDraw - remainingCards)
        } else {
            drawHandCards(cardsToDraw)
            nextTurning = false
        }
    }
    
    func drawHandCards (_ amount: Int) {
        //AQUI FOI COMENTADO PARA O FIX DE DAR DRAW EM QUANTIDADES MENORES DO QUE O NECESSÁRIO (5)
        //AINDA TEM DEFEITO, MAS JÁ FUNCIONA MINIMAMENTE
//        if !gettingCardsFromDiscard {
            print(">> Drawing hand cards: \(amount)")
            // Gets how many cards are already in the Player's Hand
            let handCards = Player.shared.hand.cards.count
            
            // Changes cards between decks (from deck to hand)
            Player.shared.drawCards(amount: amount)
            
            // Create card nodes from top cards in player's deck
            // (Only for cards that don't already have nodes)
            for i in handCards ..< Player.shared.hand.cards.count {
                let card = Player.shared.hand.cards[i]
                createCardNode(card: card, at: deckNode)
            }
        
            print("Player Hand Amount: \(Player.shared.hand.cards.count)")
            print("------- Done drawing cards: \(amount)")
            
            // Make sure card nodes are in the correct place
            // And move cards to correct Nodes
            distributeCardNodes()
//        }
    }
    
    func playCard (index: Int, manaType: ManaType) {
        // Moves card node to play area
        
        var aux = false
            
        for mana in Player.shared.manaManager.manaPool {
            if mana.type == manaType {
                if !mana.isAvaliable && mana.node?.isHidden == false && aux == false{
                    mana.node?.isHidden = true
                    rearangeManaNodes()
                    aux = true
                }
            }
        }
        
        // Gets number of cards that are already in the Play Area
        let i = Player.shared.ongoing.cards.count
        // Calculates the position for this card
        let pos = self.convert(playAreaNodes[i].position, from: playAreaNode)
        // Gets card from player's hand
        let card = Player.shared.hand.cards[index]
        
        // Moves card node to play area
        moveAndRotateCard(card: card, to: pos, to: 0.0) {
            Player.shared.playCard(index: index)
            // Store card played for applying effect later
            self.battleManager.storeCard(card: card)
            card.node.position = pos
            self.distributeCardNodes()
            // Checks if there are still mana left
            if Player.shared.manaManager.checkPoolIsAllUsed() {
                // if there is no more mana, trigger next turn
                self.nextTurn()
            }
        }
    }
    
    var gettingCardsFromDiscard = false
    
    func getCardsFromDiscard (completion: @escaping () -> () = { }) {
        if !gettingCardsFromDiscard {
            print(">> Getting cards from Discard")
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
            print("Start Loop of getting cards from Discard")
            gettingCardsFromDiscard = true
            discardNode.run(loop) {
                print("----- Finished Getting cards from Discard")
                self.gettingCardsFromDiscard = false
                completion()
            }
            //Shuffle verything in deck
            Player.shared.deck.shuffle()
        }
    }
    
    
    /// >>>----------> GAMEPLAY ASSIST FUNCs
    
    func discardHand (completion: @escaping () -> () = { }) {
        // Runs through all cards in player's hand and discards them
        print(">> Discarting Hand")
        for card in Player.shared.hand.cards {
            discardCard(card: card) {
                Player.shared.hand.removeCard(id: card.id)
                if Player.shared.hand.cards.count == 0 {
                    print("----- Done discarding hand")
                    completion()
                }
            }
        }
        if Player.shared.hand.cards.count == 0 {
            print("----- Done discarding hand")
            completion()
        }
        //Player.shared.hand.removeAllCards()
    }
    
    func discardOngoing () {
        // Runs through all cards in player's ongoing deck and discarts them
        for card in Player.shared.ongoing.cards {
            discardCard(card: card)
        }
        Player.shared.ongoing.removeAllCards()
    }
    
    func discardCard (card : Card, completion: @escaping () -> () = { }) {
        // Moves card's node into discart deck node
        moveAndRotateCard(card: card, to: discardNode.position, to: 0) {
            Player.shared.discard.addCard(card)
            card.node.removeFromParent()
            completion()
        }
    }
    
    func banCard (card: Card, completion: @escaping () -> () = { }) {
        moveAndRotateCard(card: card, to: bannedNode.position, to: -90) {
            Player.shared.banished.addCard(card)
            card.node.removeFromParent()
            completion()
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
        
        //corrigir depois do alpha
        if let enemyCurrentLife = Enemy.shared.currentLife {
            enemyLife.text = "\(enemyCurrentLife)"
            let percentage = (enemyCurrentLife / Enemy.shared.maxLife) * 100
            let updateBar = SKAction.resize(toWidth: CGFloat(percentage), duration: 0.1)
            enemyLifeBar?.run(updateBar)
        }
        if let enemyCurrentOther = Enemy.shared.currentReason{
            enemyOther.text = "\(enemyCurrentOther)"
            let percentage = (enemyCurrentOther / Enemy.shared.maxReason) * 100
            let updateBar = SKAction.resize(toWidth: CGFloat(percentage), duration: 0.1)
            enemyOtherBar?.run(updateBar)
        }
        
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
    
    var movingCard      : Card?
    var movingCardIndex : Int?
    var movingCardDeck  : Deck?
    
    // Start Touch!
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
                                    print(">>------> got card from hand")
                                    movingCard = card
                                    movingCardDeck = Player.shared.hand
                                    movingCardIndex = i
                                    rotateCard(card: card, to: 0.0)
                                    found = true
                                }
                            }
                            for i in 0 ..< Player.shared.ongoing.cards.count {
                                let card = Player.shared.ongoing.getCard(i)
                                if parentNode.name == "\(card.id)" {
                                    movingCard = card
                                    movingCardDeck = Player.shared.ongoing
                                    movingCardIndex = i
                                    rotateCard(card: card, to: 0.0)
                                    found = true
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Touch moved (draging on the screen)
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let card = self.movingCard {
            let touchLocation = touch.location(in: self)
            card.node.position = touchLocation
        }
    }
    
    func finishTouches (nodes: [SKNode]) {
        for node in nodes.reversed() {
            // If card is on top of Play Area...
            if node.name == "Play Area" {
                print("> card is in the play area")
                if let deckName = movingCardDeck?.name {
                    // And the deck of the card is Hand...
                    if deckName == "Hand" {
                        // Play the card!
                        print("Moving card to play area")
                        moveCardToPlayArea()
                        return
                    }
                }
            } else if node.name == "Banned Area" {
                print("> Card has been Banned")
                if let deckName = movingCardDeck?.name {
                    if deckName == "Hand" {
                        let card = Player.shared.hand.cards[movingCardIndex!]
                        banCard(card: card)
                        Player.shared.hand.removeCard(id: card.id)
                        self.distributeCardNodes()
                        return
                    }
                }
            } else if node.name == "Discard Area" {
                print("> Card has been Discarded")
                if let deckName = movingCardDeck?.name {
                    if deckName == "Hand" {
                        let card = Player.shared.hand.cards[movingCardIndex!]
                        discardCard(card: card)
                        Player.shared.hand.removeCard(id: card.id)
                        self.distributeCardNodes()
                        return
                    }
                }
            }
        }
        print("> Card is not in any area")
        moveCardBack()
    }
    
    func moveCardToPlayArea () {
        // Get info on Card and ManaType
        let card = Player.shared.hand.cards[movingCardIndex!]
        let manaType : ManaType = card.switchCardTypeToManaType()
        
        printManaType(manaType: manaType)
        // Check if player HAS the mana to play before!!
        print("checking for mana type")
        if Player.shared.manaManager.useManaFromManaPool(type: manaType) {
            // If the player has, play the card!
            print("playing the card")
            playCard(index: movingCardIndex!, manaType: manaType)
        } else {
            // if not, card goes back to hand
            moveCardBack()
        }
        clearVars()
    }
    
    func printManaType (manaType: ManaType) {
        switch manaType {
        case .b:
            print("mana type: Blue")
        case .r:
            print("mana type: Red")
        case .g:
            print("mana type: Green")
        case .y:
            print("mana type: Yellow")
        default:
            print("no mana type")
        }
    }
    
    func moveCardBack() {
        print("moving card back")
        if let deckName = movingCardDeck?.name {
            if deckName == "Hand" {
                // move card back to hand
                let pos = self.convert(handNodes[movingCardIndex!].position, from: handNode)
                let move = SKAction.move(to: pos, duration: 0.1)
                movingCard!.node.run(move)
                distributeCardNodes()
                clearVars()
            } else if deckName == "Ongoing" {
                // move card back to play area
                let pos = self.convert(playAreaNodes[movingCardIndex!].position, from: playAreaNode)
                let move = SKAction.move(to: pos, duration: 0.1)
                movingCard!.node.run(move)
                clearVars()
            }
        }
    }
    
    func clearVars () {
        self.movingCard = nil
        self.movingCardIndex = nil
        self.movingCardDeck = nil
    }
    
    // Player releases touch
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            let nodes = self.nodes(at: location)
            
            finishTouches(nodes: nodes)
        }
    }
    
    // Touch was cancelled...
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Just moves card back to where it came from
        //moveCardBack()
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        self.updateValues()
    }
}
