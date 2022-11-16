package controllers

import (
	"net/http"

	"api-catalog/src/config"
	"api-catalog/src/models"

	"github.com/gin-gonic/gin"
	"github.com/spf13/cast"
	"gorm.io/gorm"
)

var db *gorm.DB = config.ConnectDB()

type productRequest struct {
	// TypeBattery int    `json:"type_battery"`
	NamaProduct string `json:"nama_product"`
	DescProduct string `json:"desc_product"`
	// Thumbnail   string `json:"thumbnail_product"`
	// Dimension   string `json:"dimension"`
}

type productResponse struct {
	productRequest
	IdProduct int64 `json:"id_product"`
}

// func CreateTodo(context *gin.Context) {
// 	var data productRequest

// 	if err := context.ShouldBindJSON(&data); err != nil {
// 		context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
// 		return
// 	}

// 	todo := models.Todo{}
// 	todo.Name = data.Name
// 	todo.Description = data.Description

// 	result := db.Create(&todo)
// 	if result.Error != nil {
// 		context.JSON(http.StatusBadRequest, gin.H{"error": "Something went wrong"})
// 		return
// 	}

// 	var response todoResponse
// 	response.ID = todo.ID
// 	response.Name = todo.Name
// 	response.Description = todo.Description

// 	context.JSON(http.StatusCreated, response)
// }

func GetAllProduct(context *gin.Context) {
	var product []models.Product
	//user can filter based on id_tipe_battery or nama_tipe_battery
	id_tipe_battery := context.Query("battery_type_id")
	nama_tipe_battery := context.Query("battery_type_name")
	//check is query id_tipe_battery or nama_tipe_battery is empty
	if id_tipe_battery != "" && nama_tipe_battery != "" {
		err := db.Raw("SELECT product.*,tipe_battery.nama_tipe_battery FROM `product` INNER JOIN tipe_battery on tipe_battery.id_tipe_battery=product.id_tipe_battery where product.id_tipe_battery = ? AND tipe_battery.nama_tipe_battery = ?", id_tipe_battery, nama_tipe_battery).Find(&product)
		if err.Error != nil {
			context.JSON(http.StatusBadRequest, gin.H{"error": "Error getting data"})
			return
		}
	} else if id_tipe_battery != "" {
		err := db.Raw("SELECT product.*,tipe_battery.nama_tipe_battery FROM `product` INNER JOIN tipe_battery on tipe_battery.id_tipe_battery=product.id_tipe_battery where product.id_tipe_battery = ?", id_tipe_battery).Find(&product)
		if err.Error != nil {
			context.JSON(http.StatusBadRequest, gin.H{"error": "Error getting data"})
			return
		}

	} else if nama_tipe_battery != "" {
		err := db.Raw("SELECT product.*,tipe_battery.nama_tipe_battery FROM `product` INNER JOIN tipe_battery on tipe_battery.id_tipe_battery=product.id_tipe_battery where tipe_battery.nama_tipe_battery = ?", nama_tipe_battery).Find(&product)
		if err.Error != nil {
			context.JSON(http.StatusBadRequest, gin.H{"error": "Error getting data"})
			return
		}

	} else {
		err := db.Find(&product)
		if err.Error != nil {
			context.JSON(http.StatusBadRequest, gin.H{"error": "Error getting data"})
			return
		}

	}

	// err := db.Find(&product)
	// if err.Error != nil {
	// 	context.JSON(http.StatusBadRequest, gin.H{"error": "Error getting data"})
	// 	return
	// }

	context.JSON(http.StatusOK, gin.H{
		"status":  "200",
		"message": "Success",
		"data":    product,
	})

}
func SearchProduct(context *gin.Context) {
	var product []models.Product
	//query q to search based on nama_product and desc_product
	q := context.Query("q")

	err := db.Where("nama_product LIKE ? OR desc_product LIKE ?", "%"+q+"%", "%"+q+"%").Find(&product)
	// err := db.Where("nama_product LIKE ?", "%"+context.Query("q")+"%").Find(&product)
	if err.Error != nil {
		context.JSON(http.StatusNotFound, gin.H{"error": "Product not found"})
		return
	}

	context.JSON(http.StatusOK, gin.H{
		"status":  "200",
		"message": "Success",
		"data":    product,
	})

}

func GetGalleryProduct(context *gin.Context) {
	productId := cast.ToUint(context.Param("id_product"))
	var listOfImage []string
	err := db.Table("product_gallery").Where("id_product = ?", productId).Pluck("image_product", &listOfImage)
	if err.Error != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": "Error getting data"})
		return
	}

	context.JSON(http.StatusOK, listOfImage)
}

func GetProduct(context *gin.Context) {
	reqParamId := context.Param("id_product")
	id_product := cast.ToUint(reqParamId)

	var product models.Product

	err := db.First(&product, id_product)
	if err.Error != nil {
		context.JSON(http.StatusNotFound, gin.H{"error": "Product not found"})

		return
	}

	context.JSON(http.StatusOK, gin.H{
		"status":  "200",
		"message": "Success",
		"data":    product,
	})

}

func UpdateProduct(context *gin.Context) {
	var data productRequest
	reqParamId := context.Param("id_product")
	id_product := cast.ToUint(reqParamId)

	if err := context.BindJSON(&data); err != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	product := models.Product{}

	productById := db.Where("id_product = ?", id_product).First(&product)
	if productById.Error != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": "Product not found"})
		return
	}

	product.NamaProduct = data.NamaProduct
	product.DescProduct = data.DescProduct

	// result := db.Save(&product)
	// result := db.Model(&product).Updates(&product)
	result := db.Raw("UPDATE product SET nama_product = ?, desc_product = ? WHERE id_product = ?", product.NamaProduct, product.DescProduct, id_product).Scan(&product)
	if result.Error != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": "Something went wrong"})
		return
	}

	var response productResponse
	response.IdProduct = product.IdProduct
	response.NamaProduct = product.NamaProduct
	response.DescProduct = product.DescProduct

	context.JSON(http.StatusCreated, response)
}

// func DeleteTodo(context *gin.Context) {
// 	todo := models.Todo{}
// 	reqParamId := context.Param("idTodo")
// 	idTodo := cast.ToUint(reqParamId)

// 	delete := db.Where("id = ?", idTodo).Unscoped().Delete(&todo)
// 	fmt.Println(delete)

// 	context.JSON(http.StatusOK, gin.H{
// 		"status":  "200",
// 		"message": "Success",
// 		"data":    idTodo,
// 	})

// }
