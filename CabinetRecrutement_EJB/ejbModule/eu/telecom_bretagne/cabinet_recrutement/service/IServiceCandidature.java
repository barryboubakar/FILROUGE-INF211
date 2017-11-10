package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.Remote;

import eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature;
import eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi;

@Remote
public interface IServiceCandidature {
	
	  public Candidature getCandidature(Integer id);
	
	  public List<Candidature> listeDesCandidatures();
	
	  public List<Candidature> listeDesCandidaturesPourUneOffre(OffreEmploi offre);
	  
	  public Candidature newCandidature(String nom, String prenom, Date date_naissance,String adresse_postale,String adresse_email,String cv,Integer niveauQualification,ArrayList<Integer> secteursActivite);
	  
	  public Candidature updateCandidature(int id,String nom, String prenom, Date date_naissance,String adresse_postale,String adresse_email,String cv,Integer idniveauQualification, ArrayList<Integer> secteursActivite);
	  
	  public void removeCandidature(int idCandidature);	  
	  
}
