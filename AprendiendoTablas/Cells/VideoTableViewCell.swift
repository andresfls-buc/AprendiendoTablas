//
//  VideoTableViewCell.swift
//  AprendiendoTablas
//
//  Created by Andres Landazabal on 2025/06/15.
//

import UIKit
import AVKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var videoCellView: UIView!
    
    
   
    
    // MARK: - Propiedades para el video
    private var player: AVPlayer?             // Controla la reproducción
    private var playerLayer: AVPlayerLayer?   // Muestra el video en pantalla
    
    // MARK: - Configuración inicial
    override func awakeFromNib() {
        super.awakeFromNib()
        setupVideoView()
    }
    
    // MARK: - Preparar la vista de video
    private func setupVideoView() {
        videoCellView.backgroundColor = .black  // Fondo temporal para debug
        videoCellView.clipsToBounds = true     // Recorta el video si sobresale
    }
    
    // MARK: - Configurar el video (método principal)
    func setupVideo(with url: URL) {
        // 1. Limpiar cualquier video anterior
        playerLayer?.removeFromSuperlayer()
        
        // 2. Crear nuevo reproductor
        player = AVPlayer(url: url)
        playerLayer = AVPlayerLayer(player: player)
        
        // 3. Ajustar propiedades del video
        playerLayer?.frame = videoCellView.bounds
        playerLayer?.videoGravity = .resizeAspectFill  // Ajuste de aspecto
        
        // 4. Agregar a la vista
        if let layer = playerLayer {
            videoCellView.layer.addSublayer(layer)
        }
        
        // 5. Reproducir automáticamente (opcional)
        player?.play()
    }
    
    // MARK: - Ajustar layout cuando cambia el tamaño
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = videoCellView.bounds  // Redimensionar con la celda
    }
    
    // MARK: - Limpieza al reutilizar la celda
    override func prepareForReuse() {
        super.prepareForReuse()
        player?.pause()                          // Pausar reproducción
        playerLayer?.removeFromSuperlayer()       // Eliminar capa de video
        player = nil
        playerLayer = nil
    }
}
