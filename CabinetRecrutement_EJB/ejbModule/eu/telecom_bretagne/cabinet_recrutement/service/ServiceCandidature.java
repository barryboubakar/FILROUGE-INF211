package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import eu.telecom_bretagne.cabinet_recrutement.data.dao.CandidatureDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature;

/**
 * Session Bean implementation class ServiceCandidature
 */
@Stateless
@LocalBean
public class ServiceCandidature implements IServiceCandidature {

     //-----------------------------------------------------------------------------
	  @EJB private CandidatureDAO         candidatureDAO;
    /**
     * Default constructor. 
     */
    public ServiceCandidature() {
        // TODO Auto-generated constructor stub
    }
	@Override
	public Candidature findById(Integer id) {
		
		return candidatureDAO.findById(id) ;
	}
	@Override
	public List<Candidature> findAll() {
		
		return  candidatureDAO.findAll();
	}
	@Override
	public List<Candidature> findBySecteurActiviteAndNiveauQualification(int idSecteurActivite, int idNiveauQualification) {
		
		return candidatureDAO.findBySecteurActiviteAndNiveauQualification(idSecteurActivite, idNiveauQualification);
	}
	@Override
	public Candidature persist(Candidature candidature) {
		
		return candidatureDAO.persist(candidature);
	}
	@Override
	public Candidature update(Candidature candidature) {
		
		return candidatureDAO.update(candidature);
	}
	@Override
	public void remove(Candidature candidature) {
		candidatureDAO.remove(candidature);
		
	}
}
