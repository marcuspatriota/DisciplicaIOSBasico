//
//  WorldCupViewController.swift
//  CampoesCopa
//
//  Created by Marcus on 18/06/20.
//  Copyright © 2020 cesar. All rights reserved.
//

import UIKit

class WorldCupViewController: UIViewController {

    @IBOutlet weak var ivWinner: UIImageView!
    @IBOutlet weak var ivVice: UIImageView!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var lbWinner: UILabel!
    @IBOutlet weak var lbVice: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var workCup: WorldCup!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = workCup.winner
        //print("Winner: \(workCup.winner)")
        ivWinner.image = UIImage(named: workCup.winner)
        ivVice.image = UIImage(named: workCup.vice)
        lbScore.text = "\(workCup.winnerScore) x \(workCup.viceScore)"
        lbWinner.text = workCup.winner
        lbVice.text = workCup.vice
        
        tableView.dataSource = self
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension WorldCupViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return workCup.matches.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workCup.matches[section].games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // recuperando o Game que se encontra em algum Match (oitavas de final, quartas, semi...)
        let match = workCup.matches[indexPath.section]
        let game = match.games[indexPath.row]
               
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GamesTableViewCell
        cell.prepare(with: game)
               
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            // obter um nome para secao
            let match = workCup.matches[section]
            return match.stage
    }
}
