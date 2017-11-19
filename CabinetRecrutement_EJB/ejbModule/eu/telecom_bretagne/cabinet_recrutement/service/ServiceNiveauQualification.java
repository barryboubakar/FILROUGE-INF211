package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import eu.telecom_bretagne.cabinet_recrutement.data.dao.EntrepriseDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.NiveauQualificationDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.model.NiveauQualification;

/**
 * Session Bean implementation class ServiceNiveauQualification
 */
@Stateless
@LocalBean
public class ServiceNiveauQualification implements IServiceNiveauQualification {

	 @EJB private NiveauQualificationDAO         niveauDAO;
    /**
     * Default constructor. 
     */
    public ServiceNiveauQualification() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public NiveauQualification getNiveauQualification(Integer id) {
		
		return niveauDAO.findById(id);
	}

	@Override
	public List<NiveauQualification> listeDesNiveauxQualifications() {
		return niveauDAO.findAll();
	}
	
	@Override
	public NiveauQualification newNiveauQualification(String intitule) {
		 NiveauQualification niveau = new NiveauQualification();
		 niveau.setIntitule(intitule);
		 return niveauDAO.persist(niveau);
	}
	
	@Override
	public NiveauQualification updateNiveauQualification(int id, String intitule) {
		NiveauQualification niveau = niveauDAO.findById(id);
		niveau.setIntitule(intitule);
		return niveauDAO.update(niveau);
	}

}
