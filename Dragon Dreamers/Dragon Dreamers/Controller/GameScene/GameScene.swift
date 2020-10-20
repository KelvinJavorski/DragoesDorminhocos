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
    weak var modalBackView: UIView!
    weak var talkingView: UIView!
    weak var speechButton: UIButton!
    weak var speechText: UILabel!
    weak var endMyTurnButton: UIView!
    
    var deckNode      : SKNode!
    var deckNumber    : SKLabelNode!
    var discardNode   : SKNode!
    var discardNumber : SKLabelNode!
    var bannedNode    : SKNode!
    var bannedNumber  : SKLabelNode!
    
    var enemyCardNode : SKNode!
    var enemyPlayAreaNode : SKNode!
    var enemyHandNode : SKNode!
    
    var handNode      : SKNode!
    var handNodes     : [SKNode] = []
    var playAreaNode  : SKNode!
    var playAreaNodes : [SKNode] = []
    var manaNode      : SKNode!
    var manaNodes     : [SKNode] = []
    
    var circles : [SKShapeNode] = []
    var lines   : [SKShapeNode] = []
    
    var halfHeight : CGFloat = 80
    var halfWidth  : CGFloat = 150
    
    var playerNode  : SKNode!
    var agreeValue  : SKLabelNode!
    var agreeBarNode : SKNode!
    var avoidValue : SKLabelNode!
    var avoidBarNode : SKNode!
    
    var enemyNode    : SKNode!
    var questioningValue    : SKLabelNode!
    var questioningBarNode : SKNode!
    var criticizeValue   : SKLabelNode!
    var criticizeBarNode : SKNode!
    
    //Humor Nodes
    var humorPoints: Int = 0
    var humorNode : SKNode!
//    var agreeNode : SKNode!
    var agreeBackground : SKSpriteNode!
    var agreeColor : SKSpriteNode!
    
//    var avoidNode : SKNode!
    var avoidBackground : SKSpriteNode!
    var avoidColor : SKSpriteNode!
    
//    var questioningNode : SKNode!
    var questioningBackground : SKSpriteNode!
    var questioningColor : SKSpriteNode!
    
//    var criticizeNode : SKNode!
    var criticizeBackground : SKSpriteNode!
    var criticizeColor : SKSpriteNode!

    var nextTurnAvailable: Bool!
    var battleManager: BattleManager = BattleManager()
    var enemy: Enemy!
    
    func initScene () { // ALWAYS CALL THIS BEFORE PRESENTING SCENE
        battleManager.setup()
        //Código a ser implementado na GameSceneNPCChoice//
        for enemy in DataSave.shared.gameCampaign.enemys {
            if enemy.name == "Vó Matilda" {
                DataTemp.shared.setChosenEnemy(enemy: enemy)
            }
        }
        //Código a ser implementado na GameSceneNPCChoice//
        
        battleManager.setEnemy(enemy: DataTemp.shared.chosenEnemy)
        enemy = battleManager.enemy
        
        humorPoints = battleManager.enemy.discussion.humorPoints
        
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
        let agreeNode = playerNode.childNode(withName: "AgreeBar")!
        agreeValue = agreeNode.childNode(withName: "Value") as? SKLabelNode
        agreeBarNode = agreeNode.childNode(withName: "Bar") as? SKSpriteNode
        
        let avoidNode = playerNode.childNode(withName: "AvoidBar")!
        avoidValue = avoidNode.childNode(withName: "Value") as? SKLabelNode
        avoidBarNode = avoidNode.childNode(withName: "Bar") as? SKSpriteNode
        
        enemyNode = childNode(withName: "Enemy")!
        let criticizeNode = enemyNode.childNode(withName: "CriticizeBar")!
        questioningValue = criticizeNode.childNode(withName: "Value") as? SKLabelNode
        questioningBarNode = criticizeNode.childNode(withName: "Bar") as? SKSpriteNode
        
        let questioningNode = enemyNode.childNode(withName: "QuestioningBar")!
        criticizeValue = questioningNode.childNode(withName: "Value") as? SKLabelNode
        criticizeBarNode = questioningNode.childNode(withName: "Bar") as? SKSpriteNode
        
        enemyPlayAreaNode = childNode(withName: "EnemyPlayAreaNode")!
        enemyHandNode = childNode(withName: "EnemyHandNode")!
        
        setupHumorNode()
        selectEnemyHumor()
        
        nextTurnAvailable = false
        //fillPool() só está sendo executado aqui pelo alpha, ele deveria ser executado a partir fa primeira fase
        Player.shared.manaManager.fillPool(manas: [ManaType.g, ManaType.g, ManaType.g])
        for i in 0 ..< Player.shared.manaManager.manaPool.count {
            let pos = self.convert(manaNodes[i].position, from: manaNode)
            createManaNode(mana: Player.shared.manaManager.manaPool[i], at: pos)
        }

        battleManager.scene = self
        battleManager.startBattle()
        battleManager.initPlayerTurn()
        
        createHandEllipse()
        drawCards()
        enemyDrawCard()
        
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
    
    //
    
    func setupHumorNode(){
        humorNode = childNode(withName: "Humor")!
        let agree = humorNode.childNode(withName: "Agree")!
        let avoid = humorNode.childNode(withName: "Avoid")!
        let questioning = humorNode.childNode(withName: "Questioning")!
        let criticize = humorNode.childNode(withName: "Criticize")!
        
        agreeBackground = agree.childNode(withName: "Background") as? SKSpriteNode
        agreeBackground.color = .black
        avoidBackground = avoid.childNode(withName: "Background") as? SKSpriteNode
        avoidBackground.color = .black
        questioningBackground = questioning.childNode(withName: "Background") as? SKSpriteNode
        questioningBackground.color = .black
        criticizeBackground = criticize.childNode(withName: "Background") as? SKSpriteNode
        criticizeBackground.color = .black
    }
    
    func setupEnemyHumor (card: Card, completion: @escaping () -> () = { }) {
        var humorInfluence : Int
        
        humorInfluence = card.humorInfluence
        
        var humorCombine = 0
        
        humorCombine = humorCombine + humorInfluence
        
        var humorResult = self.humorPoints + humorCombine
        
        if humorResult<0 {
            humorResult = 0
        }
        if humorResult>20 {
            humorResult = 20
        }
        
        self.humorPoints = humorResult
        
        completion()
        //battleManager.enemy.discussion.setHumorPoints(humorPoints: humorResult)
    }
    
    func selectEnemyHumor(){
        agreeBackground.isHidden = true
        avoidBackground.isHidden = true
        questioningBackground.isHidden = true
        criticizeBackground.isHidden = true
        
        let humor = self.battleManager.enemy.discussion.getHumor()
        switch humor {
        case .agree:
            agreeBackground.isHidden = false
            break
        case .avoid:
            avoidBackground.isHidden = false
            break
        case .questioning:
            questioningBackground.isHidden = false
            break
        case .criticize:
            criticizeBackground.isHidden = false
            break
        }
    }
    
    func createCircleNode(radius: CGFloat) -> SKShapeNode{
        let circle = SKShapeNode(circleOfRadius: radius)
        circle.fillColor = SKColor.blue
        return circle
    }
    
    func createEnemyCardNode(card: Card, at pos: SKNode){
        let bases = self.childNode(withName: "Bases")!
        let cardBase = bases.childNode(withName: "EnemyCardBase")!
        let cardNode = cardBase.copy() as! SKNode
        cardNode.position = pos.position
        card.node = cardNode
        card.node.name = "\(card.id)"
        self.addChild(card.node)
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
            if node.name == "CardName"{
                guard let nodeName = node as? SKLabelNode else{ continue }
                nodeName.text = card.name
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
//        manaNode = createCircleNode(radius: 15)
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
        let tang = Double(angle) * Double.pi / 210.0
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
        nextTurnAvailable = false
        print("Batalha do inimigo")
        
        battleManager.endPlayerTurn()
        battleManager.enemyTurn()
        battleManager.enemy.discussion.setHumorPoints(humorPoints: self.humorPoints)
        battleManager.enemy.updateHumor()
        selectEnemyHumor()
        battleManager.endEnemyTurn()
        print("Descarta a Mesa")
        self.discardOngoing(){
            self.discardHand() {
                self.battleManager.initPlayerTurn()
                self.showDialogBox()
                self.printDiscard()
                self.printDeck()
                self.printHand()
                self.nextTurning = false
                self.drawCards()
                self.enemyDrawCard()
                print("HandAfterDraw   : \(Player.shared.hand.cards.count)")
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
    }
    
    func showDialogBox(){
        if !self.isPaused{
            self.isPaused = true
            self.talkingView.isHidden = false
            self.speechButton.isHidden = false
            self.speechText.isHidden = false
            self.speechText.text = getPhrase()
            self.modalBackView.isHidden = false
            self.endMyTurnButton.isHidden = true
        }
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
    
    func enemyDrawCard(){
        createEnemyCardNode(card: enemy.hand.cards[0], at: enemyHandNode)
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
        
        setupEnemyHumor(card: card){
            print("Humor atualizado")
        }
        
        // Moves card node to play area
        moveAndRotateCard(card: card, to: pos, to: 0.0) {
            Player.shared.playCard(index: index)
            self.battleManager.playCard(card: card)
//            card.playCard()
            // Store card played for applying effect later
//            self.battleManager.storeCard(card: card)
            let resize = SKAction.scale(to: 1, duration: 0.3)
            card.node.run(resize)
            card.node.position = pos
            self.distributeCardNodes()
            self.nextTurnAvailable = true
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
//                self.runCardFromDiscardToDeck(card: Player.shared.discard.cards[0])
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
    
    func getPhrase() -> String{
        let phrase = self.battleManager.enemy.discussion.useNextPhraseAvaliableText(type: self.battleManager.enemy.discussion.getHumor()) ?? "Null"
        
        return phrase
    }
    
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
        if let currentAgree = Player.shared.currentAgree {
            agreeValue.text = "Concordar:\(currentAgree)"
            var percentage = (CGFloat(currentAgree) / CGFloat(Player.shared.maxAgree!)) * 100
            percentage = setZeroOrHundred(number: percentage)
            let updateBar = SKAction.resize(toWidth: CGFloat(percentage), duration: 0.1)
            agreeBarNode?.run(updateBar)
        }
        if let currentAvoid = Player.shared.currentAvoid{
            avoidValue.text = "Ignorar: \(currentAvoid)"
            var percentage = (CGFloat(currentAvoid) / CGFloat(Player.shared.maxAvoid)) * 100
            percentage = setZeroOrHundred(number: percentage)
            let updateBar = SKAction.resize(toWidth: CGFloat(percentage), duration: 0.1)
            avoidBarNode?.run(updateBar)
        }
        
        if let currentQuestioning = Player.shared.currentQuestioning {
            questioningValue.text = "Debater: \(currentQuestioning)"
            var percentage = (CGFloat(currentQuestioning) / CGFloat(Player.shared.maxAgree)) * 100
            percentage = setZeroOrHundred(number: percentage)
            let updateBar = SKAction.resize(toWidth: CGFloat(percentage), duration: 0.1)
            questioningBarNode?.run(updateBar)
        }
        if let currentCriticize = Player.shared.currentCriticize{
            criticizeValue.text = "Criticar: \(currentCriticize)"
            var percentage = (CGFloat(currentCriticize) / CGFloat(Player.shared.maxQuestioning)) * 100
            percentage = setZeroOrHundred(number: percentage)
            let updateBar = SKAction.resize(toWidth: CGFloat(percentage), duration: 0.1)
            criticizeBarNode?.run(updateBar)
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
                                    card.node.run(SKAction.scale(to: 2.6, duration: 0.2), withKey: "resizeCard")
                                    found = true
                                }
                            }
                            for i in 0 ..< Player.shared.ongoing.cards.count {
                                let card = Player.shared.ongoing.getCard(i)
                                if parentNode.name == "\(card.id)" {
                                    found = true
                                }
                            }
                        }
                    }
                }//cardShape If
                if node.name == "EnemyCardShape"{
                    if let parentNode = node.parent {
                        var found = false
                        while !found {
                            for i in 0 ..< enemy.hand.cards.count {
                                let card = enemy.hand.getCard(i)
                                if parentNode.name == "\(card.id)" {
                                    card.node.run(SKAction.scale(to: 2.6, duration: 0.2), withKey: "resizeCard")
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
            } else if node.name == "EnemyCardShape"{
                let card = enemy.hand.cards[0]
                let resize = SKAction.scale(to: 1, duration: 0.3)
                card.node.run(resize)
                return
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
                let resize = SKAction.scale(to: 1, duration: 0.3)
                let move = SKAction.move(to: pos, duration: 0.0)
                movingCard!.node.run(resize)
                movingCard!.node.run(move)
                distributeCardNodes()
                clearVars()
            } else if deckName == "Ongoing" {
                // move card back to play area
                let pos = self.convert(playAreaNodes[movingCardIndex!].position, from: playAreaNode)
                let resize = SKAction.scale(to: 1, duration: 0.3)
                let move = SKAction.move(to: pos, duration: 0.0)
                movingCard!.node.run(resize)
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
