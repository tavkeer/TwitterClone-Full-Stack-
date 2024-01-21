package models

import "github.com/jinzhu/gorm"

type Post struct {
	gorm.Model
	ID          int64 `gorm:"unique"`
	Description string
	UserID      int64
	// User          User `gorm:"foreignKey:UserID"`
	UserName      string
	Title         string
	Views         int64
	LikesCount    int64
	CommentsCount int64
	ImageLink     string
	ProfileImg    string
}

type Comment struct {
	gorm.Model
	ID     int64 `gorm:"unique"`
	UserID int64
	// User        User `gorm:"foreignKey:UserID"`
	PostID int64
	// Post        Post `gorm:"foreignKey:PostID"`
	CommentText string
}

type Like struct {
	gorm.Model
	ID     int64 `gorm:"unique"`
	UserID int64
	// User   User `gorm:"foreignKey:UserID"`
	PostID int64
	// Post   Post `gorm:"foreignKey:PostID"`
}
