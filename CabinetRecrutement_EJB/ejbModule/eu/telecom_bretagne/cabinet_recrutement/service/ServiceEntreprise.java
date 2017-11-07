package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.jws.WebService;

import eu.telecom_bretagne.cabinet_recrutement.data.dao.EntrepriseDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise;

/**
 * Session Bean implementation class ServiceEntreprise
 * @author Philippe TANGUY
 */
@Stateless
@LocalBean
public class ServiceEntreprise implements IServiceEntreprise
{
  //-----------------------------------------------------------------------------
  @EJB private EntrepriseDAO         entrepriseDAO;
  //-----------------------------------------------------------------------------
  /**
   * Default constructor.
   */
  public ServiceEntreprise()
  {
    // TODO Auto-generated constructor stub
  }
  //-----------------------------------------------------------------------------
  @Override
  public Entreprise getEntreprise(int id)
  {
    return entrepriseDAO.findById(id);
  }
  //-----------------------------------------------------------------------------
  @Override
  public List<Entreprise> listeDesEntreprises()
  {
    return entrepriseDAO.findAll();
  }
  //-----------------------------------------------------------------------------
	@Override
	public Entreprise newEntreprise(String nom,String adresse_postale,String descriptif) {
		  Entreprise entreprise = new Entreprise();
	      entreprise.setAdressePostale(adresse_postale);
	      entreprise.setNom(nom);
	      entreprise.setDescriptif(descriptif);
	      
	      return entrepriseDAO.persist(entreprise);
	}
	@Override
	public Entreprise updateEntreprise(Entreprise entreprise) {
		return entrepriseDAO.update(entreprise);
	}
	@Override
	public void removeEntreprise(Entreprise entreprise) {
		entrepriseDAO.remove(entreprise);
	}
}
