package initializers

import (
	"github.com/twitter/backend/models"
)

func SyncDatabase() {
	DB.AutoMigrate(&models.User{})
	DB.AutoMigrate(&models.Post{})
	DB.AutoMigrate(&models.Like{})
	DB.AutoMigrate(&models.Comment{})
}
