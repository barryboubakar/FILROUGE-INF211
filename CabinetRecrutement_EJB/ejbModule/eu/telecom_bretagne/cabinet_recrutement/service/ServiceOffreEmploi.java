package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import eu.telecom_bretagne.cabinet_recrutement.data.dao.OffreEmploiDAO;
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
	public OffreEmploi findById(Integer id) {
		return offreDAO.findById(id);
	}

	@Override
	public List<OffreEmploi> findByEntreprise(int idEntreprise) {
		return offreDAO.findByEntreprise(idEntreprise);
	}

	@Override
	public List<OffreEmploi> findBySecteurActiviteAndNiveauQualification(int idSecteurActivite, int idNiveauQualification) {
		return offreDAO.findBySecteurActiviteAndNiveauQualification(idSecteurActivite, idNiveauQualification);
	}

	@Override
	public List<OffreEmploi> listeDesOffres() {
		return offreDAO.findAll();
	}

	@Override
	public OffreEmploi persist(OffreEmploi offreEmploi) {
		return offreDAO.persist(offreEmploi);
	}

	@Override
	public OffreEmploi update(OffreEmploi offreEmploi) {
		return offreDAO.update(offreEmploi);
	}

	@Override
	public void remove(OffreEmploi offreEmploi) {
		offreDAO.remove(offreEmploi);
	}

    
}
