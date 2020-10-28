//
//  ManaManager.swift
//  Dragon Dreamers
//
//  Created by Kevin Ribeiro on 19/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class ManaManager {
    
    // PREENCHER A COLLECTION ANTES DE PREENCHER A POOL
    // Para preencher a mana Pool pela PRIMEIRA vez: fillPool() -> retorna true se deu certo, false se deu ERRO
    // Para preencher a mana Collection pela PRIMEIRA vez: fillCollection()
    // Para trazer uma mana da Collection para a Pool: setManaInPool() -> retorna true se deu certo, false se não possui esse tipo de mana na Collection.
    // Para devolver uma mana da Pool para a Collection: returnManaFromPoolToCollection() -> retorna true se deu certo, false se não possiu esse tipo de mana na mana Pool.
    // Para usar uma mana da mana Pool: useManaFromManaPool() -> retorna true se deu certo, false se não tem esse tipo de mana disponível na Pool.
    // Para resetar a disponibilidade da mana na Pool: resetManaFromManaPool() -> retorna true se deu certo, false se não possui esse tipo de mana na pool OU se esse tipo de mana ainda não foi usada.
    // resetAllManaFromManaPool() tenta rodar a função resetManaFromManaPool() para todas as manas.
    
    init(){
        self.manaPool = []
        self.manaCollection = []
        self.fillCollection()
    }
    
    var manaPool: [Mana]
    var manaCollection: [Mana]
    
    func fillPool(manas: [ManaType]) {
        self.manaPool = []
        
        for mana in manas {
            if self.setManaInPool(type: mana) {
                
            }
        }
    }
    
    
    func resetManaFromManaPool(type: ManaType) -> Bool{
        if self.checkManaInPool(type: type) {
            for mana in self.manaPool {
                if mana.type == type {
                    if !mana.isAvaliable {
                        mana.setAvaliableStatus(status: true)
                        return true
                    }
                }
            }
        }
        return false
    }
    
    func resetAllManaFromManaPool(){
        
        let manaTypes = [ManaType.red, ManaType.blue, ManaType.yellow, ManaType.green, ManaType.colorless]
        
        for _ in self.manaPool {
            for mana in manaTypes {
                if self.resetManaFromManaPool(type: mana) {
                    break
                }
            }
        }
        
    }
    
    func useManaFromManaPool(type: ManaType) -> Bool{
        if self.checkManaInPool(type: type) {
            for mana in self.manaPool {
                if mana.type == type {
                    if mana.isAvaliable {
                        mana.setAvaliableStatus(status: false)
                        return true
                    }
                }
            }
        }
        return false
    }
    
    func setManaInPool(type: ManaType) -> Bool {
        var mana: Mana
        if self.checkManaInCollection(type: type) {
            mana = self.getManaFromCollection(type: type)!
            mana.insertInPool()
            mana.setAvaliableStatus(status: true)
            self.manaPool.append(mana)
            
            return true
        }
        return false
    }
    
    func checkPoolIsAllUsed() -> Bool{
        
        for mana in self.manaPool {
            if mana.isAvaliable == true {
                return false
            }
        }
        return true
    }
    
    func checkManaInPool(type: ManaType) -> Bool {
        for mana in self.manaPool {
            if mana.type == type {
                return true
            }
        }
        return false
    }
    
    func checkManaInCollection(type: ManaType) -> Bool {
        for mana in self.manaCollection {
            if mana.type == type {
                return true
            }
        }
        return false
    }
    
    func returnManaFromPoolToCollection(type: ManaType) -> Bool{
        var manaAux: Mana
        
        if self.checkManaInPool(type: type) {
            for mana in 0...self.manaPool.count {
                if self.manaPool[mana].type == type {
                    manaAux = self.manaPool[mana]
                    
                    self.dropManaFromPool(index: mana)
                    self.setManaInCollection(mana: manaAux)
                    
                    return true
                }
            }
        }
        return false
    }
    
    func getManaFromCollection(type: ManaType) -> Mana?{
        var manaAux: Mana
        
        if self.checkManaInCollection(type: type) {
            for mana in 0...self.manaCollection.count {
                if self.manaCollection[mana].type == type {
                    manaAux = self.manaCollection[mana]
                    
                    self.dropManaFromCollection(index: mana)
                    
                    return manaAux
                }
            }
        }
        return nil
    }
    
    func dropManaFromPool(index: Int) {
        self.manaPool[index].dropFromPool()
        self.manaPool.remove(at: index)
    }
    
    func dropManaFromCollection(index: Int) {
        self.manaCollection.remove(at: index)
    }
    
    func setManaInCollection(mana: Mana) {
        self.manaCollection.append(mana)
    }
    
    func fillCollection() {
        self.manaCollection = []
        
        let manaTypes = [ManaType.red, ManaType.blue, ManaType.yellow, ManaType.green, ManaType.colorless]
        
        let manaIds = [["r00","r01","r02","r03","r04"],
                        ["b00","b01","b02","b03","b04"],
                        ["y00","y01","y02","y03","y04"],
                        ["g00","g01","g02","g03","g04"],
                        ["c00","c01","c02","c03","c04"]]
        
        for mana in 0 ..< manaTypes.count {
            for n in 0 ..< 3 {
                self.manaCollection.append(Mana(id: manaIds[mana][n], type: manaTypes[mana]))
            }
        }
    }

}
