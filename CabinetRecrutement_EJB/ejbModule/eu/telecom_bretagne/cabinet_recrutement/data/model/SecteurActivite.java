package eu.telecom_bretagne.cabinet_recrutement.data.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Set;
import static javax.persistence.FetchType.EAGER;


/**
 * The persistent class for the secteur_activite database table.
 * @author Aboubacar BARRY et Yohann LE GALL
 */
@Entity
@Table(name="secteur_activite")
@NamedQuery(name="SecteurActivite.findAll", query="SELECT s FROM SecteurActivite s")
public class SecteurActivite implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="SECTEUR_ACTIVITE_IDSECTEURACTIVITE_GENERATOR", sequenceName="SECTEUR_ACTIVITE_ID_SECTEUR_ACTIVITE_SEQ", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SECTEUR_ACTIVITE_IDSECTEURACTIVITE_GENERATOR")
	@Column(name="id_secteur_activite")
	private Integer idSecteurActivite;

	private String intitule;

	//bi-directional many-to-many association to Candidature
	@ManyToMany(fetch = EAGER)
	@JoinTable(
		name="assoc_secteur_candidature"
		, joinColumns={
			@JoinColumn(name="secteur_activite_id")
			}
		, inverseJoinColumns={
			@JoinColumn(name="candidature_id")
			}
		)
	private Set<Candidature> candidatures;

	//bi-directional many-to-many association to OffreEmploi
	@ManyToMany(fetch = EAGER)
	@JoinTable(
		name="assoc_secteur_offre"
		, joinColumns={
			@JoinColumn(name="secteur_activite_id")
			}
		, inverseJoinColumns={
			@JoinColumn(name="offre_emploi_id")
			}
		)
	private Set<OffreEmploi> offreEmplois;

	public SecteurActivite() {
	}

	public Integer getIdSecteurActivite() {
		return this.idSecteurActivite;
	}

	public void setIdSecteurActivite(Integer idSecteurActivite) {
		this.idSecteurActivite = idSecteurActivite;
	}

	public String getIntitule() {
		return this.intitule;
	}

	public void setIntitule(String intitule) {
		this.intitule = intitule;
	}

	public Set<Candidature> getCandidatures() {
		return this.candidatures;
	}

	public void setCandidatures(Set<Candidature> candidatures) {
		this.candidatures = candidatures;
	}

	public Set<OffreEmploi> getOffreEmplois() {
		return this.offreEmplois;
	}

	public void setOffreEmplois(Set<OffreEmploi> offreEmplois) {
		this.offreEmplois = offreEmplois;
	}

}