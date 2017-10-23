package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import eu.telecom_bretagne.cabinet_recrutement.data.dao.CandidatureDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature;
import eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi;

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
	public Candidature getCandidature(Integer id) {
		
		return candidatureDAO.findById(id) ;
	}
	@Override
	public List<Candidature> listeDesCandidatures() {
		
		return  candidatureDAO.findAll();
	}
	@Override
	public List<Candidature> listeDesCandidaturesPourUneOffre(OffreEmploi offre) {
		
		List candidaturesRETURN = null;
		for(Candidature can : candidatureDAO.findAll()){
			//if(can);
		}
		
		return candidaturesRETURN;
	}
	@Override
	public Candidature newCandidature(Candidature candidature) {
		
		return candidatureDAO.persist(candidature);
	}
	@Override
	public Candidature updateCandidature(Candidature candidature) {
		
		return candidatureDAO.update(candidature);
	}
	@Override
	public void removeCandidature(Candidature candidature) {
		candidatureDAO.remove(candidature);
		
	}
}
