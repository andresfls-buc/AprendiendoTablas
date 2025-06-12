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
    
    /*
     1.Implementar
      DataSource
     
     
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        //No olvidar
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
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
        return 20
    }
    // 2. Metodo para saber que celdas deben mostrarse.
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Celda \(indexPath.row)"
        
        return cell
        
    }
    
    }
    


