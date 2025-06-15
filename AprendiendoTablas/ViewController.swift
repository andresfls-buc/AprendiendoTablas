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
       
       // 1. Definimos la posición donde irá el video (ej: posición 3)
       private let videoCellPosition = 3
       private let videoURL = URL(string: "https://cdn.pixabay.com/video/2016/08/08/4315-178218581_large.mp4")! // Reemplaza con tu URL

       override func viewDidLoad() {
           super.viewDidLoad()
           tableView.dataSource = self
           tableView.delegate = self
           
           // 2. Registramos ambas celdas
           tableView.register(UINib(nibName: "TweetTableViewCell", bundle: nil), forCellReuseIdentifier: "TweetTableViewCell")
           tableView.register(UINib(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: "VideoCell")
           
           // 3. Configuramos altura dinámica para el video
           tableView.rowHeight = UITableView.automaticDimension
           tableView.estimatedRowHeight = 200
       }
   }

   // MARK: - UITableViewDataSource
   extension ViewController: UITableViewDataSource {
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return dataSource.count + 1 // +1 por la celda de video
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           // 4. Mostramos video en la posición definida
           if indexPath.row == videoCellPosition {
               let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoTableViewCell
               cell.setupVideo(with: videoURL)
               return cell
           } else {
               // 5. Ajustamos el índice para las celdas de tweet
               let adjustedIndex = indexPath.row > videoCellPosition ? indexPath.row - 1 : indexPath.row
               let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell", for: indexPath)
               
               if let newCell = cell as? TweetTableViewCell {
                   newCell.setUpCell(userName: dataSource[adjustedIndex], message: "Soy un Tweet")
               }
               
               return cell
           }
       }
       
       // 6. Definimos alturas diferentes
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return indexPath.row == videoCellPosition ? 200 : UITableView.automaticDimension
       }
   }

   // MARK: - UITableViewDelegate
   extension ViewController: UITableViewDelegate {
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           print("Seleccionaste la celda \(indexPath.row)")
       }
   }
