//
//  Effect.swift
//  Dragon Dreamers
//
//  Created by Kelvin Javorski Soares on 07/10/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import SpriteKit

class Effect{
    static let shared = Effect()
    var allEffects: [EffectProtocol] = []
    var allEnemyEffects: [EffectProtocol] = []
    
    func getEffectByIdsEffect(enumEffect : [EffectType]) -> [EffectProtocol]{
        var effects : [EffectProtocol] = []
        for i in 0..<enumEffect.count{
            effects.append(allEffects[(enumEffect[i]).rawValue])
        }
        return effects
    }
    
    func setupEffects(){
        //Sun Effects
        let reclamarEffect = Reclamar()
        allEffects.append(reclamarEffect)
        
        let afirmarEffect = Afirmar()
        allEffects.append(afirmarEffect)
        
        let incomodarEffect = Incomodar()
        allEffects.append(incomodarEffect)
        
        let comandarEffect = Comandar()
        allEffects.append(comandarEffect)
        
        let criticarEffect = Criticar()
        allEffects.append(criticarEffect)
        
        //Sand Effects
        let desviarStatus = DesviarStatus()
        allEffects.append(desviarStatus)
        
        let defenderEffect = Defender()
        allEffects.append(defenderEffect)
        
        let fugirEffect = Fugir()
        allEffects.append(fugirEffect)
        
//        let prevenirStatus = PrevenirStatus()
//        allEffects.append(prevenirStatus)
        
        let evitarEffect = Evitar()
        allEffects.append(evitarEffect)
        
        let planejarEffect = Planejar()
        allEffects.append(planejarEffect)
        
        let questionarStatus = QuestionarStatus()
        allEffects.append(questionarStatus)
        
        let argumentarEffect = Argumentar()
        allEffects.append(argumentarEffect)
        
        let examinarStatus = ExaminarStatus()
        allEffects.append(examinarStatus)
        
        let comentarEffect = Comentar()
        allEffects.append(comentarEffect)
        
        //Ocean Effects
        let agradarEffect = Agradar()
        allEffects.append(agradarEffect)

        let concordarStatus = ConcordarStatus()
        allEffects.append(concordarStatus)
        
        let aceitarEffect = Aceitar()
        allEffects.append(aceitarEffect)
        
        let aprovarEffect = Aprovar()
        allEffects.append(aprovarEffect)
        
        let criticarWeakEffect = CriticarWeak()
        allEffects.append(criticarWeakEffect)
        
        let incomodarWeakEffect = IncomodarWeak()
        allEffects.append(incomodarWeakEffect)
        
        let defenderWeakEffect = DefenderWeak()
        allEffects.append(defenderWeakEffect)
        
        let desviarWeakEffect = DesviarWeak()
        allEffects.append(desviarWeakEffect)
        
        let comentarWeakEffect = ComentarWeak()
        allEffects.append(comentarWeakEffect)
        
        let planejarWeakEffect = Planejar()
        allEffects.append(planejarWeakEffect)
        
        let aprovarWeakEffect = AprovarWeak()
        allEffects.append(aprovarWeakEffect)
        
        let aceitarWeakEffect = AceitarWeak()
        allEffects.append(aceitarWeakEffect)
    }
    
    func setupEnemyEffects(){
        //Sun Effects
        let criticarWeakEffect = CriticarWeak()
        allEnemyEffects.append(criticarWeakEffect)
        
        let incomodarWeakEffect = IncomodarWeak()
        allEnemyEffects.append(incomodarWeakEffect)
        
        let defenderWeakEffect = DefenderWeak()
        allEnemyEffects.append(defenderWeakEffect)
        
        let desviarWeakEffect = DesviarWeak()
        allEnemyEffects.append(desviarWeakEffect)
        
        let comentarWeakEffect = ComentarWeak()
        allEnemyEffects.append(comentarWeakEffect)
        
        let planejarWeakEffect = Planejar()
        allEnemyEffects.append(planejarWeakEffect)
        
        let aprovarWeakEffect = AprovarWeak()
        allEnemyEffects.append(aprovarWeakEffect)
        
        let aceitarWeakEffect = AceitarWeak()
        allEnemyEffects.append(aceitarWeakEffect)
        
    }
    
    
//    func setupBuffEffects(){
//        let applyVulnerability = ApplyVulnerability()
//        allBuffEffects.append(applyVulnerability)
//    }
//
//    func setupTurnEffects(){
//        let reasoning = ApplyReasoning()
//        allTurnEffects.append(reasoning)
//    }
}
