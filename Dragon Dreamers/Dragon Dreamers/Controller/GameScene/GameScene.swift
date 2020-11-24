//
//  GameScene.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 04/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, UIGestureRecognizerDelegate {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    weak var navigation: GameViewController!
    weak var modalBackView: UIView!
    weak var talkingView: UIView!
    weak var speechButton: UIButton!
    weak var speechText: UILabel!
    weak var endMyTurnButton: UIView!

//    var gestureRecognizer : UITapGestureRecognizer!
    
    var deckNode      : SKNode!
    var deckNumber    : SKLabelNode!
    var discardNode   : SKNode!
    var discardNumber : SKLabelNode!
    var bannedNode    : SKNode!
    var bannedNumber  : SKLabelNode!
    
    var enemyCardNode : SKNode!
    var enemyPlayAreaNode : SKNode!
    var yobabaPlayAreaNode: SKNode!
    var enemyHandNode : SKNode!
    
    var handNode      : SKNode!
    var handNodes     : [SKNode] = []
    var playArea      : SKNode!
    var playAreaNode  : SKNode!
    var playAreaNodes : [SKNode] = []
    var manaNode      : SKNode!
    var manaNodes     : [SKNode] = []
    var manaCircleNode: SKShapeNode!
    var effectsNode : [SKLabelNode] = []
    
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
    
    var agreeBackground : SKShapeNode!
    var agreeColor : SKShapeNode!
    
//    var avoidNode : SKNode!
    var avoidBackground : SKShapeNode!
    var avoidColor : SKShapeNode!
    
//    var questioningNode : SKNode!
    var questioningBackground : SKShapeNode!
    var questioningColor : SKShapeNode!
    
//    var criticizeNode : SKNode!
    var criticizeBackground : SKShapeNode!
    var criticizeColor : SKShapeNode!
    
    var imposicaoBackground : SKNode!
    var imposicaoValue : SKLabelNode!
    
    var conexaoBackground : SKNode!
    var conexaoValue : SKLabelNode!

    var nextTurnAvailable: Bool!
    var battleManager: BattleManager = BattleManager()
    var enemy: Enemy!
    
    // MARK: - Init
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
        
        humorPoints = battleManager.enemy.discussionInUse.humorPoints
        
        deckNode = childNode(withName: "Deck")!
        deckNumber = deckNode.childNode(withName: "DeckCardAmount") as? SKLabelNode

        discardNode = childNode(withName: "Discard")!
        discardNumber = discardNode.childNode(withName: "DeckCardAmount") as? SKLabelNode

        bannedNode = childNode(withName: "Banned")!
        bannedNumber = bannedNode.childNode(withName: "DeckCardAmount") as? SKLabelNode
        
        let playNode = childNode(withName: "Play")!
        playArea = playNode.childNode(withName: "Play Area")!
        createPlayAreaView()
        yobabaPlayAreaNode = playNode.childNode(withName: "YobabaPlayArea")!
        
        manaNode = childNode(withName: "Mana")!
        for node in manaNode.children {
            if node.name == "Mana" {
                manaNodes.append(node)
            }
        }
        
        manaCircleNode = SKShapeNode(circleOfRadius: 40)
        manaCircleNode.position = manaNode.position
        manaCircleNode.fillColor = UIColor(hexString: "#FFFFFF")
        addChild(manaCircleNode)
        
        let DeckCircleNode = SKShapeNode(circleOfRadius: 40)
        DeckCircleNode.position = deckNode.position
        DeckCircleNode.fillColor = UIColor(hexString: "#FFFFFF")
        addChild(DeckCircleNode)
        
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
        enemyNode = childNode(withName: "Enemy")!
        
        let agreeNode = playerNode.childNode(withName: "AgreeBar")!
        agreeValue = agreeNode.childNode(withName: "Value") as? SKLabelNode
        agreeBarNode = agreeNode.childNode(withName: "Bar") as? SKSpriteNode
        
        let avoidNode = playerNode.childNode(withName: "AvoidBar")!
        avoidValue = avoidNode.childNode(withName: "Value") as? SKLabelNode
        avoidBarNode = avoidNode.childNode(withName: "Bar") as? SKSpriteNode
        
        let questioningNode = playerNode.childNode(withName: "QuestioningBar")!
        questioningValue = questioningNode.childNode(withName: "Value") as? SKLabelNode
        questioningBarNode = questioningNode.childNode(withName: "Bar") as? SKSpriteNode
        
        let criticizeNode = playerNode.childNode(withName: "CriticizeBar")!
        criticizeValue = criticizeNode.childNode(withName: "Value") as? SKLabelNode
        criticizeBarNode = criticizeNode.childNode(withName: "Bar") as? SKSpriteNode
        
        enemyPlayAreaNode = childNode(withName: "EnemyPlayAreaNode")!
        enemyHandNode = childNode(withName: "EnemyHandNode")!
        
        let turnEffectNode = childNode(withName: "TurnEffects")!
        for node in turnEffectNode.children{
            for element in node.children{
                if element.name == "Value"{
                    effectsNode.append(element as! SKLabelNode)
                }
            }
        }
        
        
        setupHumorNode()
        selectEnemyHumor()
        
        nextTurnAvailable = false
        //fillPool() só está sendo executado aqui pelo alpha, ele deveria ser executado a partir fa primeira fase
//        Player.shared.manaManager.fillPool(manas: [ManaType.red, ManaType.green, ManaType.colorless])
        for i in 0 ..< Player.shared.manaManager.manaPool.count {
            let pos = self.convert(manaNodes[i].position, from: manaNode)
            createManaNode(mana: Player.shared.manaManager.manaPool[i], at: pos)
        }

        battleManager.scene = self
        battleManager.startBattle()
        battleManager.initPlayerTurn()
        
        createTokens()
        createYobabaPlayArea()
        createHandEllipse()
        Player.shared.deck.shuffle()
        drawCards()
        Player.shared.lastHand.cards = Player.shared.hand.cards
        enemyDrawCard()
        
    }
    
    // MARK: Gesture
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        return true
//    }
//
//    // MARK: didMove
//    override func didMove(to view: SKView) {
//        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapPress(sender:)))
////        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress(sender:)))
//        gestureRecognizer.delegate = self
////        gestureRecognizer.minimumPressDuration = 0.5
//        self.view?.addGestureRecognizer(gestureRecognizer)
//    }
    
    func resetManaNodes(){
        for mana in Player.shared.manaManager.manaPool{
            mana.node!.removeFromParent()
        }
        for (i, mana) in Player.shared.manaManager.manaPool.enumerated(){
            if mana.isAvaliable{
                let pos = self.convert(manaNodes[i].position, from: manaNode)
                createManaNode(mana: Player.shared.manaManager.manaPool[i], at: pos)
            }
        }
    }
    
    func createTokens(){
        let imposicaoNode = playerNode.childNode(withName: "Imposição")!
        imposicaoValue = imposicaoNode.childNode(withName: "Value") as? SKLabelNode
        imposicaoBackground = imposicaoNode.childNode(withName: "Background")
        
        let conexaoNode = playerNode.childNode(withName: "Conexão")!
        conexaoValue = conexaoNode.childNode(withName: "Value") as? SKLabelNode
        conexaoBackground = conexaoNode.childNode(withName: "Background")
        
        let redCircle = SKShapeNode.init(circleOfRadius: 15)
        let pos = imposicaoBackground.position
        redCircle.fillColor = UIColor.init(hexString: "#EDA7A7")
        redCircle.lineWidth = 0
        redCircle.zPosition = -1
        
        imposicaoBackground = redCircle
        imposicaoBackground.position = self.convert(pos, from: imposicaoNode)
        addChild(imposicaoBackground)
        
        let blueCircle = SKShapeNode.init(circleOfRadius: 15)
        let posBlue = conexaoBackground.position
        blueCircle.fillColor = UIColor.init(hexString: "#AAAEF8")
        blueCircle.lineWidth = 0
        blueCircle.zPosition = -1
        
        conexaoBackground = blueCircle
        conexaoBackground.position = self.convert(posBlue, from: conexaoNode)
        addChild(conexaoBackground)
    }
    
    func createPlayAreaView(){
        let cornerRect = SKShapeNode.init(rectOf: CGSize(width: halfWidth * 2, height: halfHeight * 1.2), cornerRadius: 30)
        cornerRect.fillColor = UIColor(hexString: "#000000")
        cornerRect.alpha = 0.01
        cornerRect.position = playArea.position
        cornerRect.zPosition = -1
        cornerRect.name = "Play Area"
        playArea = cornerRect
        self.addChild(playArea)
    }
    
    func createYobabaPlayArea(){
        let cornerRect = SKShapeNode.init(rectOf: CGSize(width: halfWidth * 3.5, height: halfHeight * 1.2), cornerRadius: 30)
//        ellipse.fillColor = UIColor(hexString: "#797979")
//        ellipse.alpha = 0.2
        cornerRect.fillColor = UIColor(hexString: "#FFFFFF")
        cornerRect.alpha = 0.75
        cornerRect.position = yobabaPlayAreaNode.position
        cornerRect.zPosition = -1
        
        self.addChild(cornerRect)
    }
    
    func createHandEllipse () {
        let rect = CGRect(x: handNode.position.x - halfWidth, y: handNode.position.y - halfHeight, width: halfWidth*2.5 , height: halfHeight*1.4)
//        let ellipse = SKShapeNode.init(rect: rect)
        let cornerRect = SKShapeNode.init(rectOf: rect.size, cornerRadius: 50)
        cornerRect.position = CGPoint(x: handNode.position.x, y: handNode.position.y )
        
//        ellipse.fillColor = UIColor(hexString: "#797979")
//        ellipse.alpha = 0.2
        cornerRect.fillColor = UIColor(hexString: "#797979")
        cornerRect.alpha = 0.2
        
        self.addChild(cornerRect)
    }
    
    /// >>>----------> BASE FUNCs
    
    //
    
    func setupHumorNode(){
            humorNode = childNode(withName: "Humor")!
            let agree = humorNode.childNode(withName: "Agree")!
            let avoid = humorNode.childNode(withName: "Avoid")!
            let questioning = humorNode.childNode(withName: "Questioning")!
            let criticize = humorNode.childNode(withName: "Criticize")!
            
            let criticizeNode = criticize.childNode(withName: "Background")!
            criticizeBackground = SKShapeNode(circleOfRadius: 10)
            criticizeBackground.fillColor = UIColor.init(hexString: "EDA7A7")
            criticizeBackground.lineWidth = 0
            criticizeBackground.position = self.convert(criticizeNode.position, from: criticize)
            criticizeColor = SKShapeNode(circleOfRadius: 5)
            criticizeColor.fillColor = UIColor.init(hexString: "EDA7A7")
            criticizeColor.lineWidth = 0
            criticizeColor.position = self.convert(criticizeNode.position, from: criticize)
            
            let avoidNode = avoid.childNode(withName: "Background")!
            avoidBackground = SKShapeNode(circleOfRadius: 10)
            avoidBackground.fillColor = UIColor.init(hexString: "F1C489")
            avoidBackground.position = self.convert(avoidNode.position, from: avoid)
            avoidColor = SKShapeNode(circleOfRadius: 5)
            avoidColor.fillColor = UIColor.init(hexString: "F1C489")
            avoidColor.lineWidth = 0
            avoidColor.position = self.convert(avoidNode.position, from: avoid)
            
            let questioningNode = questioning.childNode(withName: "Background")!
            questioningBackground = SKShapeNode(circleOfRadius: 10)
            questioningBackground.fillColor = UIColor.init(hexString: "ADC8F5")
            questioningBackground.position = self.convert(questioningNode.position, from: questioning)
            questioningColor = SKShapeNode(circleOfRadius: 5)
            questioningColor.fillColor = UIColor.init(hexString: "ADC8F5")
            questioningColor.lineWidth = 0
            questioningColor.position = self.convert(questioningNode.position, from: questioning)
            
            let agreeNode = agree.childNode(withName: "Background")!
            agreeBackground = SKShapeNode(circleOfRadius: 10)
            agreeBackground.fillColor = UIColor.init(hexString: "5F5DC1")
            agreeBackground.position = self.convert(agreeNode.position, from: agree)
            agreeColor = SKShapeNode(circleOfRadius: 5)
            agreeColor.fillColor = UIColor.init(hexString: "5F5DC1")
            agreeColor.lineWidth = 0
            agreeColor.position = self.convert(agreeNode.position, from: agree)
            
            self.addChild(criticizeBackground)
            self.addChild(avoidBackground)
            self.addChild(questioningBackground)
            self.addChild(agreeBackground)
            self.addChild(agreeColor)
            self.addChild(avoidColor)
            self.addChild(questioningColor)
            self.addChild(criticizeColor)
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
        if humorResult>100 {
            humorResult = 100
        }
        
        self.humorPoints = humorResult
        
        completion()
        //battleManager.enemy.discussion.setHumorPoints(humorPoints: humorResult)
    }
    
    func selectEnemyHumor(){
        agreeBackground.isHidden = true
        avoidBackground.isHidden = true
        questioningBackground.isHidden = true
        criticizeColor.isHidden = true
        criticizeColor.fillColor = UIColor.init(hexString: "EDA7A7")
        avoidColor.fillColor = UIColor.init(hexString: "F1C489")
        questioningColor.fillColor = UIColor.init(hexString: "ADC8F5")
        agreeColor.fillColor = UIColor.init(hexString: "5F5DC1")
        
        let humor = self.battleManager.enemy.discussionInUse.getHumor()
        switch humor {
        case .agree:
            agreeBackground.isHidden = false
            agreeColor.fillColor = .white
            break
        case .avoid:
            avoidBackground.isHidden = false
            avoidColor.fillColor = .white
            break
        case .questioning:
            questioningBackground.isHidden = false
            questioningColor.fillColor = .white
            break
        case .criticize:
            criticizeColor.isHidden = false
            criticizeColor.fillColor = .white
            break
        }
    }
    
    func createCircleNode(radius: CGFloat) -> SKShapeNode{
        let circle = SKShapeNode(circleOfRadius: radius)
        circle.fillColor = SKColor.blue
        return circle
    }
    
    func createEnemyCardNode(card: Card, at pos: SKNode){
        let cardBase = getCardNodeByType(type: card.type)
        let cardNode = cardBase.copy() as! SKNode
        cardNode.position = pos.position
        card.node = cardNode
        card.node.name = "\(card.id)"
        for node in card.node.children{
            if node.name == "CardShape"{
                guard let nodeText = node as? SKSpriteNode else{ continue }
                if nodeText.name == "CardShape"{
                    nodeText.name = "EnemyCardShape"
                }
            }
            if node.name == "ManaLabel"{
                guard let nodeText = node as? SKLabelNode else{ continue }
                if nodeText.name == "ManaLabel"{
                    nodeText.text = String(card.cost)
                }
            }
            if node.name == "CardName"{
                guard let nodeName = node as? SKLabelNode else{ continue }
                nodeName.text = card.name
            }
        }
        self.addChild(card.node)
    }
    
    func getCardNodeByType(type: CardType) -> SKNode{
        let bases = self.childNode(withName: "Bases")!
        if type == .blue{
            return bases.childNode(withName: "OceanCardBase")!
        }else if type == .green{
            return bases.childNode(withName: "BreezeCardBase")!
        }else if type == .red{
            return bases.childNode(withName: "SunCardBase")!
        }else if type == .yellow{
            return bases.childNode(withName: "SandCardBase")!
        }else{
            return bases.childNode(withName: "CardBase")!
        }
    }
    func createCardNode (card : Card, at pos: SKNode) {
        let cardBase = getCardNodeByType(type: card.type)
        let cardNode = cardBase.copy() as! SKNode
        cardNode.position = pos.position
        card.node = cardNode
        card.node.name = "\(card.id)"
        for node in card.node.children{
            if node.name == "ManaLabel"{
                guard let nodeText = node as? SKLabelNode else{ continue }
                if nodeText.name == "ManaLabel"{
                    nodeText.text = String(card.cost)
                }
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
        case .blue:
            manaBase = manas.childNode(withName: "B")!
        case .green:
            manaBase = manas.childNode(withName: "G")!
        case .red:
            manaBase = manas.childNode(withName: "R")!
        case .yellow:
            manaBase = manas.childNode(withName: "Y")!
        case .colorless:
            manaBase = manas.childNode(withName: "C")!
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
        let move = SKAction.move(to: pos, duration: 0.3)
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
    
    func calculateCardPosition (angle: CGFloat, _ i: Int) -> CGPoint {
        let tang = Double(angle) * Double.pi / 200.0
        let cose = CGFloat(cos(tang))
        let sine = CGFloat(sin(tang))
        var x = handNode.position.x + halfWidth  * cose
        if i == 4{
            x += 20
        }
        let y = handNode.position.y + halfHeight
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
                let pos = calculateCardPosition(angle: ang, i)
                let cardAngle = calculateCardAngle(angle: ang)
                handNodes[i].position = self.convert(pos, to: handNode)
                if i < numberOfCards {
                    moveCard(card: Player.shared.hand.cards[i], to: pos)
//                    moveAndRotateCard(card: Player.shared.hand.cards[i], to: pos, to: cardAngle)
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
    
    /// >>>----------> GAMEPLAY FUNCs
    
    var nextTurning = false
    func nextTurn () {
        nextTurning = true
        nextTurnAvailable = false
        print("Batalha do inimigo")
        
        battleManager.endPlayerTurn()
        battleManager.initEnemyTurn()
        battleManager.enemy.discussionInUse.setHumorPoints(humorPoints: self.humorPoints)
        battleManager.enemy.updateHumor()
        selectEnemyHumor()
        battleManager.endEnemyTurn()
        print("Descarta a Mesa")
        discardOngoing() {
            self.discardHand() {
                self.enemyPlayingTurn(){
//                    self.battleManager.initPlayerTurn()
                    self.nextTurning = false
                    self.drawCards()
                    self.showDialogBox()
                }
                
                self.enemyDiscardCard {
                    self.battleManager.initPlayerTurn()
                    self.enemyDrawCard()
                }
                Player.shared.manaManager.resetAllManaFromManaPool()
                for mana in Player.shared.manaManager.manaPool {
                    if mana.node?.isHidden == true{
                        mana.node?.isHidden = false
                    }
                }
                self.rearangeManaNodes()
            }
            
        }
        
    }
    
    func setupNextTurn(){
        
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
        

    
        print("Player Hand Amount: \(Player.shared.hand.cards.count)")
        if !gettingCardsFromDiscard {
            for i in handCards ..< Player.shared.hand.cards.count {
                let card = Player.shared.hand.cards[i]
                createCardNode(card: card, at: deckNode)
            }
            distributeCardNodes()
        }
        
    }
    
    func enemyDrawCard(){
        if enemy.hand.cards[0].node != nil {
            enemy.hand.cards[0].node.removeFromParent()
        }
        battleManager.applyAfterDrawEffects()
        createEnemyCardNode(card: enemy.hand.cards[0], at: enemyHandNode)
    }
    
    func enemyPlayingTurn(completion: @escaping () -> () = { }){
        let card = enemy.hand.cards[0]
        moveCard(card: card, to: playAreaNode.position){
            completion()
        }
        
    }
    
    func enemyDiscardCard(completion: @escaping () -> () = { }){
        let card = enemy.hand.cards[0]
        moveCard(card: card, to: discardNode.position){
            completion()
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
        
        setupEnemyHumor(card: card){
            print("Humor atualizado")
        }
        
        // Moves card node to play area
        moveAndRotateCard(card: card, to: pos, to: 0.0) {
            Player.shared.playCard(index: index)
            self.battleManager.playCard(card: card)
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
            let delay = SKAction.wait(forDuration: 0.0)
            let code  = SKAction.run {
                self.i+=1
                Player.shared.getCardFromDiscard(0)
            }
            let sequence = SKAction.sequence([code])
            let loop = SKAction.repeat(sequence, count: Player.shared.discard.cards.count)
            gettingCardsFromDiscard = true
            discardNode.run(loop) {
                self.gettingCardsFromDiscard = false
                for card in Player.shared.deck.cards{
                    print("Card ID no deck: \(card.id)")
                }
                Player.shared.deck.shuffle()
                completion()
            }
        }
    }
    
    /// >>>----------> GAMEPLAY ASSIST FUNCs
    
    func getPhrase() -> String{
        
//MARK: trigar o final devidamente e tirar o Null
    
        let phrase = self.battleManager.enemy.discussionInUse.useNextPhraseAvaliableText(type: self.battleManager.enemy.discussionInUse.getHumor()) ?? "Null"
        
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
//            print("Remove Card: \(card.id) from Parent. CardNode: \(card.node!), deckPosition: \(card.node.position)")
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
        
        let imposicaoAmount = Player.shared.tokens[Ways.sol.rawValue].amount
        let conexaoAmount = Player.shared.tokens[Ways.oceano.rawValue].amount
        
        imposicaoValue.text = "\(imposicaoAmount)"
        conexaoValue.text = "\(conexaoAmount)"
        //Animações nao funcionam
        if let currentAgree = Player.shared.oceano.current {
            agreeValue.text = "Concordar:\(currentAgree)"
            var percentage = (CGFloat(currentAgree) / CGFloat(Player.shared.oceano.maxValue)) * 100
            percentage = setZeroOrHundred(number: percentage)
            let updateBar = SKAction.resize(toWidth: CGFloat(percentage), duration: 0.1)
            agreeBarNode?.run(updateBar)
        }
        if let currentAvoid = Player.shared.areia.current{
            avoidValue.text = "Ignorar: \(currentAvoid)"
            var percentage = (CGFloat(currentAvoid) / CGFloat(Player.shared.areia.maxValue)) * 100
            percentage = setZeroOrHundred(number: percentage)
            let updateBar = SKAction.resize(toWidth: CGFloat(percentage), duration: 0.1)
            avoidBarNode?.run(updateBar)
        }
        
        if let currentQuestioning = Player.shared.brisa.current {
            questioningValue.text = "Debater: \(currentQuestioning)"
            var percentage = (CGFloat(currentQuestioning) / CGFloat(Player.shared.brisa.maxValue)) * 100
            percentage = setZeroOrHundred(number: percentage)
            let updateBar = SKAction.resize(toWidth: CGFloat(percentage), duration: 0.1)
            questioningBarNode?.run(updateBar)
        }
        if let currentCriticize = Player.shared.sol.current{
            criticizeValue.text = "Criticar: \(currentCriticize)"
            var percentage = (CGFloat(currentCriticize) / CGFloat(Player.shared.sol.maxValue)) * 100
            percentage = setZeroOrHundred(number: percentage)
            let updateBar = SKAction.resize(toWidth: CGFloat(percentage), duration: 0.1)
            criticizeBarNode?.run(updateBar)
        }
        setCurrentEffectsLabel()
    }
    
    func setCurrentEffectsLabel(){
        var turn = battleManager.afterDrawStatus
        for node in effectsNode{
            if (turn.first) != nil{
                node.text = turn.first?.name
                turn.remove(at: 0)
            }
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
    
    var clickedTime: Double = 0.0
    // Start Touch!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        clickedTime = 0.0
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
                                    card.node.run(SKAction.scale(to: 2.0, duration: 0.2), withKey: "resizeCard")
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
                }
                if node.name == "EnemyCardShape"{
                    if let parentNode = node.parent {
                        var found = false
                        while !found {
                            for i in 0 ..< enemy.hand.cards.count {
                                let card = enemy.hand.getCard(i)
                                if parentNode.name == "\(card.id)" {
                                    card.node.run(SKAction.scale(to: 2.0, duration: 0.2), withKey: "resizeCard")
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
            card.node.position.x = touchLocation.x + 60.0
            card.node.position.y = touchLocation.y + 60.0
            let touchedNodes = self.nodes(at: touchLocation)
            let node = touchedNodes.filter({$0.name == "Play Area"})
            if node.count > 0{
                playArea.alpha = 0.35
            }else{
                playArea.alpha = 0.01
            }
            
        }
    }
    
    func finishTouches (nodes: [SKNode]) {
        playArea.alpha = 0.01
        //Show Card modal
        if (clickedTime < 0.3){
            print("Tap: \(clickedTime)")
            if let card = movingCard{
                navigation.showCard(card: card)
                if navigation.playWasClicked{
                    movingCardIndex = Player.shared.hand.getIndex(card)
                    moveCardToPlayArea()
                }
                navigation.changeValue(value: false)
            }
        }
        
        clickedTime = 0
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
            else if node.name == "CardShape"{
            }
        }
        
        moveCardBack()
    }
    
    func moveCardToPlayArea () {
        let card = Player.shared.hand.cards[movingCardIndex!]
        let manaType : ManaType = card.switchCardTypeToManaType()
        if Player.shared.manaManager.useManaFromManaPool(type: manaType) {
            playCard(index: movingCardIndex!, manaType: manaType)
        }
        else if  Player.shared.manaManager.useManaFromManaPool(type: .colorless) {
            playCard(index: movingCardIndex!, manaType: .colorless)
        }
        else {
            manaCircleNode.run(SKAction.colorTransitionAction(fromColor: .white, toColor: card.getCardTypeColor(), duration: 0.15)){
                self.manaCircleNode.fillColor = .white
                self.manaCircleNode.strokeColor = .white
            }
//            manaCircleNode.run(SKAction.colorTransitionAction(fromColor: .red, toColor: .white, duration: 0.1))
            moveCardBack()
        }
        clearVars()
    }
    
    func printManaType (manaType: ManaType) {
        switch manaType {
        case .blue:
            print("mana type: Blue")
        case .red:
            print("mana type: Red")
        case .green:
            print("mana type: Green")
        case .yellow:
            print("mana type: Yellow")
        case .colorless:
            print("mana type: Colorless")
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
    
    
    private var lastUpdateTime : TimeInterval = 0
    override func update(_ currentTime: TimeInterval) {
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        self.lastUpdateTime = currentTime
        
        clickedTime += dt
        self.updateValues()
    }
}
