package ejb;

import jakarta.ejb.Local;

import java.util.Map;

@Local
public interface IStatistiqueService {
    long getNombreTotalProduits();
    double getValeurTotalStock();
    double getPrixMoyen();
    Map<String, Object> getStatistiquesGenerales();
    long getNombreProduitsEnRupture();
}
