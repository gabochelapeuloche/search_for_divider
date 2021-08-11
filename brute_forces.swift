// Déterminer les diviseurs d'un entier.

// Brute Force

// Nb > 0

/* première idée parcourir [O;x] avec i en testant le reste de la division de x par i si le reste est nul c'est un diviseur alors on le stocke dans notre tableau */

func div_x_fst (x: Int) -> [Int]{
    var i = x
    var div_x_arr : [Int] = []
    while i > 0 {
        if x % i == 0 {
            div_x_arr.append(i)
        }
        i -= 1
    }
    return div_x_arr
}

// All Nb 

/* On change l'intervalle pour chercher les diviseurs négatifs. Une exeption est créée pour zéro (ne peut pés être diviseur */

func div_x_scnd (x: Int) -> [Int]{
    var i = x
    var div_x_arr : [Int] = []
    while i >= -x {
        if i == 0 {
        } else if x % i == 0 {
            div_x_arr.append(i)
        }
        i -= 1
    }
    return div_x_arr
}

// BETTER BRUTE FORCE

/* On sait que le premier diviseur après un ne peut être que deux (ou un nombre plus grand) alors on ajoute (-x) comme premier elt du tableau puis on commence à (-x/2)  (opposé du pénultième diviseur pour finir au pénultième) ainsi l'intervalle ans lequel les nombres sont pris est amputé de 2 * (x-x/2) = x et on le parcours plus vite.
 Il faut penser a ajouter x a la fin du tableau vu qu'il n'est pas ajouté dans la boucle while */

func div_x_thrd (x: Int) -> [Int]{
    var i = -x/2
    var div_x_arr : [Int] = [-x]
    while i <= x/2 {
        if i == 0 {
        } else if x % i == 0 {
            div_x_arr.append(i)
        }
        i += 1
    }
    div_x_arr.append(x)
    return div_x_arr
}

// Even Better Brute force

/* toujours même principe mais on remarque qu'il y à symétrie par rapport à zéro dans le tableau donc on à besoin d'observer qu'une moitié puis remplir le tableau de l'opposé d ses elts donne un tableau qui n'est pas trié 
 */

func div_x_frth (x: Int) -> [Int]{
    var i = -x/2
    var div_x_arr : [Int] = [-x]
    while i < 0 {
        if x % i == 0 {
            div_x_arr.append(i)
        }
        i += 1
    }
    for e in div_x_arr {
        div_x_arr.append(-e)
    }
    return div_x_arr
}

// Migth be better than the fourth

/* Pas suffisement tester pour affirmer qu'il n'y a pas de bug mais flm, si c'est un impair il ne peut pas avoir de diviseur pair à priori (x = 2k+1) donc on peut incrémenter i de deux en observant que les impairs, aussi le premier diviseur d'un impair autre que 1 est trois au moins donc notre borne inf est -x/3 */

func div_x_ffth (x: Int) -> [Int] {
    
    var i = -x/2
    var div_x_arr : [Int] = [-x]
    
    if x % 2 == 0 {
        while i < 0 {
            if x % i == 0 {
                div_x_arr.append(i)
            }
            i += 1
        }
        for e in div_x_arr {
            div_x_arr.append(-e)
        }
    } else {
        i = -x/3
        while i < 0 {
            if x % i == 0 {
                div_x_arr.append(i)
            }
            i += 2
        }
        for e in div_x_arr {
            div_x_arr.append(-e)
        }
    }
    return div_x_arr
}


/*
div_x_fst(x: 10000)
div_x_scnd(x: 10000)
div_x_thrd(x: 10000)
div_x_frth(x: 10000)
div_x_ffth(x: 10000)
*/

/* 
1: 25/10K ops
2: 50/20K ops
3: 48/10K ops
4: 24/5K/25 ops
*/
