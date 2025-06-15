//
//  ViewController.swift
//  AprendiendoTablas
//
//  Created by Andres Landazabal on 2025/06/12.
//

import UIKit

class ViewController: UIViewController {
// MARK: -Referencia de la tabla
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource = [
        "@destroyer12",
        "@pikachu34",
        "@luis_gonzalez",
        "@andres_landaza",
        "@juan_gomez",
        "@ana_martinez",
        "@maria_lopez",
        "@jose_fernandez",
        "@laura_perez",
        "@santiago_martinez"
        
    ]
    
    /*
     1.Implementar
      DataSource
     
     
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        //No olvidar
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TweetTableViewCell", bundle: nil), forCellReuseIdentifier: "TweetTableViewCell")
        
        
        // Para interactuar ,implementar el delegate
        
        tableView.delegate = self
    }


}
//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("Seleccionaste la celda \(indexPath.row)")
    }
}
//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    // 2. Metodo para saber que celdas deben mostrarse.
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell", for: indexPath)
        
        if let newCell = cell as? TweetTableViewCell{
            newCell.setUpCell(userName: dataSource[indexPath.row], message: "Soy un Tweet")
        }
        
      
        
        return cell
        
    }
    
    }
    


