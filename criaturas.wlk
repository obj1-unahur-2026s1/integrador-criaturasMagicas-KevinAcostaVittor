class Criatura { 
    var poderMagico
    const astucia
    var rol

    method rol() { return rol }

    method poderOfensivo() { poderMagico * 10 + rol.rolExtra() }

    method esFormidable() { return self.esAstuta() || self.esExtraordinaria() }

    method esAstuta()

    method esExtraordinaria() { return rol.esRolExtraordinarioPara(self) }

    method hacerRitual() { rol = rol.proximoRol() }

    method perderPoderMagico() { poderMagico *= 0.85 }
}

class Hada inherits Criatura {
    var kilometrosQueVuela = 2

    method aumentarKilometros() { 25.max(kilometrosQueVuela + 1) }

    override method esAstuta() { return astucia > 50 }

    override method esExtraordinaria() { return super() && kilometrosQueVuela > 10 }
}

class Duende inherits Criatura {
    override method poderOfensivo() { super() * 1.1 }

    override method esAstuta() { return false }
}

object guardian{
    method rolExtra() { return 100 }

    method esRolExtraordinarioPara(criatura) { return criatura.poderMagico() >= 50 }

    // ANOTAR
    method proximoRol() { return new Domador(mascotas = [new Mascota(edad = 1,tieneCuernos = false)]) }
}

class Domador {
    const mascotas = []

    method mascotas() { return mascotas }

    method entrenarMascota(mascota) { mascotas.add(mascota) }

    method rolExtra() { return 150 * mascotas.count({m => m.tieneCuernos()}) }

    method esRolExtraordinarioPara(criatura) { return criatura.poderMagico() >= 15 && mascotas.all({m => m.esVeterana()}) }

    method proximoRol() { return if (mascotas.any({m => m.tieneCuernos()})) hechicero else self.error("Ritual cancelado.") }
}

class Mascota {
    const edad
    const tieneCuernos

    method edad() { return edad }

    method tieneCuernos() { return tieneCuernos }

    method esVeterana() { return edad >= 10 }
}

object hechicero {
    method rolExtra() { return 0 }

    method esRolExtraordinarioPara(criatura) { return true }

    method proximoRol() { return guardian }
}