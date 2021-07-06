//
//  PacoteViagemCollectionViewCell.swift
//  Viagens
//
//  Created by Vinícius Tinajero Salomão on 05/07/21.
//

import UIKit

class PacoteViagemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viagemImageView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var quantidadeDiasLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    
    func configuraCelula(pacoteViagem: PacoteViagem) {
        tituloLabel.text = pacoteViagem.viagem.titulo
        quantidadeDiasLabel.text = "\(pacoteViagem.viagem.quantidadeDeDias) dias"
        precoLabel.text = "R$ \(pacoteViagem.viagem.preco)"
        viagemImageView.image = UIImage(named: pacoteViagem.viagem.caminhoDaImagem)
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        layer.cornerRadius = 8
    }
    
}
