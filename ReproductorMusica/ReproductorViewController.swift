//
//  ReproductorViewController.swift
//  ReproductorMusica
//
//  Created by Victor Ernesto Velasco Esquivel on 30/07/17.
//  Copyright © 2017 Victor Ernesto Velasco Esquivel. All rights reserved.
//

import UIKit
import AVFoundation

class ReproductorViewController: UIViewController {
    
    private var reproductor : AVAudioPlayer!

    var itemDetalle : cancion = cancion()
     var itemDetalleEjemplo : cancion = cancion()
    
    @IBOutlet weak var imgPortada: UIImageView!
    
    @IBOutlet weak var lblTitulo: UILabel!
    
    @IBOutlet weak var lblAutor: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //itemDetalleEjemplo = itemDetalle;
        
        
        let sonidoURL = Bundle.main.url(forResource: itemDetalle.NombreCancion, withExtension: itemDetalle.ExtensionCancion)
        
        lblTitulo.text=itemDetalle.Titulo
        
        lblAutor.text=itemDetalle.Autor
        imgPortada.image = UIImage(named: itemDetalle.Portada+"."+itemDetalle.ExtensionPortada)
        do{
            try reproductor = AVAudioPlayer(contentsOf: sonidoURL!)
            reproductor.volume = 0.5
            reproductor.play()

        }
        catch{
            print("Error al tratar de reproducir")
        }
    }

   
    
    
    @IBAction func play() {
        if( !reproductor.isPlaying){
            reproductor.play()
        }

    }
    
    @IBAction func pause() {
        if(reproductor.isPlaying){
            reproductor.stop()
        }

    }
    
    @IBAction func stop() {
        if(reproductor.isPlaying){
            reproductor.stop()
            reproductor.currentTime=0.0
        }
    }
    
    @IBAction func volumen(_ sender: UISlider) {
        let current = Float(sender.value)
        reproductor.volume = current
        
        //reproductor.setVolume(Float( current), fadeDuration: 0.1)
        //reproductor.volume(
        
    }
    
    
    
    
    
    @IBAction func regresaMenu(_ sender: Any) {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
