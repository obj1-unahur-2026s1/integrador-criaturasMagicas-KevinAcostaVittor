class Colonia{
    const property criaturas = []

    method conquistar(area) {
        if (self.poderOfensivo() > area.poderDefensivo()){
            area.coloniaActual(self)
        }
        else{
            criaturas.forEach({c => c.perderPoderMagico()})
        }
    }
    method poderOfensivo() { return criaturas.sum({c => c.poderOfensivo()}) }
}

class Area{
    var property coloniaActual

    method poderDefensivo()
}

class Claro inherits Area{
    override method poderDefensivo() { return coloniaActual.poderOfensivo() + 100 }
}

class Castillo inherits Area{
    override method poderDefensivo() { return 200 * coloniaActual.criaturas().size() }
}