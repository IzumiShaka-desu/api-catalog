package controllers

import (
	"net/http"

	"api-catalog/src/config"
	"api-catalog/src/models"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

var dbbat *gorm.DB = config.ConnectDB()

func GetAllBatteryType(context *gin.Context) {
	var batteryType []models.BatteryType

	err := dbbat.Find(&batteryType)
	if err.Error != nil {
		context.JSON(http.StatusBadRequest, gin.H{"error": "Something went wrong"})
		return
	}

	context.JSON(http.StatusOK, batteryType)
}
