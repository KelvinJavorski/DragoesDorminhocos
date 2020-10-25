import SpriteKit
import GameplayKit

class GameSceneInteraction: SKScene {
    
    //var battleManager: BattleManager = BattleManager()
    
    var speechNode      : SKNode!
    var nameNode    : SKLabelNode!
    var phraseNode  : SKLabelNode!
    var baloonNode  : SKNode!
    
    func initScene () {
        
        //Código a ser implementado na GameSceneNPCChoice//
        for enemy in DataSave.shared.gameCampaign.enemys {
            if enemy.name == "Vó Matilda" {
                DataTemp.shared.setChosenEnemy(enemy: enemy)
            }
        }
        //Código a ser implementado nenea GameSceneNPCChoice//
        
        speechNode = childNode(withName: "speech")
        nameNode = speechNode.childNode(withName: "name") as? SKLabelNode
        phraseNode = speechNode.childNode(withName: "phrase") as? SKLabelNode
        baloonNode = speechNode.childNode(withName: "baloon")
        
        nameNode.text = DataTemp.shared.chosenEnemy.getName()
        phraseNode.text = DataTemp.shared.chosenEnemy.discussion.useNextBeforePhraseAvaliableText()
    }
    
    func updateSpeech () {
        let phrase = DataTemp.shared.chosenEnemy.discussion.useNextBeforePhraseAvaliableText()
        
        self.phraseNode.text = phrase
    }
}

