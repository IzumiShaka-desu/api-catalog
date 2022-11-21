package models

type Product struct {
	// gorm.Model
	IdProduct        int64  `json:"id_product"`
	NamaProduct      string `json:"nama_product"`
	DescProduct      string `json:"desc_product"`
	ThumbnailProduct string `json:"thumbnail_product"`
	Dimension        string `json:"dimension"`
	IsFavourite      bool   `json:"is_favourite"`
}

func (Product) TableName() string {
	return "product"
}
