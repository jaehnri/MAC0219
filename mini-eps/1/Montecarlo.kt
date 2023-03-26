fun main() {
    val n = 10000000
    var acertos = 0.0

    for (i in 1..n) {
        val x = Math.random()
        val y = Math.random()

        if (x*x+y*y < 1.0) {
            acertos++
        }
    }

    println("${4*acertos/n}")
}