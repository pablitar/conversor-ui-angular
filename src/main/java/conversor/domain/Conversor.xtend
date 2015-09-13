package conversor.domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.xtend.lib.annotations.AccessorType

class Conversor {
	
	Double km = 0.0
	
	@Accessors(AccessorType.PUBLIC_GETTER)
	Double millas = 0.0
	
	new(Double km) {
		this.km = km
	}
	
	def convertir() { 
		this.millas = km * 1.609
	}
}