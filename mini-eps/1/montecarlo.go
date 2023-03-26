package main

import (
	"fmt"
	"math/rand"
)

func main() {
	acertos := 0.0
	N := 10000000.0

	for i := 0.0; i < N; i++ {
		x := rand.Float64()
		y := rand.Float64()

		if x*x+y*y <= 1.0 {
			acertos++
		}
	}

	fmt.Printf("%f", 4.0*acertos/N)
}
