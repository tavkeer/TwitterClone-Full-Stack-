package controllers

import (
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/twitter/backend/initializers"
	"github.com/twitter/backend/models"
)

func AddPost(c *gin.Context) {

	// get the body
	var post models.Post
	if c.Bind(&post) != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Failed to read the body",
		})
		return
	}

	// create the post
	// post.ID = int64(hashToID(post.UserName + post.Title + string(rune(post.UserID)) + string(rune(time.Now().Second()))))

	result := initializers.DB.Create(&post)
	if result.Error != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Failed to add the post",
		})
		return
	}

	// respond
	c.JSON(http.StatusOK, gin.H{
		"message": "Post Uploaded Successfully",
		"post":    &post,
	})
}

func AddLike(c *gin.Context) {

	// Get the specified postID and userID from the request body
	var body struct {
		PostID int64
		UserID int64
	}
	if err := c.BindJSON(&body); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Failed to read the body",
		})
		return
	}
	like := models.Like{
		PostID: body.PostID,
		UserID: body.UserID,
	}
	result := initializers.DB.Create(&like)

	if result.Error != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Failed to add the Like",
		})
		return
	}

	// Respond with success message and the created like
	c.JSON(http.StatusOK, gin.H{
		"message": "Like Uploaded Successfully",
		"like":    like,
	})
}
func GetAllPosts(c *gin.Context) {
	limitParam := c.DefaultQuery("limit", "10")
	limit, err := strconv.Atoi(limitParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid limit parameter",
		})
		return
	}

	var posts []models.Post
	result := initializers.DB.Limit(limit).Find(&posts)
	if result.Error != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": "Failed to fetch posts",
		})
		return
	}
	for i, j := 0, len(posts)-1; i < j; i, j = i+1, j-1 {
		posts[i], posts[j] = posts[j], posts[i]
	}

	// Respond with the retrieved posts
	c.JSON(http.StatusOK, gin.H{
		"posts": posts,
	})
}
