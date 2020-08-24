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
            self.setManaInPool(type: mana)
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
        
        self.resetManaFromManaPool(type: ManaType.b)
        self.resetManaFromManaPool(type: ManaType.r)
        self.resetManaFromManaPool(type: ManaType.y)
        self.resetManaFromManaPool(type: ManaType.g)
        self.resetManaFromManaPool(type: ManaType.br)
        self.resetManaFromManaPool(type: ManaType.by)
        self.resetManaFromManaPool(type: ManaType.bg)
        self.resetManaFromManaPool(type: ManaType.ry)
        self.resetManaFromManaPool(type: ManaType.rg)
        self.resetManaFromManaPool(type: ManaType.yg)

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
        
        self.manaCollection.append(Mana(id: "r00", type: ManaType.r))
        self.manaCollection.append(Mana(id: "r01", type: ManaType.r))
        self.manaCollection.append(Mana(id: "r02", type: ManaType.r))
        self.manaCollection.append(Mana(id: "r03", type: ManaType.r))
        self.manaCollection.append(Mana(id: "r04", type: ManaType.r))
        
        self.manaCollection.append(Mana(id: "b00", type: ManaType.b))
        self.manaCollection.append(Mana(id: "b01", type: ManaType.b))
        self.manaCollection.append(Mana(id: "b02", type: ManaType.b))
        self.manaCollection.append(Mana(id: "b03", type: ManaType.b))
        self.manaCollection.append(Mana(id: "b04", type: ManaType.b))
        
        self.manaCollection.append(Mana(id: "y00", type: ManaType.y))
        self.manaCollection.append(Mana(id: "y01", type: ManaType.y))
        self.manaCollection.append(Mana(id: "y02", type: ManaType.y))
        self.manaCollection.append(Mana(id: "y03", type: ManaType.y))
        self.manaCollection.append(Mana(id: "y04", type: ManaType.y))
        
        self.manaCollection.append(Mana(id: "g00", type: ManaType.g))
        self.manaCollection.append(Mana(id: "g01", type: ManaType.g))
        self.manaCollection.append(Mana(id: "g02", type: ManaType.g))
        self.manaCollection.append(Mana(id: "g03", type: ManaType.g))
        self.manaCollection.append(Mana(id: "g04", type: ManaType.g))
        
        self.manaCollection.append(Mana(id: "br00", type: ManaType.br))
        self.manaCollection.append(Mana(id: "br01", type: ManaType.br))
        self.manaCollection.append(Mana(id: "br02", type: ManaType.br))
        self.manaCollection.append(Mana(id: "br03", type: ManaType.br))
        self.manaCollection.append(Mana(id: "br04", type: ManaType.br))
        
        self.manaCollection.append(Mana(id: "by00", type: ManaType.by))
        self.manaCollection.append(Mana(id: "by01", type: ManaType.by))
        self.manaCollection.append(Mana(id: "by02", type: ManaType.by))
        self.manaCollection.append(Mana(id: "by03", type: ManaType.by))
        self.manaCollection.append(Mana(id: "by04", type: ManaType.by))
        
        self.manaCollection.append(Mana(id: "bg00", type: ManaType.bg))
        self.manaCollection.append(Mana(id: "bg01", type: ManaType.bg))
        self.manaCollection.append(Mana(id: "bg02", type: ManaType.bg))
        self.manaCollection.append(Mana(id: "bg03", type: ManaType.bg))
        self.manaCollection.append(Mana(id: "bg04", type: ManaType.bg))
        
        self.manaCollection.append(Mana(id: "ry00", type: ManaType.ry))
        self.manaCollection.append(Mana(id: "ry01", type: ManaType.ry))
        self.manaCollection.append(Mana(id: "ry02", type: ManaType.ry))
        self.manaCollection.append(Mana(id: "ry03", type: ManaType.ry))
        self.manaCollection.append(Mana(id: "ry04", type: ManaType.ry))
        
        self.manaCollection.append(Mana(id: "rg00", type: ManaType.rg))
        self.manaCollection.append(Mana(id: "rg01", type: ManaType.rg))
        self.manaCollection.append(Mana(id: "rg02", type: ManaType.rg))
        self.manaCollection.append(Mana(id: "rg03", type: ManaType.rg))
        self.manaCollection.append(Mana(id: "rg04", type: ManaType.rg))
        
        self.manaCollection.append(Mana(id: "yg00", type: ManaType.yg))
        self.manaCollection.append(Mana(id: "yg01", type: ManaType.yg))
        self.manaCollection.append(Mana(id: "yg02", type: ManaType.yg))
        self.manaCollection.append(Mana(id: "yg03", type: ManaType.yg))
        self.manaCollection.append(Mana(id: "yg04", type: ManaType.yg))
    }

}
