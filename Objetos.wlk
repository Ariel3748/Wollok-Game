import Alimento.*
import MainGame.*


object pedidoArmado{
  var property ingredientes = []
  var property ultimoElemento =  null

  method agregarUltimoElemento(){
    game.addVisual(ingredientes.last())
  }

  method clean(){
    ingredientes.forEach({e=>self.eliminarUltimoIngrediente()})
  }

  method eliminarUltimoIngrediente(){
    game.removeVisual(ingredientes.last())
    ingredientes.remove(ingredientes.last())
    posicion.posicionY(posicion.posicionY() -1)
  }

  method agregarIngrediente(unIngrediente){
    ingredientes.add(unIngrediente)
    self.agregarUltimoElemento()
    }

  method llevarALaParrillaUltimoElemento(){
    ingredientes.last().cocinar()
  }

  method compararPedido(){
    var x = ingredientes.map({e=>e.ingrediente()})          //Comparo los strings de los pedidos POrque si comparo el elemento en si las instancias se llaman a Pan o a Carne y no me sirve
    return (x == orden.orden())
  }
}






//---------------------------------------------------Objetos de Muestra---------------------------------------------------------------//

object unPan inherits Pan {
  override method position() = game.at(1,2)
  method crearClon(){
     var nuevoPan 
     nuevoPan = new Pan()
     nuevoPan.initialize()
     posicion.usar()
    pedidoArmado.agregarIngrediente(nuevoPan)
  }


}

object unaCarne inherits Carne{
  override method position() = game.at(1,1)

  method crearClon(){
    var nuevaCarne
    nuevaCarne = new Carne()
    nuevaCarne.initialize()
    posicion.usar()
  pedidoArmado.agregarIngrediente(nuevaCarne)
  }
}

object unBacon inherits Bacon{

  
  override method image() = "BaconCrudoF.png"
    

  override method position() = game.at(1,0)
  
  method crearClon(){
    var nuevoBacon
    nuevoBacon = new Bacon()
    nuevoBacon.initialize()
    posicion.usar()
  pedidoArmado.agregarIngrediente(nuevoBacon)
  }
}

















//
/*
    Uso posiciones globales asi todas las nuevas instancias tienen acceso a la informacion en general de donde esta la poscion en la cual pueden agregarse
    y quedar lindante al ultimo elemento agregado
*/
object posicion{
  var property posicionX = 3
  var property posicionY = 5
  method usar(){
    posicionY = posicionY + 1
  }

  var property posicionParrillaX = 6
  var property posicionParrillaY = 0   
  method usarParrilla(){
    posicionParrillaX = posicionParrillaX + 1
  }
  method dejarDeUsarParrilla(){
    posicionParrillaX = posicionParrillaX - 1
  }

  var property posicionXMostrar = 8
  var property posicionYMostrar = 3
  method usarMostrar(){
    posicionYMostrar = posicionYMostrar + 1
  }
}


object orden{
    const property ingredientes = ["Tomate", "Lechuga", "Cebolla", "Mayonesa", "Ketchup", "Cheddar", "Bacon", "Paty de Lenteja", "Carne"]


    var property orden = []
    const armador = [1,2,3,4]
    method numeroRandom() = 0.randomUpTo(ingredientes.size()).truncate(0)
    method newOrden(){
      orden.clear()
      orden.add("Pan")
      armador.forEach({e=>orden.add(ingredientes.get(self.numeroRandom()))})
      orden.add("Pan")
      ordenAmostrar.mostrarPalabras()
    }


}

object ordenAmostrar{

  var property position = game.at(4,9)
  method text() = orden.orden().toString()

  method mostrarPalabras(){
    orden.orden().forEach({e=>
      creadorPalabra.crearOrden(e)
      posicion.usarMostrar()
    })
  }
}



object puntaje {
  var property position = game.at(0,8)
  var property puntos = 0
  method puntos() = puntos
  method setPuntosWin(){puntos = (puntos + 15).min(61)}
  method setPuntosLose(){puntos = (puntos -15).max(0)}
  method text() = "P:" + puntos
  method reiniciarPuntaje(){
    puntos = 0
  }

}
object winMssg{
  var property position = game.origin()
  var property image = "WinMensaje.png"
}

object loseMssg{
  var property position = game.origin()
  var property image = "LoseMssg.png"
}


object temporizador{
  var property position = game.at(5,6)
  var property segundos = 60
  var property text = "Tiempo: " + segundos

  method iniciar(){
    game.onTick(500, "Cronometro", {
      segundos = (segundos - 1).max(0)
      text = "Tiempo: " + segundos
      })
  }


}

//****************************************************************************************************

class Palabra{
  const property image  
  var property position
  
}













object creadorPalabra{

  method crearOrden(string){
    if(string == "Tomate"){
      var palabraAgregar 
      palabraAgregar = new Palabra(image = "TomatePalabra.png", position = game.at(posicion.posicionXMostrar(),posicion.posicionYMostrar()))
      game.addVisual(palabraAgregar)
    }

    if(string == "Lechuga") {
        var palabraAgregar 
        palabraAgregar = new Palabra(image = "LechugaPalabra.png", position = game.at(posicion.posicionXMostrar(), posicion.posicionYMostrar()))
        game.addVisual(palabraAgregar)
    }

    if(string == "Cebolla") {
        var palabraAgregar 
        palabraAgregar = new Palabra(image = "CebollaPalabra.png", position = game.at(posicion.posicionXMostrar(), posicion.posicionYMostrar()))
        game.addVisual(palabraAgregar)
    }

    if(string == "Mayonesa") {
        var palabraAgregar 
        palabraAgregar = new Palabra(image = "MayonesaPalabra.png", position = game.at(posicion.posicionXMostrar(), posicion.posicionYMostrar()))
        game.addVisual(palabraAgregar)
    }

    if(string == "Ketchup") {
        var palabraAgregar 
        palabraAgregar = new Palabra(image = "KetchupPalabra.png", position = game.at(posicion.posicionXMostrar(), posicion.posicionYMostrar()))
        game.addVisual(palabraAgregar)
    }

    if(string == "Cheddar") {
        var palabraAgregar 
        palabraAgregar = new Palabra(image = "CheddarPalabra.png", position = game.at(posicion.posicionXMostrar(), posicion.posicionYMostrar()))
        game.addVisual(palabraAgregar)
    }

    if(string == "Bacon") {
        var palabraAgregar 
        palabraAgregar = new Palabra(image = "BaconPalabra.png", position = game.at(posicion.posicionXMostrar(), posicion.posicionYMostrar()))
        game.addVisual(palabraAgregar)
    }

    if(string == "Paty de Lenteja") {
        var palabraAgregar 
        palabraAgregar = new Palabra(image = "PatyLentejaPalabra.png", position = game.at(posicion.posicionXMostrar(), posicion.posicionYMostrar()))
        game.addVisual(palabraAgregar)
    }

    if(string == "Carne") {
        var palabraAgregar 
        palabraAgregar = new Palabra(image = "CarnePalabra.png", position = game.at(posicion.posicionXMostrar(), posicion.posicionYMostrar()))
        game.addVisual(palabraAgregar)
    }
      if(string == "Pan") {
        var palabraAgregar 
        palabraAgregar = new Palabra(image = "PanAbajoPalabra.png", position = game.at(posicion.posicionXMostrar(), posicion.posicionYMostrar()))
        game.addVisual(palabraAgregar)
    }

    }
}



