package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import eu.telecom_bretagne.cabinet_recrutement.data.dao.OffreEmploiDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature;
import eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi;



/**
 * Session Bean implementation class ServiceOffreEmploi
 */
@Stateless
@LocalBean
public class ServiceOffreEmploi implements IServiceOffreEmploi {

    /**
     * Default constructor. 
     */
	@EJB private OffreEmploiDAO         offreDAO;
	
    public ServiceOffreEmploi() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public OffreEmploi getOffreEmploi(Integer id) {
		return offreDAO.findById(id);
	}

	@Override
	public List<OffreEmploi> listeDesOffresPourUneEntreprise(int idEntreprise) {
		return offreDAO.findByEntreprise(idEntreprise);
	}

	@Override
	public List<OffreEmploi> listeDesOffresPourUneCandidature(int idCandidature) {
		return offreDAO.findAll(); //a faire
	}

	@Override
	public List<OffreEmploi> listeDesOffres() {
		return offreDAO.findAll();
	}

	@Override
	public OffreEmploi newOffreEmploi(OffreEmploi offreEmploi) {
		return offreDAO.persist(offreEmploi);
	}

	@Override
	public OffreEmploi updateOffreEmploi(OffreEmploi offreEmploi) {
		return offreDAO.update(offreEmploi);
	}

	@Override
	public void removeOffreEmploi(OffreEmploi offreEmploi) {
		offreDAO.remove(offreEmploi);
	}

    
}
