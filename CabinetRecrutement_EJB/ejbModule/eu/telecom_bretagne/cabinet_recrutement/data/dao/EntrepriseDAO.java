package eu.telecom_bretagne.cabinet_recrutement.data.dao;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise;

/**
 * Session Bean implementation class EntrepriseDAO
 * @author Aboubacar BARRY et Yohann LE GALL
 */
@Stateless
@LocalBean
public class EntrepriseDAO
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
  public EntrepriseDAO()
  {
    // TODO Auto-generated constructor stub
  }
  //-----------------------------------------------------------------------------
  public Entreprise findById(Integer id)
  {
    return entityManager.find(Entreprise.class, id);
  }
  //----------------------------------------------------------------------------
  @SuppressWarnings({ "rawtypes", "unchecked" })
  public List<Entreprise> findAll()
  {
    Query query = entityManager.createQuery("select entreprise from Entreprise entreprise order by entreprise.idEntreprise");
    List l = query.getResultList(); 
    
    return (List<Entreprise>)l;
  }
  
  
  public Entreprise persist(Entreprise entreprise){
	  entityManager.persist(entreprise);
	  return entreprise;
  }  
  
  public Entreprise update(Entreprise entreprise){
	  return entityManager.merge(entreprise);
  }
  
  public void remove(Entreprise entreprise){
	  if(!entityManager.contains(entreprise))
		  entreprise = entityManager.merge(entreprise);
	  entityManager.remove(entreprise);
  }
  
  
  //-----------------------------------------------------------------------------
}
