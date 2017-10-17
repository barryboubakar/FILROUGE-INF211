package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;

import javax.ejb.Remote;

import eu.telecom_bretagne.cabinet_recrutement.data.model.SecteurActivite;

@Remote
public interface IServiceSecteurActivite {

	public SecteurActivite findById(Integer id);

	public List<SecteurActivite> findAll();
	  
	public SecteurActivite persist(SecteurActivite secteur);
	  
	public SecteurActivite update(SecteurActivite secteur);
}
