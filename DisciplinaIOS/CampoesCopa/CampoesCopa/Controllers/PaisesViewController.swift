//
//  PaisesViewController.swift
//  CampoesCopa
//
//  Created by Marcus on 05/07/20.
//  Copyright © 2020 cesar. All rights reserved.
//

import UIKit

class PaisesViewController: UIViewController{
    
    var worldCups:[WorldCup] = []
    var vitorias:[WorldCup] = []
    var qtVitorias: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWorldCups()
    }
    
    func loadWorldCups() {
        let fileURL = Bundle.main.url(forResource: "winners", withExtension: ".json")!
        let jsonData = try! Data(contentsOf: fileURL)
        
        do {
            worldCups = try JSONDecoder().decode([WorldCup].self, from: jsonData)
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestViewController : VitoriasViewController = segue.destination as! VitoriasViewController
        DestViewController.vitorias = vitorias
    }
    
    
    
}

extension PaisesViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return worldCups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath as IndexPath) as! PaisesCollectionViewCell
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.pais.image = UIImage(named: self.worldCups[indexPath.item].country)
        cell.lbNome.text = self.worldCups[indexPath.item].country
        cell.layer.cornerRadius = 8
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! PaisesCollectionViewCell
        
        for pais in worldCups {
            if pais.winner == cell.lbNome.text {
                qtVitorias += 1
                vitorias.append(pais)
            }
        }
        
    }
    
}
