# Cite this repository

```Larrivée, Pierre et Mathieu Goux (dir.), 2021, corpus ConDÉ, Caen, CRISCO EA4255, version ******. URL : https://github.com/RIN-ConDE/editions/```

Current version is ```"alpha" 0.4```. Version is mentionned in `//TEI/teiHeader/fileDesc/editionStmt/edition`.
La version actuelle est ```"alpha" 0.4```. La version est mentionnée dans les `//TEI/teiHeader/fileDesc/editionStmt/edition`.

# Repository description

This repository contains the database produced by the RIN ConDÉ project. The project, funded by the Normandy Region and based in the Caen and Rouen universities, started in december 2018. It is lead by :
* main researcher: _Pr. Pierre Larrivée_,
* post-doctoral researcher: _Mathieu Goux_ (until 2021) and _Zinaïda Geylickman_ (2021),
* research engineers: _Gwenaëlle Callemein_ (until 2020) and _Prune Decoux_ (since 2020),
* study engineer: _Morgane Pica_.

We aim to establish a TEI-XML database of Norman customary law, from 12th to 18th century, with lemma and part-of-speech annotation, as well as the internal network of references.

This repository contains three versions of the files:
* a "base" TEI-XML version, intended for researchers who would like to explore the full encoding produced by the team,
* a "lighter"/"simplified" TEI-XML version derived from the previous one for practical reasons, containing the version currently displayed on the project website: all words are modernized and the facsimile information is absent,
* a [TXM-compatible](<http://textometrie.ens-lyon.fr/?lang=en>) TEI-XML version , to be used with the Textometrie project software for compatibility purposes,
* to be added: a PDF version of the texts, readable and searchable on any PDF viewer.
  
As of May 4. 2021, this repository also contains, inside the "tools" folder, the XSLTs transforming the 'base' version into 'ligher' or 'txm' versions.

Not all typos were spotted upon HTR revision. If you would like to report a typo, you're welcome to either use the usual GitHub channels, or write to 'morgane.pica'<at>'unicaen.fr'. In the latter case, please include the name of the work, as well as the full number of the passage, if you're working with PDF files, or the @xml:id value if you're working on the TEI-XML files.

The "base" encoding includes a logical structuration of the text in parts, chapters and sections as well as links with the original structuration of the facsimile images. One can therefore easily reconstruct a facsimile display of the text. We have also included <choice> elements with original and modernized written forms. We intended these informations to allow use of the data by as many disciplines and purposes as possible.

The links to the available IIIF imges have not been implemented yet: the links are still showing the name of the images used. If you wish to use the graphic information on the facsimile, please contact 'morgane.pica'<at>'unicaen.fr' or  'mathieu.goux'<at>'unicaen.fr' and you will be given access to the corresponding cloud folders or Transkribus collections, so you can download the correctly named and ordered images.

--------------------------------------------------------

# Description du dépôt

Ce repository contient la base de données produite par le projet RIN ConDÉ. Ce projet, financé par la Région Normandie et basé aux universités de Caen et Rouen, a commencé en décembre 2018. Il est mené par :
* porteur du projet : _Pr. Pierre Larrivée_,
* post-doctorant : _Mathieu Goux_ et _Zinaïda Geylickman (2021)_,
* ingénieures de recherche : _Gwenaëlle Callemein_ (until 2020) and _Prune Decoux_ (since 2020),
* ingénieure d'étude : _Morgane Pica_.

Notre but est d'établir une base de données XML-TEI de la Coutume de Normandie, du 12e au 18e siècle, avec lemmatisation, annotation morpho-syntaxique et du réseau interne de références.

Ce repository contient trois versions des fichiers :
* une version de "base" en XML-TEI, pensée pour les chercheurs souhaitant explorer l'encodage complet produit par l'équipe,
* une version "simplifiée"/"lighter" en XML-TEI, dérivée de la précédente pour des raisons de taille des fichiers, contenant la version actuellement affichée sur le site du projet : tous les mots sont modernisés et les informations sur les facsimiles sont absentes,
* une version compatible avec le logiciel de textométrie [TXM](http://textometrie.ens-lyon.fr/) en XML-TEI, pour les chercheurs utilisant ce logiciel de textométrie en particulier,
* à venir : une version PDF des textes, pouvant être lue et recherchée sur tout lecteur de PDF.
  
Depuis le 4 mai 2021, le dépôt contient également dans le dossier "tools" les transformations XSL permettant de produire, depuis la version 'base', des versions 'lighter' et 'txm'.

Toutes les coquilles n'ont pas été trouvées à la révision de l'HTR. Si vous souhaitez signaler une coquille, vous pouvez soit utiliser les fonctionnalités GitHub habituelles, ou écrire à 'morgane.pica'<at>'unicaen.fr' ou  'mathieu.goux'<at>'unicaen.fr'. Dans le second cas, nous vous remercions de bien vouloir inclure le titre de l'œuvre, ainsi que le numéro complet du passage, si vous travaillez sur PDF, ou la valeur du @xml:id si vous travaillez sur les fichiers XML-TEI.

L'encodage de "base" inclut une structuration logique du texte en parties, chapitres et sections, ainsi que les liens vers la structuration originelle des images facsimiles. L'on peut ainsi facilement reconstruire un affichage facsimile du texte. Nous avons également inclus des éléments <choice> avec les formes originelles et modernisées. Nous pensons que ces informations permettront l'usage de ces données pour autant de disciplines et buts que possible.

Les liens vers les images IIIF disponibles ne sont pas encore implémentés : les liens montrent toujours le nom des images utilisées. En attendant les liens finaux, si vous souhaitez utiliser les informations graphiques, contactez 'morgane.pica'<at>'unicaen.fr' or  'mathieu.goux'<at>'unicaen.fr' qui vous donneront accès aux dossiers de cloud ou aux collections Transkribus correspondants, pour que vous puissiez télécharger les images correctement nommées et organisées.

 
# Vers le site du projet - To the project website
  
[À venir -- soon]
