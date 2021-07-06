//
//  TableViewCell.swift
//  Viagens
//
//  Created by Vinícius Tinajero Salomão on 30/06/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    @IBOutlet weak var imageViewViagem: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configuraCelular(viagem: Viagem) {
        labelTitulo.text = viagem.titulo
        labelQuantidadeDias.text = viagem.quantidadeDeDias == 1 ? "1 dia" : "\(viagem.quantidadeDeDias) dias"
        labelPreco.text = "R$ \(viagem.preco)"
        imageViewViagem.image = UIImage(named: viagem.caminhoDaImagem)
        
        imageViewViagem.layer.cornerRadius = 10
        imageViewViagem.layer.masksToBounds = true
    }

}
