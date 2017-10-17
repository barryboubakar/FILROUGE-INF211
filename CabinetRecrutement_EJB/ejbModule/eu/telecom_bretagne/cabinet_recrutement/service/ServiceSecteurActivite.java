package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import eu.telecom_bretagne.cabinet_recrutement.data.dao.EntrepriseDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.SecteurActiviteDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.model.SecteurActivite;

/**
 * Session Bean implementation class ServiceSecteurActivite
 */
@Stateless
@LocalBean
public class ServiceSecteurActivite implements IServiceSecteurActivite {

    /**
     * Default constructor. 
     */
	@EJB private SecteurActiviteDAO secteurDAO;
	
    public ServiceSecteurActivite() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public SecteurActivite findById(Integer id) {
		return secteurDAO.findById(id);
	}

	@Override
	public List<SecteurActivite> findAll() {
		return secteurDAO.findAll();
	}

	@Override
	public SecteurActivite persist(SecteurActivite secteur) {
		return secteurDAO.persist(secteur);
	}

	@Override
	public SecteurActivite update(SecteurActivite secteur) {
		return secteurDAO.update(secteur);
	}

}
