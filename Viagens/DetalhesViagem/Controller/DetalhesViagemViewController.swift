//
//  DetalhesViagemViewController.swift
//  Viagens
//
//  Created by Vinícius Tinajero Salomão on 06/07/21.
//

import UIKit

class DetalhesViagemViewController: UIViewController {
    @IBOutlet weak var pacoteViagemImageView: UIImageView!
    @IBOutlet weak var tituloPacoteViagemLabel: UILabel!
    @IBOutlet weak var descricaoPacoteViagemLabel: UILabel!
    @IBOutlet weak var dataViagemLabel: UILabel!
    @IBOutlet weak var precoPacoteViagemLabel: UILabel!
    @IBOutlet weak var dataTextField: UITextField!
    
    @IBOutlet weak var principalScrollView: UIScrollView!
    
    var pacoteSelecionado: PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(aumentarScroll(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        if let pacote = pacoteSelecionado {
            self.pacoteViagemImageView.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.tituloPacoteViagemLabel.text = pacote.viagem.titulo
            self.descricaoPacoteViagemLabel.text = pacote.descricao
            self.dataViagemLabel.text = "valido para o período de: \(pacote.dataViagem)"
            self.precoPacoteViagemLabel.text = pacote.viagem.preco
        }
    }
    
    @objc func aumentarScroll(notification:Notification) {
        self.principalScrollView.contentSize = CGSize(width: self.principalScrollView.frame.width, height: self.principalScrollView.frame.height + 320)
    }
    
    @objc func exibeDataTextField(sender: UIDatePicker) {
        let formatador = DateFormatter()
        formatador.dateFormat = "dd MM yyyy"
        self.dataTextField.text = formatador.string(from: sender.date)
    }
    
    @IBAction func voltarButton(_ sender: UIButton) {
//        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dataFieldEmFoco(_ sender: UITextField) {
        print("SSSSSS")
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(exibeDataTextField(sender:)), for: .valueChanged)
    }
    
    @IBAction func finalizarCompra(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "confirmacaoPagamento") as! ConfirmacaoPagamentoViewController
        controller.modalPresentationStyle = .fullScreen
        controller.pacoteComprado = pacoteSelecionado
//        self.present(controller, animated: true, completion: nil)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
