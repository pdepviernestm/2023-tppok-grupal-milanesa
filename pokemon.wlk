object red{
	
	const equipo = []
	const poderAltoMando = 10000
	const pokemonesEnCiudad = [ratatta, machop, pikachu, dragonite, snorlax]	
    
    method entrenar(){
		equipo.forEach({p => p.entrenar()})
	}
	
	method capturar(pokemon) { 
		equipo.add(pokemon)
		}
		
	method equipo() = equipo
	
	method poderPromedio(){
		if (equipo.size().equals(0))
			return 0
		else
			return self.poder() / equipo.size()
	}
	
	method convieneReclutar(pokemon) = pokemon.poder() > self.poderPromedio()
	
	
	method reclutarSiConviene(pokemon){
		 if(self.convieneReclutar(pokemon))
			self.capturar(pokemon)
	}
	
	method reclutarPokemonesConvenientes(){ 
		pokemonesEnCiudad.forEach({p => self.reclutarSiConviene(p)})
	}
	
	method pokemonMenosPoderoso() = equipo.min({p => p.poder()})
	
	
	method abandonarPokemonMasDebil(){
		equipo.remove(self.pokemonMenosPoderoso())
	}
	
	method entrenarEquipo(){
		 equipo.forEach({p => p.entrenar()})
		 }
		 
	
	method poder() = equipo.sum({p => p.poder()})
	
	method ganaraLaLiga() = self.poder()>=(poderAltoMando + blue.poder())
	
} 

object blue{
    const amigos = []
    const pokemonesEnCiudad = [ratatta, machop, pikachu, dragonite, snorlax]	
    method poder() = 100 * self.amigosPoderosos().size()
    
    method amigos() = amigos
    
    method entrenar(){
    	amigos.add(pokemonesEnCiudad.anyOne())
    	}
    	
    method amigosPoderosos() = amigos.filter({a => a.poder() > 3000})
}

object ratatta{
	
	method poder() = 1500
	
	method entrenar(){}
}

object machop{
	var poder = 2000
	
	method poder() = poder
	
	method entrenar(){
		poder += poder*10/100
	}
}

object pikachu{
	const misterios = ["Mansion parte 2", "Mayordomo", "Pueblo Lavanda", "Mew"]
	
	method poder() = 20 * self.cantLetras()
	
	method cantLetras() = misterios.sum({m => m.size()})
	
	
	method noTieneParte2(misterio) = misterio.contains("parte 2").negate()
	
	
	method entrenar(){
		const misterioSinSecuela = misterios.find({m => self.noTieneParte2(m)})
		misterios.add(misterioSinSecuela + (" parte 2"))
	}
}

object dragonite{
	
	method poder() = machop.poder() * 2
	
	method entrenar(){ 
		bruno.entrenar()
		}
}

object bruno{
	method entrenar(){}
}

// snorlax gana poder duermiendo
object snorlax{
	var horasDeSuenio = 8
	
	method poder(){
		return 500 * horasDeSuenio
	
	}
	
	method entrenar() {
		horasDeSuenio += 8
	} 
}
