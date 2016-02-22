package clustering;

public class DistanceManhattan implements Distance {

	public double valeur(Donnee d1, Donnee d2) {
		double sum = 0;
		
		for (int i = 1; i < d1.nbDimensions(); i++){
			sum += Math.abs(d1.valeurDim(i) - d2.valeurDim(i));
		}
		return sum;
	}

}
