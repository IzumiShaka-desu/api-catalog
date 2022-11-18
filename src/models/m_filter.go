package models

type FilterVehicle struct {
	IdJenisKendaraan   int64          `json:"vehicle_type_id"`
	NamaJenisKendaraan string         `json:"type_name"`
	Brands             []VehicleBrand `gorm:"-"`
}

type VehicleBrand struct {
	IdBrand   int64          `json:"vehicle_brand_id"`
	NamaBrand string         `json:"brand_name"`
	Models    []VehicleModel `gorm:"-"`
}

type VehicleModel struct {
	IdTipe   int64  `json:"vehicle_model_id"`
	NamaTipe string `json:"model_name"`
}
