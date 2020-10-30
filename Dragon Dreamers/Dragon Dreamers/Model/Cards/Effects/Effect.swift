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
//    var allTurnEffects: [EffectProtocol] = []
//    var allBuffEffects: [EffectProtocol] = []
//    var allStatus: [EffectProtocol] = []
    
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
