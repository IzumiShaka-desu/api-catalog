package routes

import (
	"api-catalog/src/controllers"
	"fmt"
	"os"

	"github.com/gin-gonic/gin"
)

func Routes() {
	route := gin.Default()
	route.Static("/image", "./image")
	// route.POST("/todo", controllers.CreateTodo)
	route.GET("/product", controllers.GetAllProduct)
	route.GET("/product/:id_product", controllers.GetProduct)
	route.PATCH("/product/:id_product", controllers.UpdateProduct)
	route.GET("/product/search", controllers.SearchProduct)
	// route.DELETE("/todo/:idTodo", controllers.DeleteTodo)
	hostPorts := os.Getenv("HOST_PORT")
	hostName := os.Getenv("HOST_NAME")
	addr := fmt.Sprintf("%s:%s", hostName, hostPorts)
	route.Run(addr)
}
