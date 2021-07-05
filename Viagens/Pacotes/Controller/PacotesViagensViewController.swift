//
//  PacotesViagensViewController.swift
//  Viagens
//
//  Created by Vinícius Tinajero Salomão on 05/07/21.
//

import UIKit

class PacotesViagensViewController: UIViewController {
    
    @IBOutlet weak var pacotesViagemCollectionView: UICollectionView!
    @IBOutlet weak var viagensSearchBar: UISearchBar!
    @IBOutlet weak var contadorPacotesLabel: UILabel!
    
    let listaComTodasViagens: Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    var listaViagens: Array<Viagem> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaViagens = listaComTodasViagens
        pacotesViagemCollectionView.dataSource = self
        pacotesViagemCollectionView.delegate = self
        
        viagensSearchBar.delegate = self
        self.contadorPacotesLabel.text = self.atualizaContadorLabel()

    }
    
    func atualizaContadorLabel() -> String {
        if listaViagens.count > 1 {
            return "\(listaViagens.count) pacotes encontrados"
        } else if listaViagens.count == 1 {
            return "1 pacote encontrado"
        } else {
            return "Nenhum pacote encontrado"
        }
    }


}

extension PacotesViagensViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        
        let viagemAtual = listaViagens[indexPath.row]
        
        celulaPacote.tituloLabel.text = viagemAtual.titulo
        celulaPacote.quantidadeDiasLabel.text = "\(viagemAtual.quantidadeDeDias) dias"
        celulaPacote.precoLabel.text = "R$ \(viagemAtual.preco)"
        celulaPacote.viagemImageView.image = UIImage(named: viagemAtual.caminhoDaImagem)
        
        celulaPacote.layer.borderWidth = 0.5
        celulaPacote.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        celulaPacote.layer.cornerRadius = 8
        
        return celulaPacote
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let larguraCelula = collectionView.bounds.width / 2
        return CGSize(width: larguraCelula - 15, height: 160)
    }
    
}

extension PacotesViagensViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaViagens = listaComTodasViagens
        if searchText != "" {
            let filtroListaViagem = NSPredicate(format: "titulo contains %@", searchText)
            let listaFiltrada:Array<Viagem> = (listaViagens as NSArray).filtered(using: filtroListaViagem) as! Array
            listaViagens = listaFiltrada
        }
        self.contadorPacotesLabel.text = self.atualizaContadorLabel()
        pacotesViagemCollectionView.reloadData()
    }
}
