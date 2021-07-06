//
//  PacoteViagem.swift
//  Viagens
//
//  Created by Vinícius Tinajero Salomão on 06/07/21.
//

import UIKit

class PacoteViagem: NSObject {
    let nomeDoHotel: String
    let descricao: String
    let dataViagem: String
    @objc let viagem: Viagem
    
    init(nomeDoHotel: String, descricao: String, dataViagem: String, viagem: Viagem) {
        self.nomeDoHotel = nomeDoHotel
        self.descricao = descricao
        self.dataViagem = dataViagem
        self.viagem = viagem
    }
}
