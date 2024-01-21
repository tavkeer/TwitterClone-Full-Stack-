package models

import "github.com/jinzhu/gorm"

type User struct {
	gorm.Model
	ID           int64  `gorm:"unique"`
	Email        string `gorm:"unique"`
	Password     string
	UserName     string
	Followers    string
	Following    string
	ProfileImage string
	DateOfBirth  string
	Location     string
	PostCount    string
	Website      string
}
