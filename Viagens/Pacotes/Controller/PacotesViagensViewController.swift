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
    
    let listaComTodasViagens: Array<PacoteViagem> = PacoteViagemDAO().retornaTodasAsViagens()
    var listaViagens: Array<PacoteViagem> = []
    
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

extension PacotesViagensViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        
        let pacoteAtual = listaViagens[indexPath.row]
        
        celulaPacote.configuraCelula(pacoteViagem: pacoteAtual)
        
        return celulaPacote
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let larguraCelula = collectionView.bounds.width / 2
        return CGSize(width: larguraCelula - 15, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacote = listaViagens[indexPath.item]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "detalhes") as! DetalhesViagemViewController
        controller.modalPresentationStyle = .fullScreen
        
        controller.pacoteSelecionado = pacote
//        self.present(controller, animated: true, completion: nil)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension PacotesViagensViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaViagens = listaComTodasViagens
        if searchText != "" {
            let filtroListaViagem = NSPredicate(format: "viagem.titulo contains %@", searchText)
            let listaFiltrada:Array<PacoteViagem> = (listaViagens as NSArray).filtered(using: filtroListaViagem) as! Array
            listaViagens = listaFiltrada
        }
        self.contadorPacotesLabel.text = self.atualizaContadorLabel()
        pacotesViagemCollectionView.reloadData()
    }
}
