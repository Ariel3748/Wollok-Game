import MainGame.*
import Objetos.*

class Alimento{
  var calorias 
  var image
  var position
  var imagenPalabra

  var property estaEnLaParrilla = false
  var property estaColisionando = false   
  var property estaCrudo = true
  method cocinar(){estaCrudo = false}
  method image() = image
  method position() = position
  method crearPalabra(){
    var palabra 
    palabra = new Palabra(image = imagenPalabra, position = position.at(posicion.posicionXMostrar(),posicion.posicionYMostrar()))
    game.addVisual(palabra)
  }
  
}


//      ["Tomate", "Lechuga", "Cebolla", "Mayonesa", "Ketchup", "Cheddar", "Bacon", "Paty de Lenteja", ]

class Pan inherits Alimento{

  method initialize(){
    calorias = 100
    image = "Pan_ArribaF.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())   //Cuando se instancia un nuevo objeto se acomda encima de la ultima cosa agregada"
    imagenPalabra = "PanAbajoPalabra.png"
  }

  method ingrediente() = "Pan"

}


class Carne inherits Alimento{

  method initialize(){
    calorias = 250
    image = "carneF.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
    imagenPalabra = "CarnePalabra.png"
  }

  override method cocinar(){
    self.estaEnLaParrilla(true)
    super()
    const posActual = puntero.position()
    calorias += 100
    position = game.at(posicion.posicionParrillaX(),posicion.posicionParrillaY())
    posicion.usarParrilla()
    game.schedule(5000, {
        image = "CarneCocidaF.png"
        position = posActual
        posicion.dejarDeUsarParrilla()
        self.estaEnLaParrilla(false)
    })
  }

  method quemar(){
    const posActual = puntero.position()
    calorias += 500
    position = game.at(posicion.posicionParrillaX(),posicion.posicionParrillaY())
    posicion.usarParrilla()
    game.schedule(5000, {
        image = "CarboncitoF.png"
        position = posActual
        posicion.dejarDeUsarParrilla()
    puntaje.setPuntosLose()
    })

  }

  method ingrediente() = "Carne"
}


class Tomate inherits Alimento{

  method initialize(){
    calorias = 150
    image = "TomateF.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
    imagenPalabra = "TomatePalabra.png"
  }

  method ingrediente() = "Tomate"
}


class Lechuga inherits Alimento{
method initialize(){
  calorias = 100
  image = "LechugaF.png"
  position = game.at(posicion.posicionX(),posicion.posicionY())
  imagenPalabra = "LechugaPalabra.png"
}

  method ingrediente() = "Lechuga"
}


class Cebolla inherits Alimento{
  method initialize(){
    calorias = 80
    image = "CebollaF.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
    imagenPalabra = "CebollaPalabra.png"
  }

  method ingrediente() = "Cebolla"
}

class Mayonesa inherits Alimento{
  method initialize(){
    calorias = 150
    image = "MayonesaF.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
    imagenPalabra = "MayonesaPalabra.png"
  }

  method ingrediente() = "Mayonesa"
}

class Ketchup inherits Alimento(){
  method initialize(){
    calorias = 120
    image = "ketchupF.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
    imagenPalabra = "KetchupPalabra.png"
  }

  method ingrediente()="Ketchup"
}


class Cheddar inherits Alimento(){
  method initialize(){
    calorias = 200
    image = "CheddarCrudoF.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
    imagenPalabra = "CheddarPalabra.png"
  }

  override method cocinar(){
    self.estaEnLaParrilla(true)
    super()
    const posActual = puntero.position()
    calorias += 100
    position = game.at(posicion.posicionParrillaX(),posicion.posicionParrillaY())
    posicion.usarParrilla()
    game.schedule(5000, {
        image = "QuesoF.png"
        position = posActual
        posicion.dejarDeUsarParrilla()
        self.estaEnLaParrilla(false)
    })
  }

    method quemar(){
      const posActual = puntero.position()
      calorias += 500
      position = game.at(posicion.posicionParrillaX(),posicion.posicionParrillaY())
      posicion.usarParrilla()
      game.schedule(5000, {
          image = "CarboncitoF.png"
          position = posActual
          posicion.dejarDeUsarParrilla()
      puntaje.setPuntosLose()
    })

  }

  method ingrediente() = "Cheddar"

} 

class Bacon inherits Alimento(){
  method initialize(){
    calorias = 250
    image = "BaconCrudoF.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
    imagenPalabra = "BaconPalabra.png"
  }

  override method cocinar(){
    self.estaEnLaParrilla(true)
    super()
    const posActual = puntero.position()
    calorias += 100
    position = game.at(posicion.posicionParrillaX(),posicion.posicionParrillaY())
    posicion.usarParrilla()
    game.schedule(5000, {
        image = "BaconF.png"
        position = posActual
        posicion.dejarDeUsarParrilla()
        self.estaEnLaParrilla(false)
    })
  }

  method quemar(){
    const posActual = puntero.position()
    calorias += 500
    position = game.at(posicion.posicionParrillaX(),posicion.posicionParrillaY())
    posicion.usarParrilla()
    game.schedule(5000, {
        image = "CarboncitoF.png"
        position = posActual
        posicion.dejarDeUsarParrilla()
    puntaje.setPuntosLose()
    })

  }

  method ingrediente() = "Bacon"
}


class Patylenteja inherits Alimento{
  method initialize(){
    calorias = 90
    image = "Hamburguesa_LentejaCrudaF.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
    imagenPalabra = "PatyLentejaPalabra"
  }

    override method cocinar(){
      self.estaEnLaParrilla(true)
    super()
    const posActual = puntero.position()
    calorias += 100
    position = game.at(posicion.posicionParrillaX(),posicion.posicionParrillaY())
    posicion.usarParrilla()
    game.schedule(5000, {
        image = "Hamburguesa_de_lentejasF.png"
        position = posActual
        posicion.dejarDeUsarParrilla()
        self.estaEnLaParrilla(false)
    })
  }

    method quemar(){
    const posActual = puntero.position()
    calorias += 500
    position = game.at(posicion.posicionParrillaX(),posicion.posicionParrillaY())
    posicion.usarParrilla()
    game.schedule(5000, {
        image = "CarboncitoF.png"
        position = posActual
        posicion.dejarDeUsarParrilla()
    puntaje.setPuntosLose()
    })

  }

  method ingrediente() = "Paty de Lenteja"
}