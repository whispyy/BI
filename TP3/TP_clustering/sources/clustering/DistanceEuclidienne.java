package clustering;

public class DistanceEuclidienne implements Distance {

	public double valeur(Donnee d1, Donnee d2) {
		double sum = 0;
		
		for (int i = 1; i < d1.nbDimensions(); i++){
				sum += Math.pow(d1.valeurDim(i) - d2.valeurDim(i),2);
		}
		return Math.sqrt(sum);
	}

}
