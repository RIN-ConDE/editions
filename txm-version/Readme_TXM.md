# Versions TXM du projet ConDÉ

Pour des raisons de compatibilité et d'ouverture du corpus ConDÉ au plus grand nombre, nous proposons une version compatible [TXM](http://textometrie.ens-lyon.fr/?lang=fr) des fichiers XML. Ceux-ci sont à importer via la commande "XML-TEI TXM" du logiciel (Fichier > Importer). Il est ensuite possible d'utiliser les fonctionnalités du logiciel pour faire des recherches fines dans les textes, en recherchant les attributs correspondant au mot-forme (*form*), au lemme (*lemma*) ou à la catégorie morpho-syntaxique (*pos*, selon le référentiel PRESTO).

Il est également possible de lire les corpus directement via le logiciel, si jamais le site du projet ConDÉ est inacessible, ou si l'on désire travailler hors-ligne. La compatibilité a impliqué une modifcation de la structure XML-TEI du corpus. À présent, un mot a cette structure :

```<w>
<txm:form>deux</txm:form>
<txm:ana type="#n">143954</txm:ana>
<txm:ana type="#pos">Mc</txm:ana>
<txm:ana type="#lemma">DEUX</txm:ana></w>
```

Le nom de domaine est déclaré dans la balise TEI en ouverture de document `xmlns:txm="http://textometrie.org/1.0"`, et il a été rajouté un élément `classDecl` dans le teiheader :

```<classDecl>
				
				<taxonomy id="pos"><bibl><title>Catégories grammaticale du modèle <ref target="http://presto.ens-lyon.fr/wp-content/uploads/2014/05/%C3%89tiquettes_Presto-2014-10-13.pdf">PRESTO (ANR-DFR, ENS Lyon)</ref></title>
					
					<title xml:lang="eng"><ref target="http://presto.ens-lyon.fr/wp-content/uploads/2014/05/%C3%89tiquettes_Presto-2014-10-13.pdf">PRESTO (ANR-DFR, ENS Lyon)</ref>POS-tagging model</title>
					
				</bibl>
				</taxonomy>
				
				<taxonomy id="lemma"><bibl><title>Lemmes selon les standards des dictionnaires français, tels l'<ref target="atilf.atilf.fr/">ATILF</ref> et le <ref target="http://www2.atilf.fr/dmf/">DMF</ref> pour l'ancienne langue</title>
					
					<title xml:lang="eng">Standard French lemmas, on part with the French dictionnaries such as <ref target="atilf.atilf.fr/">ATILF</ref> and <ref target="http://www2.atilf.fr/dmf/">DMF</ref> for medieval French</title>
					
				</bibl>
				</taxonomy>
				
			</classDecl>```
			
