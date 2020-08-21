//
//  ManaManager.swift
//  Dragon Dreamers
//
//  Created by Kevin Ribeiro on 19/08/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class ManaManager {
    
    init(){
        self.manaPool = []
        self.manaCollection = []
        self.fillCollection()
    }
    
    var manaPool: [Mana]
    var manaCollection: [Mana]
    
    func fillPool(mana0: ManaType, mana1: ManaType, mana2: ManaType) {
        self.manaPool = []
        
        self.setManaInPool(type: mana0)
        self.setManaInPool(type: mana1)
        self.setManaInPool(type: mana2)
    }
    
    func setManaInPool(type: ManaType) {
        if self.checkManaInCollection(type: type) {
            if self.getManaFromCollection(type: type) != nil {
                self.manaPool.append(self.getManaFromCollection(type: type)!)
            }
        }
    }
    
    func checkManaInCollection(type: ManaType) -> Bool{
        for mana in self.manaCollection {
            if mana.type == type {
                return true
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
    
    func dropManaFromCollection(index: Int) {
        self.manaCollection.remove(at: index)
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
