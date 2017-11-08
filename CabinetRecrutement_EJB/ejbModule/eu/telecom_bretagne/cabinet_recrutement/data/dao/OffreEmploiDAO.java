package eu.telecom_bretagne.cabinet_recrutement.data.dao;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi;

/**
 * Session Bean implementation class EntrepriseDAO
 * @author Aboubacar BARRY et Yohann LE GALL
 */
@Stateless
@LocalBean
public class OffreEmploiDAO
{
  //-----------------------------------------------------------------------------
  /**
   * Référence vers le gestionnaire de persistance.
   */
  @PersistenceContext
  EntityManager entityManager;
  //-----------------------------------------------------------------------------
  /**
   * Default constructor.
   */
  public OffreEmploiDAO()
  {
    // TODO Auto-generated constructor stub
  }
  //-----------------------------------------------------------------------------
  public OffreEmploi findById(Integer id)
  {
    return entityManager.find(OffreEmploi.class, id);
  }
  //----------------------------------------------------------------------------
  @SuppressWarnings({ "rawtypes", "unchecked" })
  public List<OffreEmploi> findByEntreprise(int idEntreprise){
    Query query = entityManager.createQuery("select offreEmploi from OffreEmploi offreEmploi " +
                                            "where offreEmploi.entreprise.idEntreprise = :idE " +
                                            "order by offreEmploi.idOffreEmploi desc");
    query.setParameter("idE", idEntreprise);
    List<OffreEmploi> l = query.getResultList();
    return l;
  }

  public List<OffreEmploi> findBySecteurActiviteAndNiveauQualification(int idSecteurActivite, int idNiveauQualification){
    Query query = entityManager.createQuery("select oe from OffreEmploi oe join oe.secteursActivite sects " +
                                            "where sects.idSecteurActivite = :idSA and oe.niveauQualification.idNiveauQualification = :idNQ " +
                                            "order by oe.idOffreEmploi desc");
    query.setParameter("idSA", idSecteurActivite);
    query.setParameter("idNQ", idNiveauQualification);
    List<OffreEmploi> l = query.getResultList();
    return l;
  }
  
  public List<OffreEmploi> findAll() {
    Query query = entityManager.createQuery("select offreEmploi from OffreEmploi offreEmploi " +
                                            "order by offreEmploi.idOffreEmploi desc");
    List<OffreEmploi> l = query.getResultList();
    return l;
  }

  
  public OffreEmploi persist(OffreEmploi offreEmploi){
	  entityManager.persist(offreEmploi);
	  return offreEmploi;
  }  
  
  public OffreEmploi update(OffreEmploi offreEmploi){
	  return entityManager.merge(offreEmploi);
  }
  
  public void remove(OffreEmploi offreEmploi){
	  if(!entityManager.contains(offreEmploi))
		  entityManager.merge(offreEmploi);
	  entityManager.remove(offreEmploi);
  }
  
  
  //-----------------------------------------------------------------------------
}
