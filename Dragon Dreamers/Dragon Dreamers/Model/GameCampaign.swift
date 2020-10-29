//
//  GameCampain.swift
//  Dragon Dreamers
//
//  Created by Kevin Ribeiro on 10/09/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class GameCampaign {
    
    var enemys: [Enemy] = [
        Enemy(name: "Vó Matilda",discussion:
            Discussion(
                agree: ["Você é uma criança encantadora","Eu vejo você se esforçando para agradar as pessoas","É fácil entender por quê todos gostam de você","Lembre-se de gostar de você mesmo","Não podemos passar a vida tentando ser amados por todos, e não amarmos nós mesmos","TÉ preciso aceitar que as vezes nós não poderemos agradar a todos","Não é egoísmo pensar em nós mesmos de vez em quando","Há momentos em que é preciso se impor","Viva por você mesmo e cuide para não viver pelos outros","Não deixe de pensar em você mesmo quando tomar suas escolhas, é preciso estar bem conosco primeiro para conseguir fazer bem aos outros"],
                avoid: ["Você precisa se abrir mais para as outras pessoas ao seu redor","As vezes a gente pensa que solidão nos protege de se machucar","Ser sozinho nos machuca","Afastar os outros nos machuca","Você não precisa deixar a solidão ser sua prisão","Deixe as pessoas se aproximarem de você","Apoie as pessoas ao seu redor, e elas vão te apoiar também","Dê atenção as pessoas ao seu redor, e elas te darão atenção também","A vida é mais fácil se nós tivermos companhia","Nós só temos companhia se nos esforçarmos, mas eu te garanto que o esforço vale a pena"],
                questioning: ["Você é tão dedicado e esforçado, eu não podia pedir por um neto melhor","Eu vejo nos seus olhos uma curiosidade insaciável","Você tem uma necessidade de compreender as coisas ao seu redor","Lembre-se que as pessoas tem seus próprios segredos","Há coisas que as pessoas preferem deixar guardadas","Há coisas que as pessoas se sentem desconfortáveis em responder","Cuide para respeitar os limites das pessoas ao seu redor","Eu entendo a vontade de tentar mudar as pessoas, de mostrar que elas estão erradas e equivocadas","Muitas vezes achamos que sabemos o que é melhor para os outros","É preciso cuidado ao tentar ajudar as outras pessoas, nem sempre nós temos razão no que acreditamos"],
                criticize: ["Seus pais me falam muito sobre você","Muitas vezes as palavras que você escolhe podem trazer problemas","Eu entendo que pode ser difícil que as pessoas te compreendam","E eu enxergo o brilho atrás dos seus olhos","Mas suas palavras são calorosas e intensas","ome cuidado para não machucar as pessoas ao seu redor","Nós podemos conseguir o que queremos intimidando os outros","Força bruta só te levará até certo ponto","Nossas ações tem consequências","Nossas palavras podem causar estragos se não soubermos usá-las com cuidado"],
                humorPoits: 5))]
    
    var history = History()
    
    init() {
        
    }
    
}
