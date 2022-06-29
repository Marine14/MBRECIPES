# MBRECIPES
Dans le cadre du cours d’IOS nous avons réalisé une application de recettes, qui récupère dynamiquement ces dernières via l’API : Free Meal API | TheMealDB.com.

Toutes deux passionnées de nourriture, il nous semblait évident de développer quelque chose d’utile pour nous. En revanche, il a été plus difficile de trouver une API qui renvoie de bonnes informations. 
L’API que nous avons trouvé nous renvoie des recettes par catégories ou bien région, nous avons décidé de nous concentrer premièrement sur les catégories.
Pour commencer nous avons développé notre application avec des données brutes, une fois le visuel et la navigation mis au point, nous nous sommes attaqués à la partie récupération des données. 
En premier lieu, la récupération du contenu de la recette avec son nom, son image et ses instructions, nous avons tenté de récupérer les ingrédients mais il s’avère qu’ils sont stockés dans un tableau. Sous la forme ingrédient 1, ingrédient 2, ingrédient 3… Nous n’avons donc pas eu le temps de réaliser une collection view pour les afficher dans la page de la recette.
Sur cette page de détails nous avons également directement intégré un minuteur pour que l'utilisateur puisse plus facilement et rapidement réaliser ses recettes. 

Ensuite il a fallu récupérer les catégories de recettes que nous avons intégrées cette fois dans une collection view, de cette manière nous récupérons directement le nom et l’image des catégories sans se soucier de leur nombre ou leur nom.
Le workflow de l’application sera imagé dans la vidéo de démo, mais pour faire court, nous arrivons sur une page d’accueil avec l’ensemble des catégories, si nous choisissons une catégorie par un clic, cela nous renvoie la liste des recettes disponibles dans cette catégorie. Puis si nous sélectionnons une recette cela nous renvoie la page de détails de cette recette, avec son image, son nom et ses instructions, avec le minuteur.

Nous avons eu pas mal de difficultés pour prendre en main swift, car lors du développement nous nous sommes rendu compte que tout partait de dépendances c'est-à-dire que pour modifier un élément, ce dernier doit être modifié également dans tous les fichiers dans lesquels il apparaît. Ce qui rend compliqué les modifications, il faut bien connaître son projet pour pouvoir savoir les endroits à modifier.

Nous aurions aimés ajouter premièrement, les ingrédients, ce qui aurait été possible avec un peu plus de temps. 
Mais aussi avoir la possibilité de créer des favoris pour avoir une petite sélection de recettes à faire.

Finalement l’application peut se déployer, avec un peu de mal pour trouver un compte développeur. 

Marine : Ayant déjà fait du kotlin, je trouve que le Swift est plus compliqué pour les dépendances mais autrement la partie graphique nous permet d’avoir une bonne idée du rendu sans avoir à lancer le simulateur à chaque modification. 

Buket : Je n'ai jamais travaillé avec Swift et Xcode avant. Je pense que c'est une interface fun mais compliquée pour quelqu'un qui n'y est pas habitué et qui ne l'a jamais utilisé avant. J'ai beaucoup aimé pouvoir concevoir l’application avec des graphismes sur l'interface iPhone, et je pense que cela a facilité la partie codage. Je pense qu'il est très efficace de pouvoir faire correspondre le code que vous avez écrit avec une interface en même temps.


Ecran d’accueil de l’application 

Dans le cadre du cours d’IOS nous avons réalisé une application de recettes, qui récupère dynamiquement ces dernières via l’API : Free Meal API | TheMealDB.com.

Toutes deux passionnées de nourriture, il nous semblait évident de développer quelque chose d’utile pour nous. En revanche, il a été plus difficile de trouver une API qui renvoie de bonnes informations. 
L’API que nous avons trouvé nous renvoie des recettes par catégories ou bien région, nous avons décidé de nous concentrer premièrement sur les catégories.
Pour commencer nous avons développé notre application avec des données brutes, une fois le visuel et la navigation mis au point, nous nous sommes attaqués à la partie récupération des données. 
En premier lieu, la récupération du contenu de la recette avec son nom, son image et ses instructions, nous avons tenté de récupérer les ingrédients mais il s’avère qu’ils sont stockés dans un tableau. Sous la forme ingrédient 1, ingrédient 2, ingrédient 3… Nous n’avons donc pas eu le temps de réaliser une collection view pour les afficher dans la page de la recette.
Sur cette page de détails nous avons également directement intégré un minuteur pour que l'utilisateur puisse plus facilement et rapidement réaliser ses recettes. 

Ensuite il a fallu récupérer les catégories de recettes que nous avons intégrées cette fois dans une collection view, de cette manière nous récupérons directement le nom et l’image des catégories sans se soucier de leur nombre ou leur nom.
Le workflow de l’application sera imagé dans la vidéo de démo, mais pour faire court, nous arrivons sur une page d’accueil avec l’ensemble des catégories, si nous choisissons une catégorie par un clic, cela nous renvoie la liste des recettes disponibles dans cette catégorie. Puis si nous sélectionnons une recette cela nous renvoie la page de détails de cette recette, avec son image, son nom et ses instructions, avec le minuteur.

Nous avons eu pas mal de difficultés pour prendre en main swift, car lors du développement nous nous sommes rendu compte que tout partait de dépendances c'est-à-dire que pour modifier un élément, ce dernier doit être modifié également dans tous les fichiers dans lesquels il apparaît. Ce qui rend compliqué les modifications, il faut bien connaître son projet pour pouvoir savoir les endroits à modifier.

Nous aurions aimés ajouter premièrement, les ingrédients, ce qui aurait été possible avec un peu plus de temps. 
Mais aussi avoir la possibilité de créer des favoris pour avoir une petite sélection de recettes à faire.

Finalement l’application peut se déployer, avec un peu de mal pour trouver un compte développeur. 

Marine : Ayant déjà fait du kotlin, je trouve que le Swift est plus compliqué pour les dépendances mais autrement la partie graphique nous permet d’avoir une bonne idée du rendu sans avoir à lancer le simulateur à chaque modification. 

Buket : Je n'ai jamais travaillé avec Swift et Xcode avant. Je pense que c'est une interface fun mais compliquée pour quelqu'un qui n'y est pas habitué et qui ne l'a jamais utilisé avant. J'ai beaucoup aimé pouvoir concevoir l’application avec des graphismes sur l'interface iPhone, et je pense que cela a facilité la partie codage. Je pense qu'il est très efficace de pouvoir faire correspondre le code que vous avez écrit avec une interface en même temps.
