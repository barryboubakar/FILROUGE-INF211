package eu.telecom_bretagne.cabinet_recrutement.data.dao;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import eu.telecom_bretagne.cabinet_recrutement.data.model.NiveauQualification;
import eu.telecom_bretagne.cabinet_recrutement.data.model.NiveauQualification;
import eu.telecom_bretagne.cabinet_recrutement.data.model.NiveauQualification;

/**
 * Session Bean implementation class EntrepriseDAO
 * @author Aboubacar BARRY et Yohann LE GALL
 */
@Stateless
@LocalBean
public class NiveauQualificationDAO
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
  public NiveauQualificationDAO()
  {
    // TODO Auto-generated constructor stub
  }
  //-----------------------------------------------------------------------------
  public NiveauQualification findById(Integer id)
  {
    return entityManager.find(NiveauQualification.class, id);
  }
  //----------------------------------------------------------------------------
  public List<NiveauQualification> findAll()
  {
    Query query = entityManager.createQuery("select niveauQualif from NiveauQualification niveauQualif " +
                                            "order by niveauQualif.idNiveauQualification");
    List<NiveauQualification> l = query.getResultList();
    return l;
  }
    
  
   public NiveauQualification persist(NiveauQualification niveau){
	   	entityManager.persist(niveau);
   		return entityManager.find(NiveauQualification.class, niveau);
   }
  
   public NiveauQualification update(NiveauQualification niveau){
	   return entityManager.merge(niveau);
   }
  
  //-----------------------------------------------------------------------------
}
