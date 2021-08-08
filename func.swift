// Brute Force

// All Nb 

func div_x (x: Int) -> [Int]{
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
