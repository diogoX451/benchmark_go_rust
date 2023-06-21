package main

import (
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var db *gorm.DB
var err error

type Product struct {
	ID          string `json:"id"`
	NAME        string `json:"name"`
	PRICE       string `json:"price"`
	DESCRIPTION string `json:"description"`
}

func init() {
	if err := godotenv.Load(); err != nil {
		panic(".Env is not loaded")
	}

	connect()
}

func connect() {
	db, err = gorm.Open(postgres.Open(os.Getenv("DB_DNS")), &gorm.Config{})

	if err != nil {
		panic(err)
	}
}

func main() {
	router := gin.Default()
	router.GET("/", getProduct)
	router.Run("173.30.0.2:8000")
}

func getProduct(p *gin.Context) {
	var product []Product
	err := db.Raw("SELECT * FROM products").Scan(&product).Error

	if err != nil {
		p.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
	}

	p.IndentedJSON(http.StatusOK, product)
}
