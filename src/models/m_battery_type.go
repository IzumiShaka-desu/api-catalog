package models

type BatteryType struct {
	IdTipeBattery   int64  `json:"battery_type_id"`
	NamaTipeBattery string `json:"battery_type_name"`
}

func (BatteryType) TableName() string {
	return "tipe_battery"
}
