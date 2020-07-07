//
//  VitoriasPaisTableViewCell.swift
//  CampoesCopa
//
//  Created by Marcus on 05/07/20.
//  Copyright © 2020 cesar. All rights reserved.
//

import UIKit

class VitoriasPaisTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ivWinner: UIImageView!
    @IBOutlet weak var ivVice: UIImageView!
    @IBOutlet weak var lbContinete: UILabel!
    @IBOutlet weak var lbAno: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var lbWinner: UILabel!
    @IBOutlet weak var lbVice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare (vitorias: WorldCup){
        self.lbAno.text = String(vitorias.year)
        self.lbContinete.text = vitorias.country
        ivWinner.image = UIImage(named: vitorias.winner)
        ivVice.image = UIImage(named: vitorias.vice)
        lbVice.text = vitorias.vice
        lbWinner.text = vitorias.winner
        lbScore.text = "\(vitorias.winnerScore) x \(vitorias.viceScore)"
        
       
    }
    

}
