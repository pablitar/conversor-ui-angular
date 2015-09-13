package conversor

import conversor.domain.Conversor
import conversor.web.ResultadoConversion
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils

@Controller
class MainController {

	extension JSONUtils jsonUtils = new JSONUtils

	def static void main(String[] args) {
		XTRest.start(MainController, 9000)
	}

	@Get("/convertir/:km")
	def Result convertir() {
		response.contentType = ContentType.APPLICATION_JSON
		try {
			val conversor = new Conversor(Double.valueOf(km))
			conversor.convertir

			ok(new ResultadoConversion(conversor.millas).toJson)

		} catch (NumberFormatException e) {
			badRequest(formatearError('''«km» no es un valor numérico'''))
		} catch (Exception e) {
			internalServerError(formatearError(e.message))
		}
	}

	def formatearError(String message) {
		'''{"errorMessage": "«message»"}'''.toString
	}


}