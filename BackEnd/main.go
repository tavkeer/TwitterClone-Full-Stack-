package main

import (
	"github.com/gin-gonic/gin"
	"github.com/twitter/backend/controllers"
	"github.com/twitter/backend/initializers"
	"github.com/twitter/backend/middleware"
)

func init() {
	initializers.LoadEnvVariables()
	initializers.ConnectToDB()
	initializers.SyncDatabase()
}

func main() {
	r := gin.Default()
	r.POST("/login", controllers.Login)
	r.POST("/signup", controllers.SignUp)
	r.POST("/addpost", controllers.AddPost)
	r.POST("/addlike", controllers.AddLike)
	r.GET("/", controllers.DefaultApiPoint)
	r.POST("/allposts", controllers.GetAllPosts)
	r.POST("/ckeckemail", controllers.CheckUserEmail)
	r.POST("/ckeckusername", controllers.CheckUserName)

	r.GET("/validate", middleware.AuthMiddleware(), controllers.Validate)

	// Running server
	r.Run()
}
