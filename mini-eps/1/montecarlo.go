package main

import (
	"fmt"
	"hash/maphash"
	"math/rand"
)

func main() {
	acertos := 0.0
	N := 10000000.0
	r := rand.New(rand.NewSource(int64(new(maphash.Hash).Sum64())))

	for i := 0.0; i < N; i++ {
		x := r.Float32()
		y := r.Float32()

		if x*x+y*y <= 1.0 {
			acertos++
		}
	}

	estimatedPi := 4.0 * acertos / N
	fmt.Printf("%f", estimatedPi)
}
