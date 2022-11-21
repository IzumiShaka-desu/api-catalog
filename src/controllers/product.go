package controllers

import (
	"api-catalog/src/config"
	"api-catalog/src/models"
	"api-catalog/src/utils"
	"net/http"
	"strconv"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/spf13/cast"
	"gorm.io/gorm"
)

var SECRET_KEY = "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC2dK1Y76ohJ5ek\nlXQG+WHdtodH375xSRjiH7vbuiYz136zsSvEpUvp8Id8ZwJHw7GzYM5vzyD1Qe16\nW0bbIoRj5bmFHRhxujw9/Ixkh72ynElLSkEZnkE80PqN0J+/wavZqlLEvXFiIWnX\nEbruVhB+rgHWpQQ62zByMnQdI4XgCTJfsU5Ljrj0m2V9ieBwzAnPW8THQj04ZVtX\nGvfAvbXVje7lKRe4HZdTr/A5KgazhjtSxExKtI9F3jRIl95oDD3z+wmBTvBp14I3\n2tcjF46w2EMLEyUBwgmVpauw9CW2fhBRPD6zQw3mEQ+PqTkMhb+e/WgzPkyQ/NXD\nEbg5riQRAgMBAAECggEABWSDbxp+S8aQy9OC/2XFh7kKXIx3Y3/GlYBcnAzvbh7T\nZto4sfI0wTBTwNCGl7pn+SZGU7WqgrU1IKWr/XQSt6Uli5Klk07u0uIxABOm/q1x\n2SDTtb8grHx8u05MOm2t95v6IEh9HmpgZ3Pls3+lsyjPcxmje13ZG7b0CZxwK4Pt\nMvAAizGnh95+BK48jBXzPd3KDPOKHerzgvVXlhgKneynZa4/6YI2hokUwoQpz7Vb\n4BMdCfADNXBBaztzck61WNUFi1B2WJsG8DG+ebw1+23BbIGMMIvl/YPJ5Mwx+Fju\ntdDme80GILZfXr0jzzdqZmmZ92TadvGEktWJtmYy9QKBgQD0ZcFf1g74A91Lq/xz\nMgOU8rbMGGtd0O1Y/+omVCisxO3DEl+yRtvNeBgezRYzMuHDKV9Pk8kdACmdBfoi\nGdX7QVz1kl1C2+d5Rd99jwnzZ7mIMpuTd3vCxzyyp0nAtq7qgCZlvtN8rPsp8uzB\n+AujbUcUHpD3k64fsGYTZxPqYwKBgQC/Hh+UKmd416DoXeBDTpOuHN8iWUB2RieY\n4ugObQchYzEclJWkYk5W6Lqri2kHMfuesi9QXfeWB2Ut/m/q297Qb/VjUatHpc9R\nmw97ex2ivAElEfY4lPfVOToiECE9aSf0KBmj/zTDnKugeejugiSE494xDuK+nVv9\nyn6i2Tjn+wKBgAYypmrFxO9pOa13mRlaxVh7p0MZw29Hox1EsC10qOtouxbdWmvs\n/BoD16jATrXRroQCgpZECy+fF28R/bvrp8+NYswfgBn39bDPotFOVVRE5yGbFvLw\nbsULxHBLacVnXJw5z794zWg2AtCXhoWMws7MMKdD9y0wI5ROJuiLDqg9AoGAal1f\ngdyfvbd0TB6DA7Klqk9TOBCoOasNup7+O5keUMydtqRTLCuyIdhgm7x49ZIx0b6l\nansBojP3ccObkgBQX30P+vim9LcpTOeZlEWO1tT/Zhw7Bn6R989jtTV46m6t18rB\nim4sdXmqYyO2KZewr20Kag84zpFRc0vRctymOSUCgYEA45lzOOJ5ngl+eOCVDMW8\nX8dqZck/0buwj5JL0Te5Lg7gXgsj5vcLyM+RatlZ2kErW2ZR40SXIb/6tyALVF7w\nABJCtHhDIcQvfNKIqGgHr2hyJPGOqy89hFeqn+mIAu1w8/IVda7QSxESnzh+G/ZP\n2cLECIgWidTpEZ/Kk5TQ6R4=\n-----END PRIVATE KEY-----\n"

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
func map2[T, U any](from []T, mapper func(T) U) []U {
	to := make([]U, len(from))
	for i, v := range from {
		to[i] = mapper(v)
	}
	return to
}
func where[T any](from []T, predicate func(T) bool) []T {
	to := make([]T, 0, len(from))
	for _, v := range from {
		if predicate(v) {
			to = append(to, v)
		}
	}
	return to
}

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

//SELECT product.*,tipe_battery.nama_tipe_battery,tipe_kendaraan.nama_tipe,brand_kendaraan.nama_brand,jenis_kendaraan.nama_jenis_kendaraan FROM `product` LEFT JOIN tipe_battery on tipe_battery.id_tipe_battery=product.id_tipe_battery LEFT JOIN product_tree ON product_tree.id_product = product.id_product LEFT JOIN tipe_kendaraan on product_tree.id_tipe = tipe_kendaraan.id_tipe LEFT JOIN brand_kendaraan ON brand_kendaraan.id_brand = product_tree.id_brand LEFT JOIN jenis_kendaraan ON jenis_kendaraan.id_jenis_kendaraan=product_tree.id_jenis_kendaraan;

func GetAllProduct(context *gin.Context) {
	var product []models.Product
	//user can filter based on id_tipe_battery or nama_tipe_battery
	id_tipe_battery := context.Query("battery_type_id")
	nama_tipe_battery := context.Query("battery_type_name")
	favquery := context.Query("is_favorited")
	is_favorited, err := strconv.ParseBool(favquery)
	if err != nil {
		favquery = ""
	}

	// filter by type,brand,model
	type_name := context.Query("vehicle_type_name")
	brand_name := context.Query("vehicle_brand_name")
	model_name := context.Query("vehicle_model_name")
	token := strings.Replace(context.Request.Header["Authorization"][0], "Bearer ", "", 1)
	var claims = utils.ExtractClaims(token)

	// base_query := "SELECT product.*,tipe_battery.nama_tipe_battery FROM `product` INNER JOIN tipe_battery on tipe_battery.id_tipe_battery=product.id_tipe_battery"
	base_query := "SELECT *,EXISTS(SELECT * FROM watch_list WHERE watch_list.id_user='" + claims.UserId + "' AND watch_list.id_product=product_complete_data.id_product) as is_favourite FROM product_complete_data"
	order_by := " ORDER BY id_product ASC"
	//check is query id_tipe_battery or nama_tipe_battery is empty
	if type_name != "" && brand_name != "" && model_name != "" {
		err := db.Raw(base_query + " WHERE nama_jenis_kendaraan = '" + type_name + "' AND nama_brand = '" + brand_name + "' AND nama_tipe = '" + model_name + "'" + order_by).Find(&product)
		if err.Error != nil {
			context.JSON(http.StatusBadRequest, gin.H{"error": "Error getting data"})
			return
		}
		//SELECT *,EXISTS(SELECT * FROM watch_list WHERE watch_list.id_user="sdasd" AND watch_list.id_product=product.id_product) as isFav FROM `product` WHERE 1;
	} else if id_tipe_battery != "" && nama_tipe_battery != "" {
		err := db.Raw(base_query+" where product.id_tipe_battery = ? AND tipe_battery.nama_tipe_battery = ?", id_tipe_battery, nama_tipe_battery+order_by).Find(&product)
		if err.Error != nil {
			context.JSON(http.StatusBadRequest, gin.H{"error": "Error getting data"})
			return
		}
	} else if id_tipe_battery != "" {
		err := db.Raw(base_query+"  where product.id_tipe_battery = ?", id_tipe_battery+order_by).Find(&product)
		if err.Error != nil {
			context.JSON(http.StatusBadRequest, gin.H{"error": "Error getting data"})
			return
		}
	} else if nama_tipe_battery != "" {
		err := db.Raw(base_query+"  where tipe_battery.nama_tipe_battery = ?", nama_tipe_battery+order_by).Find(&product)
		if err.Error != nil {
			context.JSON(http.StatusBadRequest, gin.H{"error": "Error getting data"})
			return
		}
	} else {
		err := db.Raw(base_query + order_by).Find(&product)
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
		"data": map2(where(product, func(p models.Product) bool {
			if favquery != "" {
				return p.IsFavourite == is_favorited
			}
			return true
		}), func(p models.Product) models.Product {
			p.Dimension = "dimensi 10x10x10"

			return p
		}),
	})

}
func GetProductFilters(context *gin.Context) {
	var filters []models.FilterVehicle
	err := db.Table("jenis_kendaraan").Find(&filters)
	if err.Error != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": "Error getting data"})
		return
	}

	filters = map2(filters, func(f models.FilterVehicle) models.FilterVehicle {
		var brands []models.VehicleBrand
		db.Table("brand_kendaraan").Where("id_jenis_kendaraan = ?", f.IdJenisKendaraan).Find(&brands)
		brands = map2(brands, func(b models.VehicleBrand) models.VehicleBrand {
			var models []models.VehicleModel
			db.Table("tipe_kendaraan").Where("id_brand = ?", b.IdBrand).Find(&models)
			b.Models = models
			return b
		})
		f.Brands = brands
		return f
	})

	context.JSON(http.StatusOK, gin.H{
		"status":  "200",
		"message": "Success",
		"data":    filters,
	})

}
func SearchProduct(context *gin.Context) {
	var product []models.Product
	//query q to search based on nama_product and desc_product
	q := context.Query("q")

	err := db.Where("nama_product LIKE ? OR desc_product LIKE ?", "%"+q+"%", "%"+q+"%").Find(&product)
	// err := db.Where("nama_product LIKE ?", "%"+context.Query("q")+"%"+ order_by).Find(&product)
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

func PostFavouriteProduct(context *gin.Context) {
	productId := context.Param("id_product")

	//parse jwt body from bearer token
	token := strings.Replace(context.Request.Header["Authorization"][0], "Bearer ", "", 1)
	var claims = utils.ExtractClaims(token)

	//delete if exit else insert using sql query
	var count int64
	db.Table("watch_list").Where("id_product = ? AND id_user = ?", productId, claims.UserId).Count(&count)
	if count > 0 {
		db.Exec("DELETE FROM watch_list WHERE id_product = ? AND id_user = ?", productId, claims.UserId)
		context.JSON(http.StatusOK, gin.H{
			"status":       "200",
			"is_favorited": false,
			"message":      "Product removed from favourite",
		})
	} else {
		db.Exec("INSERT INTO watch_list (id_product, id_user) VALUES (?, ?)", productId, claims.UserId)
		context.JSON(http.StatusOK, gin.H{
			"status":       "200",
			"is_favorited": true,
			"message":      "Product added to favourite",
		})
	}

}

// INSERT INTO `watch_list`(`id_list`, `id_user`, `id_product`, `created_at`) VALUES (NULL,?,?,NULL)
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
