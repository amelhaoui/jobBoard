package Controller;

public class Validation {
	/**
	 * Valide l'adresse mail saisie.
	 */
	public static void validationEmail(String email) throws Exception {
		if (email != null && email.trim().length() != 0) {
			if (!email.matches("([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)")) {
				throw new Exception("Merci de saisir une adresse mail valide.");
			}
		} else {
			throw new Exception("Merci de saisir une adresse mail.");
		}
	}

	/**
	 * Valide les mots de passe saisis.
	 */
	public static void validationMotsDePasse(String motDePasse,
			String confirmation) throws Exception {
		if (motDePasse != null && motDePasse.trim().length() != 0
				&& confirmation != null && confirmation.trim().length() != 0) {
			if (!motDePasse.equals(confirmation)) {
				throw new Exception(
						"Les mots de passe entr�s sont diff�rents, merci de les saisir � nouveau.");
			} else if (motDePasse.trim().length() < 3) {
				throw new Exception(
						"Les mots de passe doivent contenir au moins 3 caract�res.");
			}
		} else {
			throw new Exception(
					"Merci de saisir et confirmer votre mot de passe.");
		}
	}

	/**
	 * Valide le nom d'utilisateur saisi.
	 */
	public static void validationNom(String nom) throws Exception {
		if (nom != null && nom.trim().length() < 3) {
			throw new Exception(
					"Le nom d'utilisateur doit contenir au moins 3 caract�res.");
		}
	}
}
