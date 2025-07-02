import Objetos.*
import MainGame.*

object menuPrincipal {
    var fondo = "Fondo.png"

  method mainMenu() {
    const sonido = game.sound("sound1.mp3")
    
    game.clear()
    game.boardGround(fondo)
    jugar.initialize()
    nosotros.initialize()
    instrucciones.initialize()
    game.addVisual(nombreJuego)
    game.addVisual(jugar)
    game.addVisual(instrucciones)
    game.addVisual(nosotros)
    game.addVisualCharacter(puntero2)
    keyboard.up().onPressDo({sonido.play()})
	keyboard.right().onPressDo({sonido.play()})
	keyboard.down().onPressDo({sonido.play()})
	keyboard.left().onPressDo({sonido.play()})
    keyboard.a().onPressDo({nosotros.accion()})
    keyboard.j().onPressDo({jugar.accion()})
    keyboard.i().onPressDo({instrucciones.accion()})
    keyboard.m().onPressDo({self.mainMenu()})
  }
}

object nombreJuego {
    var property position = game.at(-1,3)
    method image() = "logoGameF.png"
}

object puntero2 {
    var property position = game.at(5,5)
    const image = "CursorManoF.gif"
	

    method image() = image
   
}

class Opcion {
    var property imagen //posible imagen
    var position

}

object jugar inherits Opcion{
    method initialize(){
        position = game.at(2,2)
        imagen = "JugarMsgF.png"
    }
    method position() = position
    method image() = imagen
    method accion(){
        game.clear()
        keyboard.m().onPressDo({menuPrincipal.mainMenu()})
        juego.iniciar()
   }
}

object instrucciones inherits Opcion{
    
    method initialize(){
    imagen = "ComoJugarF.png"
    position = game.at(2,1)
    }
    method position() = position
    method image() = imagen
    method accion(){
        game.clear()
        game.addVisual("imagenInstrucciones")
        keyboard.m().onPressDo({menuPrincipal.mainMenu()})
   }
}

object nosotros inherits Opcion{
    
    method initialize(){
    imagen = "ConocenosF.png"
    position = game.at(2,0)
    }
    method position() = position
    method image() = imagen

    method accion(){
        game.clear()
        game.addVisual("")
        keyboard.m().onPressDo({menuPrincipal.mainMenu()})
   }
}

object paletaColores {
  const property violeta = "4C2882"
}