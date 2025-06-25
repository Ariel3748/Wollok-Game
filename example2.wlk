

object juego{
  method iniciar(){
    game.addVisual(unPan) 
    game.addVisual(unaCarne)
    game.addVisualCharacter(puntero)
    game.onCollideDo(puntero, {                                             //cada vez que colisiona con algo, le cambia el estado interno a algo a true y al puntero le digo quien es algo para que luego verifique que sea != de null
        i=>i.estaColisionando(true)
        puntero.ultimoColisionado(i)
        game.schedule(1500,{i.estaColisionando(false)})                     //Aca lo hice medio "Con alambre" porque no hay una forma de cambiar el estado interno de estaColisionando a false cuanso se separa, asi que despues de 1.5s lo cambio automaticamente
        })
    keyboard.k().onPressDo({pedidoArmado.eliminarUltimoIngrediente()})
    keyboard.t().onPressDo({self.metodo()})                                 //Llama al metodo metodo (me cago en la creatividad) para que cuando toco la T verifique que esta colisionanso con eso mismo y lo clona
    keyboard.x().onPressDo({console.println(pedidoArmado.ingredientes())})  //Verificaicon por consola de la lista de productos que se va armando
    keyboard.enter().onPressDo({puntero.ganar()})                           //Llama a verificar si esta bien loq ue armamos
  }
    

    method metodo(){
         var objetivo = puntero.ultimoColisionado()
         if (objetivo !== null && objetivo.estaColisionando()) {
        objetivo.crearClon()
        }
    }


}


object pedidoArmado{
  var property ingredientes = []
  var property ultimoElemento =  null


  

  method agregarUltimoElemento(){
    game.addVisual(ingredientes.last())
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

  method compararPedido(){
    var x = ingredientes.map({e=>e.ingrediente()})
    return x == orden.orden()
  }
}


object puntero{


  var property ultimoColisionado = null         //Esto me ayuda a verificar que solo cuando algo esta colisionando y al mismo timepo estoy tocanso la tecla de accion se cree una nueva instancia
  var imagen = "circle.png"
  method image() = imagen
  var property position = game.center()

  method ganar() = if(pedidoArmado.compararPedido()){game.say(self,"Ganaste")} else{game.say(self,"Perdiste")}

}


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

class Pan inherits Alimento{

  method initialize(){
    calorias = 100
    image = "pan.png"
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
    calorias += 100
  }

  method ingrediente() = "Carne"
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
}


object orden{
    var property orden = ["Pan","Carne","Carne","Pan"]
}