package eu.telecom_bretagne.cabinet_recrutement.service;

import java.util.List;

import javax.ejb.Remote;

import eu.telecom_bretagne.cabinet_recrutement.data.model.SecteurActivite;

@Remote
public interface IServiceSecteurActivite {

	public SecteurActivite getSecteurActivite(Integer id);

	public List<SecteurActivite> listeDesSecteursActivite();
	  
}
