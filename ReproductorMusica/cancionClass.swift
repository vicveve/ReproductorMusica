//
//  cancionClass.swift
//  ReproductorMusica
//
//  Created by Victor Ernesto Velasco Esquivel on 30/07/17.
//  Copyright © 2017 Victor Ernesto Velasco Esquivel. All rights reserved.
//

import Foundation


class cancion{
    var Titulo : String
    var Portada : String
    var ExtensionPortada : String
    var Autor : String
    var NombreCancion : String
    var ExtensionCancion : String
    
    init() {
        Titulo = ""
        Portada = ""
        ExtensionPortada = ""
        Autor = ""
        NombreCancion = ""
        ExtensionCancion = ""
    }

    
    init(_titulo : String, _portada : String, _extensionPortada : String, _autor : String, _nombreCancion : String, _extensionCancion : String) {
        Titulo = _titulo
        Portada = _portada
        ExtensionPortada = _extensionPortada
        Autor = _autor
        NombreCancion = _nombreCancion
        ExtensionCancion = _extensionCancion
    }
    
}
