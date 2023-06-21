package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

type Product struct {
	ID   string `json:"id"`
	NAME string `json:"name"`
}

var product = []Product{
	{
		ID:   "10",
		NAME: "Gonic",
	},
}

func main() {
	router := gin.Default()
	router.GET("/", getProduct)
	router.Run("0.0.0.0:8080")
}

func getProduct(p *gin.Context) {

	p.IndentedJSON(http.StatusOK, product)
}
