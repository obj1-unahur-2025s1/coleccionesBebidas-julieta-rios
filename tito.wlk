object tito {
    var cantidad = 0
    var bebida = cianuro
    const peso = 70
    const inerciaBase = 490
    method consumir(unaCantidad,unaBebida) {
        bebida = unaBebida
        cantidad = unaCantidad
    }
    method bebida() = bebida

    method velocidad() {
        return bebida.rendimiento(cantidad)
        * inerciaBase / peso
    }
    method peso() = peso
}

object whisky {
    method rendimiento(cantidad) = 0.9 ** cantidad
}
object cianuro {
    method rendimiento(cantidad) = 0
}

object terere {
    method rendimiento(cantidad) {
        return 1.max(cantidad * 0.1)
        //tambien (cantidad * 0.1).max(1)
    }
}

object licuado {
    const nutrientes = []

    method rendimiento(cantidad) = nutrientes.sum() * cantidad 

    method agregar(nutriente) {
        nutrientes.add(nutriente)
    }
}

object aguaSaborizada {
    var bebida = terere
    method rendimiento(cantidad) = 1 + bebida.rendimiento(cantidad)/4
    method bebida(nuevaBebida) { 
        bebida = nuevaBebida
    }
}

object coctel {
    const bebidas = [whisky, terere]
    method rendimiento(cantidad) = bebidas.sum({b=>b.rendimiento(cantidad)}) //a cada bebida preguntale el rendimiento y suma
}

object coctelSuave {
    const bebidas = [whisky, terere]
    method rendimiento(cantidad) {
        const bebidasAConsiderar = bebidas.filter({b=>b.rendimiento(cantidad) > 0.5 })
        return bebidasAConsiderar.sum({b=>b.rendimiento(cantidad)}) //b es cada elemento de la lista 
    }
    method rendimientoBis(cantidad) =
        bebidas.filter({b=>b.rendimiento(cantidad) > 0.5 }).sum({b=>b.rendimiento(cantidad)})
    
    method agregar(bebida){
        bebidas.add(bebida)
    }

    method quitar(bebida){
        bebidas.remove(bebida)
    }
}
//[whisky, cianuro,  terere].any({bebida => bebida.rendimiento(1)<0})
//[whisky, cianuro,  terere].max({bebida => bebida.rendimiento(0.2)})

