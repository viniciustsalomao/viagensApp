//
//  ConfirmacaoPagamentoViewController.swift
//  Viagens
//
//  Created by Vinícius Tinajero Salomão on 06/07/21.
//

import UIKit

class ConfirmacaoPagamentoViewController: UIViewController {
    
    @IBOutlet weak var pacoteViagemImageView: UIImageView!
    @IBOutlet weak var tituloPacoteViagemLabel: UILabel!
    @IBOutlet weak var hotelPacoteViagemLabel: UILabel!
    @IBOutlet weak var dataPacoteViagemLabel: UILabel!
    @IBOutlet weak var quatidadePessoasPacoteViagemLabel: UILabel!
    @IBOutlet weak var descricaoPacoteViagemLabel: UILabel!
    @IBOutlet weak var voltarHomeButton: UIButton!
    
    var pacoteComprado: PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let pacote = pacoteComprado {
            self.pacoteViagemImageView.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.tituloPacoteViagemLabel.text = pacote.viagem.titulo.uppercased()
            self.hotelPacoteViagemLabel.text = pacote.nomeDoHotel
            self.dataPacoteViagemLabel.text = pacote.dataViagem
//            self.quatidadePessoasPacoteViagemLabel.text = pacote.viagem.
            self.descricaoPacoteViagemLabel.text = pacote.descricao
            
            self.pacoteViagemImageView.layer.cornerRadius = 10
            self.pacoteViagemImageView.layer.masksToBounds = true
            
            self.voltarHomeButton.layer.cornerRadius = 8
        }
    }
    

    @IBAction func voltarHome(_ sender: UIButton) {
        if let navigation = self.navigationController {
            navigation.popToRootViewController(animated: true)
        }
    }


}
