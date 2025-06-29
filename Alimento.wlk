import MainGame.*
import Objetos.*

class Alimento{
  var calorias 
  var image
  var position

  var property estaColisionando = false   
  var estaCrudo = true
  method cocinar(){estaCrudo = false}
  method image() = image
  method position() = position
  
}


//      ["Tomate", "Lechuga", "Cebolla", "Mayonesa", "Ketchup", "Cheddar", "Bacon", "Paty de Lenteja", ]

class Pan inherits Alimento{

  method initialize(){
    calorias = 100
    image = "Pan_Arriba.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())   //Cuando se instancia un nuevo objeto se acomda encima de la ultima cosa agregada"
  }

  method ingrediente() = "Pan"

}


class Carne inherits Alimento{

  method initialize(){
    calorias = 250
    image = "carne.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
  }

  override method cocinar(){
    super()
    const posActual = puntero.position()
    calorias += 100
    position = game.at(posicion.posicionParrillaX(),posicion.posicionParrillaY())
    posicion.usarParrilla()
    game.schedule(5000, {
        image = "Carne50.png"
        position = posActual
        posicion.dejarDeUsarParrilla()
    })
  }

  method ingrediente() = "Carne"
}


class Tomate inherits Alimento{

  method initialize(){
    calorias = 150
    image = "Tomatito.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
  }

  method ingrediente() = "Tomate"
}


class Lechuga inherits Alimento{
method initialize(){
  calorias = 100
  image = "Lechuguita.png"
  position = game.at(posicion.posicionX(),posicion.posicionY())
}

  method ingrediente() = "Lechuga"
}


class Cebolla inherits Alimento{
  method initialize(){
    calorias = 80
    image = "Cebollita.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
  }

  method ingrediente() = "Cebolla"
}

class Mayonesa inherits Alimento{
  method initialize(){
    calorias = 150
    image = "Mayonesita.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
  }

  method ingrediente() = "Mayonesa"
}

class Ketchup inherits Alimento(){
  method initialize(){
    calorias = 120
    image = "ketchup.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
  }

  method ingrediente()="Ketchup"
}


class Cheddar inherits Alimento(){
  method initialize(){
    calorias = 200
    image = "CheddarCrudo.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
  }

  override method cocinar(){
    super()
    const posActual = puntero.position()
    calorias += 100
    position = game.at(posicion.posicionParrillaX(),posicion.posicionParrillaY())
    posicion.usarParrilla()
    game.schedule(5000, {
        image = "Quesito.png"
        position = posActual
        posicion.dejarDeUsarParrilla()
    })
  }

  method ingrediente() = "Cheddar"

} 

class Bacon inherits Alimento(){
  method initialize(){
    calorias = 250
    image = "BaconCrudo.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
  }

  override method cocinar(){
    super()
    const posActual = puntero.position()
    calorias += 100
    position = game.at(posicion.posicionParrillaX(),posicion.posicionParrillaY())
    posicion.usarParrilla()
    game.schedule(5000, {
        image = "Bacon.png"
        position = posActual
        posicion.dejarDeUsarParrilla()
    })
  }

  method ingrediente() = "Bacon"
}


class Patylenteja inherits Alimento{
  method initialize(){
    calorias = 90
    image = "Hamburguesa_LentejaCruda.png"
    position = game.at(posicion.posicionX(),posicion.posicionY())
  }

    override method cocinar(){
    super()
    const posActual = puntero.position()
    calorias += 100
    position = game.at(posicion.posicionParrillaX(),posicion.posicionParrillaY())
    posicion.usarParrilla()
    game.schedule(5000, {
        image = "Hamburguesa_de_lentejas.png"
        position = posActual
        posicion.dejarDeUsarParrilla()
    })
  }

}