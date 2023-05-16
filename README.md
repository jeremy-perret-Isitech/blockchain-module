## TP Blockchain

Il y à 3 projets dans ce repo, ce sont les travaux que j'ai réalisé cette semaine.<br><br>
Le projet "JeremyToken" est le premier projet qui consistais à déployer son propre token.<br>
Le projet "Truffle" visant à essayer de deployé une blockchain en local et à intéragir avec depuis une app front (ne fonctionne pas)
<br>
Le dernier projet nommé "React-box" est le dernier projet sur lequel j'ai travaillé pour l'évaluation.
<br><br>
J'ai utiliser la technologie de la blockchain pour faire un système de vote.<br>
Pour ce projet j'ai réalisé deux contrats.<br>
Le premier est un contrat nommé `VoteContract` permet de recevoir des votes en faveur ou contre un projet de lois. (J'y utilise ici pour des lois mais ce peut être utilisé pour n'importe quel autre domaine).
<br>
Voici une liste des méthodes associé à ce contrat avec leur cas d'utilité :
-  `constructor` -> le constructeur prend en parametre le nombre de jour durant laquel les votes peuvent être soumis, le nom de la loi, et une description de cette loi.
- `canVote` -> est une méthode privé pouvant être utilisé uniquement dans le contrat, qui permet de tester si le vote soumis par une  adresse peut être pris en compte (par défault une adresse ne peut voté qu'une fois par loi).
- `IncAdoptLaw` -> permet d'ajouter une voix pour accepter la loi.
- `IncRejectLaw` -> permet d'ajouter une voix pour refuser la loi.
- `getEndVoteDateTimestamp` -> permet de récupérer la date de fin de vote au format `Timestamp`.
- `getVotes` -> permet de récupérer le nombre de voix pour ou contre la loi sous la forme d'un object :
    ```JSON
    { 
        "adoptLaw": nb_voix_pour,
        "rejectLaw": nb_voix_contre
    }
    ```
- `toggleVoteRestriction` -> permet de limité ou non si une seul adresse peut faire plusieurs votes.
- `getLawTitle` -> permet de récupérer le titre de la loi.
- `getLawDescription` -> permet de récupérer la description de la loi.

Le second contrat nommé `LawCreator` est un contrat qui permet de créer des contrats `VoteContract` dans ce contexte cela permettrait d'avoir plusieurs projt de lois pour lesquel voté, avec la possibilité de pouvoir en créer de nouveau.<br>
Mais je n'ai pas réussi à le tester et je doute que ce soit fonctionnel.<br>

Toutes les méthodes développé du contrats `VoteContract` fonctionne mais il manque quelques fonctionnalité comme le refus des votes si la date de fin de vote à été atteinte, etc...
Malheureusement l'app React en front n'exploite pas encore toutes les fonctions liée à ce contrat, pour l'instant il est uniquement possible de consulter les infos du contrat ainsi que le nombre de vote qu'il à reçut.
J'ai néanmoins put tester que tout foncitonne correctement depuis Remix.
