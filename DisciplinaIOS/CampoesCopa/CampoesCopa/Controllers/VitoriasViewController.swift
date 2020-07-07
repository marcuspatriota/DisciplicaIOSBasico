//
//  VitoriasViewController.swift
//  CampoesCopa
//
//  Created by Marcus on 06/07/20.
//  Copyright © 2020 cesar. All rights reserved.
//

import UIKit

class VitoriasViewController: UIViewController {
    
    @IBOutlet weak var pais: UILabel!
    @IBOutlet weak var ivPais: UIImageView!
    @IBOutlet weak var totalVitoria: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var vitorias:[WorldCup] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        pais.text = vitorias[0].winner
        totalVitoria.text = totalVitoria.text! + ": \(vitorias.count)"
        ivPais.image = UIImage(named: vitorias[0].winner)
        tableView.dataSource = self
        
    }
}

extension VitoriasViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vitorias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VitoriasPaisTableViewCell
        let worldCup = vitorias[indexPath.row]
        cell.prepare(vitorias: worldCup)
        
        return cell
        
    }
    
    
}

