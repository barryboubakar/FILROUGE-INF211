package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import eu.telecom_bretagne.cabinet_recrutement.data.dao.CandidatureDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.EntrepriseDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.NiveauQualificationDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.OffreEmploiDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.dao.SecteurActiviteDAO;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature;
import eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise;
import eu.telecom_bretagne.cabinet_recrutement.data.model.NiveauQualification;
import eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi;
import eu.telecom_bretagne.cabinet_recrutement.data.model.SecteurActivite;



/**
 * Session Bean implementation class ServiceOffreEmploi
 */
@Stateless
@LocalBean
public class ServiceOffreEmploi implements IServiceOffreEmploi {

    /**
     * Default constructor. 
     */
	@EJB 
	private OffreEmploiDAO         offreDAO;
	@EJB
	private EntrepriseDAO entrepriseDAO;
	@EJB
	private NiveauQualificationDAO niveauDAO;
	@EJB
	private SecteurActiviteDAO secteurDAO;
	@EJB
	private CandidatureDAO candidatureDAO;
	
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
		
		// On récupère la candidature
		Candidature candidature = candidatureDAO.findById(idCandidature); 
		
		// On récupère son Niveau de Qualification et ses Secteurs D'activite a faire matcher
		int idNiveauQualification = candidature.getNiveauQualification().getIdNiveauQualification();
		Set<SecteurActivite> secteursActivite = candidature.getSecteurActivites();
		
		
		List<OffreEmploi> offresEmploi = new LinkedList<OffreEmploi>();
		int idSecteurActivite;
		
		for(SecteurActivite secteurActivite : secteursActivite){
			idSecteurActivite = secteurActivite.getIdSecteurActivite();
			offresEmploi.addAll( offreDAO.findBySecteurActiviteAndNiveauQualification(idSecteurActivite, idNiveauQualification) );
		}
		return offresEmploi;

	}

	@Override
	public List<OffreEmploi> listeDesOffres() {
		return offreDAO.findAll();
	}

	@Override
	public OffreEmploi newOffreEmploi(String titre, String descriptif_mission, String profil_recherche, Integer niveauQualification, ArrayList<Integer> secteurActivite, Entreprise e)  {
		
	//--[ Création de l'offre et remplissage ]--
		OffreEmploi offre = new OffreEmploi();
		
		offre.setTitre(titre);
		offre.setDescriptifMission(descriptif_mission);
		offre.setProfilRecherche(profil_recherche);
		Date date = new Date();
		offre.setDateDepot(date);
		
	// --[ Traitement du Niveau de Qualification ]--
		
		NiveauQualification n;
		n = niveauDAO.findById(niveauQualification);
		offre.setNiveauQualification(n);
		n.addOffreEmploi(offre);
		
	//-- Persistance temporaire de l'offre --
	//offre = offreDAO.persist(offre);
		
	//--[ Traitement de secteur d'Activités ]--
		SecteurActivite s;
		Set<SecteurActivite> set = new HashSet<SecteurActivite>();
		
		//-- On recupère chaque secteur d'activité et on ajoute l'offre dedans puis on ajoute le secteur à l'offre
			for(int j=0;j<secteurActivite.size();j++){
				s = secteurDAO.findById(secteurActivite.get(j));
				s.getOffreEmplois().add(offre);
				set.add(s);
			}
			offre.setSecteurActivites(set); 
		
	//--[ Traitement de secteur d'Activités ]--	
	    offre.setEntreprise(e);
			
			
		return offreDAO.persist(offre);
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
