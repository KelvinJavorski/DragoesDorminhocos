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
    
    weak var navigation: UIViewController!
    
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
    
    var playerNode  : SKNode!
    var playerLife  : SKLabelNode!
    var playerLifeBar : SKNode!
    var playerOther : SKLabelNode!
    var playerOtherBar : SKNode!
    
    var enemyNode    : SKNode!
    var enemyLife    : SKLabelNode!
    var enemyLifeBar : SKNode!
    var enemyOther   : SKLabelNode!
    var enemyOtherBar : SKNode!
    
    var battleManager: BattleManager = BattleManager()
    
    
    func initScene () { // ALWAYS CALL THIS BEFORE PRESENTING SCENE
        
        //Código a ser implementado na GameSceneNPCChoice//
        for enemy in DataSave.shared.gameCampaign.enemys {
            if enemy.name == "Vó Matilda" {
                DataTemp.shared.setChosenEnemy(enemy: enemy)
            }
        }
        //Código a ser implementado na GameSceneNPCChoice//
        
        battleManager.setEnemy(enemy: DataTemp.shared.chosenEnemy)
        
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
        
        playAreaNode = childNode(withName: "Play")!
        let playAreaCards = playAreaNode.childNode(withName: "Cards")!
        
        for node in playAreaCards.children {
            if node.name == "Card" {
                playAreaNodes.append(node)
            }
        }
        
        playerNode = childNode(withName: "Player")!
        let playerLifeNode = playerNode.childNode(withName: "LifeBar")!
        playerLife = playerLifeNode.childNode(withName: "Value") as? SKLabelNode
        playerLifeBar = playerLifeNode.childNode(withName: "Bar") as? SKSpriteNode
        
        let playerOtherNode = playerNode.childNode(withName: "OtherBar")!
        playerOther = playerOtherNode.childNode(withName: "Value") as? SKLabelNode
        playerOtherBar = playerOtherNode.childNode(withName: "Bar") as? SKSpriteNode
        
        enemyNode = childNode(withName: "Enemy")!
        let enemyLifeNode = enemyNode.childNode(withName: "LifeBar")!
        enemyLife = enemyLifeNode.childNode(withName: "Value") as? SKLabelNode
        enemyLifeBar = enemyLifeNode.childNode(withName: "Bar") as? SKSpriteNode
        
        let enemyOtherNode = enemyNode.childNode(withName: "OtherBar")!
        enemyOther = enemyOtherNode.childNode(withName: "Value") as? SKLabelNode
        enemyOtherBar = enemyOtherNode.childNode(withName: "Bar") as? SKSpriteNode
        
        
        //fillPool() só está sendo executado aqui pelo alpha, ele deveria ser executado a partir fa primeira fase
        Player.shared.manaManager.fillPool(manas: [ManaType.r, ManaType.r, ManaType.r, ManaType.r, ManaType.r])
        for i in 0 ..< Player.shared.manaManager.manaPool.count {
            let pos = self.convert(manaNodes[i].position, from: manaNode)
            createManaNode(mana: Player.shared.manaManager.manaPool[i], at: pos)
        }
        
        createHandEllipse()
        drawCards()
        
        battleManager.scene = self
        battleManager.startBattle()
    }
    
    func createHandEllipse () {
        let rect = CGRect(x: handNode.position.x - halfWidth, y: handNode.position.y - halfHeight, width: halfWidth*2 , height: halfHeight*2 )
        
        let ellipse = SKShapeNode.init(ellipseIn: rect)
        ellipse.fillColor = .black
        ellipse.strokeColor = .black
        ellipse.lineWidth = 2
        
        self.addChild(ellipse)
    }
    
    /// >>>----------> BASE FUNCs
    
    func createCircleNode(radius: CGFloat) -> SKShapeNode{
        let circle = SKShapeNode(circleOfRadius: radius)
        circle.fillColor = UIColor.red
        return circle
    }
    
    func createCardNode (card : Card, at pos: SKNode) {
        let bases = self.childNode(withName: "Bases")!
        let cardBase = bases.childNode(withName: "CardBase")!
        let cardNode = cardBase.copy() as! SKNode
        cardNode.position = pos.position
        card.node = cardNode
        card.node.name = "\(card.id)"
        for node in card.node.children{
            if node.name == "ManaLabel"{
                guard let nodeTest = node as? SKLabelNode else{ continue }
                if nodeTest.name == "ManaLabel"{
                    nodeTest.text = String(card.cost)
                }
            }
            if node.name == "ManaBackground"{
                guard let nodeBack = node as? SKSpriteNode else{ continue }
                nodeBack.color = card.getCardTypeColor()
            }
        }
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
        
        
        var manaNode = manaBase.copy() as! SKNode
        manaNode = createCircleNode(radius: 20)
        manaNode.position = pos
        mana.node = manaNode
        self.addChild(mana.node!)
    }
    
    func moveCard (card: Card, to pos: CGPoint, completion: @escaping () -> () = { }) {
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
        if Player.shared.hand.isEmpty() && !nextTurning {
            self.nextTurn()
        } else if !nextTurning {
            let numberOfCards = Player.shared.hand.cards.count
            // Divide the space between the cards
            let angle : CGFloat = 180.0 / CGFloat(numberOfCards + 1)
            // Move the nodes to the correct positions
            for i in 0 ..< numberOfCards {
                let ang = 180.0 - CGFloat(i + 1) * angle
                let pos = calculateCardPosition(angle: ang)
                let cardAngle = calculateCardAngle(angle: ang)
                handNodes[i].position = self.convert(pos, to: handNode)
                if i < numberOfCards {
                    moveAndRotateCard(card: Player.shared.hand.cards[i], to: pos, to: cardAngle)
                }
            }
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
    
    ///Debug
    func printDiscard(){
        print("Discard: \(Player.shared.discard.cards.count)")
        for card in Player.shared.discard.cards{
            print("Carta no Discard: \(card.id)")
        }
    }
    
    
    func printDeck(){
        print("Deck   : \(Player.shared.deck.cards.count)")
        for card in Player.shared.deck.cards{
            print("Carta no Deck: \(card.id)")
        }
    }
    
    func printHand(){
        print("Hand   : \(Player.shared.hand.cards.count)")
        for card in Player.shared.hand.cards{
            print("Carta na Hand: \(card.id)")
        }
    }
    
    /// >>>----------> GAMEPLAY FUNCs
    
    var nextTurning = false
    func nextTurn () {
        nextTurning = true
        print("Batalha do inimigo")
        battleManager.enemyTurn()
        battleManager.endTurn()
        print("Descarta a Mesa")
        self.discardOngoing(){
            self.discardHand() {
                self.printDiscard()
                self.printDeck()
                self.printHand()
                self.nextTurning = false
                self.drawCards()
                print("HandAfterDraw   : \(Player.shared.hand.cards.count)")
            }
        }
        print("Descarta a Hand")
        Player.shared.manaManager.resetAllManaFromManaPool()
        for mana in Player.shared.manaManager.manaPool {
            if mana.node?.isHidden == true{
                mana.node?.isHidden = false
            }
        }
        self.rearangeManaNodes()
    }
    
    func drawCards () {
        let cardsToDraw = 5
            if Player.shared.deck.cards.count < cardsToDraw {
            let remainingCards = cardsToDraw - Player.shared.deck.cards.count
            self.getCardsFromDiscard(){
                self.drawHandCards(remainingCards)
            }
            drawHandCards(cardsToDraw - remainingCards)
        } else {
            drawHandCards(cardsToDraw)
        }
    }
    
    func drawHandCards (_ amount: Int){
        let handCards = 0
        Player.shared.drawCards(amount: amount)
        for i in handCards ..< Player.shared.hand.cards.count {
            let card = Player.shared.hand.cards[i]
            createCardNode(card: card, at: deckNode)
        }
    
        print("Player Hand Amount: \(Player.shared.hand.cards.count)")
        if !gettingCardsFromDiscard {
            distributeCardNodes()
        }
    }
    
    func playCard (index: Int, manaType: ManaType) {
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
            if Player.shared.manaManager.checkPoolIsAllUsed() {
                self.nextTurn()
            }
        }
    }
    
    var sendCardFromDiscardToDeckHasFinished = false
    var gettingCardsFromDiscard = false
    var i = 0
    func getCardsFromDiscard (completion: @escaping () -> () = { }) {
        if !gettingCardsFromDiscard {
            let delay = SKAction.wait(forDuration: 0.10)
            let code  = SKAction.run {
                self.i+=1
                self.runCardFromDiscardToDeck(card: Player.shared.discard.cards[0])
                Player.shared.getCardFromDiscard(0)
            }
            let sequence = SKAction.sequence([delay, code])
            let loop = SKAction.repeat(sequence, count: Player.shared.discard.cards.count)
            gettingCardsFromDiscard = true
            discardNode.run(loop) {
                self.gettingCardsFromDiscard = false
                for card in Player.shared.deck.cards{
                    print("Card ID no deck: \(card.id)")
                }
                completion()
            }
        }
    }
    
    /// >>>----------> GAMEPLAY ASSIST FUNCs
    
    func discardHand (completion: @escaping () -> () = { }) {
        for card in Player.shared.hand.cards {
            discardCard(card: card) {
                Player.shared.hand.removeCard(id: card.id)
                if Player.shared.hand.cards.count == 0 {
                    completion()
                }
            }
        }
        if Player.shared.hand.cards.count == 0 {
            completion()
        }
    }
    
    func discardOngoing (completion: @escaping () -> () = { }) {
        for card in Player.shared.ongoing.cards {
            discardCard(card: card){
                Player.shared.ongoing.removeCard(id: card.id)
                if Player.shared.ongoing.cards.count == 0{
                    completion()
                }
            }
        }
        
    }
    
    func discardCard (card : Card, completion: @escaping () -> () = { }) {
        Player.shared.discard.addCard(card)
        moveAndRotateCard(card: card, to: discardNode.position, to: 0) {
            print("Remove Card: \(card.id) from Parent. CardNode: \(card.node!), deckPosition: \(card.node.position)")
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
            print("Mandou carta do Discard para o Deck, \(card.id), CARDNODE: \(card.node!), deckPosition: \(card.node.position)")
            //UM DOS BUGS FUD&***&*ˆ&*ˆ& ESTAVA AQUI, SÓ PRECISA TRATAR
//            card.node.removeFromParent()
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
        
        //Animações nao funcionam
        if let playerCurrentLife = Player.shared.currentLife {
            playerLife.text = "Criticar a Vó:\(playerCurrentLife)"
            var percentage = (CGFloat(playerCurrentLife) / CGFloat(Player.shared.maxLife!)) * 100
            percentage = setZeroOrHundred(number: percentage)
            let updateBar = SKAction.resize(toWidth: CGFloat(percentage), duration: 0.1)
            playerLifeBar?.run(updateBar)
        }
        if let playerCurrentOther = Player.shared.currentEmpathy{
            playerOther.text = "Ignorar a Vó: \(playerCurrentOther)"
            var percentage = (CGFloat(playerCurrentOther) / CGFloat(Player.shared.maxEmpathy)) * 100
            percentage = setZeroOrHundred(number: percentage)
            let updateBar = SKAction.resize(toWidth: CGFloat(percentage), duration: 0.1)
            playerOtherBar?.run(updateBar)
        }
        
        if let enemyCurrentLife = battleManager.enemy.currentLife {
            enemyLife.text = "Debater com a Vó: \(enemyCurrentLife)"
            var percentage = (CGFloat(enemyCurrentLife) / CGFloat(battleManager.enemy.maxLife)) * 100
            percentage = setZeroOrHundred(number: percentage)
            let updateBar = SKAction.resize(toWidth: CGFloat(percentage), duration: 0.1)
            enemyLifeBar?.run(updateBar)
        }
        if let enemyCurrentOther = battleManager.enemy.currentReason{
            enemyOther.text = "Concordar com a Vó: \(enemyCurrentOther)"
            var percentage = (CGFloat(enemyCurrentOther) / CGFloat(battleManager.enemy.maxReason)) * 100
            percentage = setZeroOrHundred(number: percentage)
            let updateBar = SKAction.resize(toWidth: CGFloat(percentage), duration: 0.1)
            enemyOtherBar?.run(updateBar)
        }
        
    }
    
    func setZeroOrHundred(number: CGFloat) -> CGFloat{
        if number < 0{
            return 0.0
        }else if number > 100{
            return 100.0
        }
        return number
        
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
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let card = self.movingCard {
            let touchLocation = touch.location(in: self)
            card.node.position = touchLocation
        }
    }
    
    func finishTouches (nodes: [SKNode]) {
        for node in nodes.reversed() {
            if node.name == "Play Area" {
                if let deckName = movingCardDeck?.name {
                    if deckName == "Hand" {
                        moveCardToPlayArea()
                        return
                    }
                }
            } else if node.name == "Banned Area" {
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
        moveCardBack()
    }
    
    func moveCardToPlayArea () {
        let card = Player.shared.hand.cards[movingCardIndex!]
        let manaType : ManaType = card.switchCardTypeToManaType()
        if Player.shared.manaManager.useManaFromManaPool(type: manaType) {
            playCard(index: movingCardIndex!, manaType: manaType)
        } else {
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
        if let deckName = movingCardDeck?.name {
            if deckName == "Hand" {
                // move card back to hand
                let pos = self.convert(handNodes[movingCardIndex!].position, from: handNode)
                let move = SKAction.move(to: pos, duration: 0.0)
                movingCard!.node.run(move)
                distributeCardNodes()
                clearVars()
            } else if deckName == "Ongoing" {
                // move card back to play area
                let pos = self.convert(playAreaNodes[movingCardIndex!].position, from: playAreaNode)
                let move = SKAction.move(to: pos, duration: 0.0)
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
        self.updateValues()
    }
}
