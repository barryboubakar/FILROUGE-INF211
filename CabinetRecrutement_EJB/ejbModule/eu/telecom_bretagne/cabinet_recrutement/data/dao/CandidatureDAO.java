package eu.telecom_bretagne.cabinet_recrutement.data.dao;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature;
import eu.telecom_bretagne.cabinet_recrutement.data.model.NiveauQualification;
import eu.telecom_bretagne.cabinet_recrutement.data.model.SecteurActivite;

/**
 * Session Bean implementation class EntrepriseDAO
 * @author Aboubacar BARRY et Yohann LE GALL
 */
@Stateless
@LocalBean
public class CandidatureDAO
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
  public CandidatureDAO()
  {
    // TODO Auto-generated constructor stub
  }
  //-----------------------------------------------------------------------------
  public Candidature findById(Integer id)
  {
    return entityManager.find(Candidature.class, id);
  }
  //----------------------------------------------------------------------------
  @SuppressWarnings({ "rawtypes", "unchecked" })
  public List<Candidature> findAll()
  {
    Query query = entityManager.createQuery("select candidature from Candidature candidature order by candidature.idCandidature desc");
    List l = query.getResultList(); 
    
    return (List<Candidature>)l;
  }
  public List<Candidature> findBySecteurActiviteAndNiveauQualification(int idSecteurActivite, int idNiveauQualification){
	  Query query = entityManager.createQuery("select c from Candidature c join c.secteursActivite secteur where secteur.idSecteurActivite = :idSA and c.niveauQualification.idNiveauQualification = :idNQ order by c.idCandidature desc");
		  query.setParameter("idSA", idSecteurActivite);
		  query.setParameter("idNQ", idNiveauQualification);
		  List<Candidature> l = query.getResultList();
		  return l;
  }
  
  
  public Candidature persist(Candidature candidature){
	  entityManager.persist(candidature);
	  return candidature;
  }  
  
  public Candidature update(Candidature candidature){
	  return entityManager.merge(candidature);
  }
  
  public void remove(Candidature candidature){
	  if(!entityManager.contains(candidature))
		  candidature = entityManager.merge(candidature);
	  entityManager.remove(candidature);
  }
  
  
  //-----------------------------------------------------------------------------
}
