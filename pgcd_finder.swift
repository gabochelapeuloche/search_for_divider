func div_x (x: Int) -> [Int] {
    
    // i servira à se déplacer dans les nombres qui peuvent être concerné par ce que l’on cherche et on démarre notre tableau par notre nombre qui se divise lui-même car pour des raisons d’optimisation il ne sera pas compris entre les bornes de i.
    var i = x/2
    var div_x_arr : [Int] = [x]
    
    //si notre nombre est pair alors on observe tous les entiers entre 0 (non compris pour éviter l’exception du /0 et x/2 sachant que sont plus grand diviseur excepté lui-même est lui-même divisé par deux et dès que l’on trouve un nombre qui ne donne pas de reste lorsqu’il divise x on l’ajoute à notre tableau. Et on incrémente i de -1 à chaque fois
    if x % 2 == 0 {
        while i > 0 {
            if x % i == 0 {
                div_x_arr.append(i)
            }
            i -= 1
        }
        //De même si x est un impair, son plus grand diviseur est forcément inférieur ou égal à lui-même divisé par trois de plus un impair ne peut être divisé par un nombre pair (cela impliquerait une possible divisibilité par deux non-sens) donc on incrémente i de -2.
    } else {
        i = x/3
        while i > 0 {
            if x % i == 0 {
                div_x_arr.append(i)
            }
            i -= 2
        }
    }
    return div_x_arr
}
//maintenant on peut déterminer les diviseurs de deux nombres, ne reste plus qu’à trouver le plus grands qu’ils sont en commun.

//Pas opti mais je n’arrivais pas à sortir de la boucle for dès la première égalité et c’était plus court à écrire qu’une boucle While

func search_for_pgcd (a: Int, b: Int) -> Int {
    var arr_one : [Int] = div_x(x: a)
    var arr_two : [Int] = div_x(x: b)
    var pgcd : [Int] = []
    
        for i in 0 ... arr_one.count - 1 {
            for j in 0 ... arr_two.count - 1 {
                if arr_one[i] == arr_two[j] {
                    pgcd.append(arr_one[i])
                }
            }
        }
    return pgcd[0]
}
