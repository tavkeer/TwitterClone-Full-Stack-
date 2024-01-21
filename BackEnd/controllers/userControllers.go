package controllers

import (
	"hash/fnv"
	"net/http"
	"os"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt/v4"
	"github.com/twitter/backend/initializers"
	"github.com/twitter/backend/models"
	"golang.org/x/crypto/bcrypt"
)

func DefaultApiPoint(c *gin.Context) {
	// Respond
	c.JSON(http.StatusOK, gin.H{
		"Output": "Successfully initialized the page",
	})
}

func SignUp(c *gin.Context) {

	//Get the required details from the request body

	var body struct {
		Email        string
		Password     string
		UserName     string
		ProfileImage string
		DateOfBirth  string
		Address      string
		Website      string
	}

	if c.Bind(&body) != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"Error": "Failed to read the body",
		})
		return
	}

	//Hash the password

	hashPasssword, err := bcrypt.GenerateFromPassword([]byte(body.Password), 10)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"Error": "Failed to Hash the password",
		})
		return
	}

	//Create User
	userID := hashToID(body.Email)
	user := models.User{ID: userID, Email: body.Email,
		Password:     string(hashPasssword),
		UserName:     body.UserName,
		Followers:    "0",
		Following:    "0",
		ProfileImage: body.ProfileImage,
		DateOfBirth:  body.DateOfBirth,
		Location:     body.Address,
		PostCount:    "0",
		Website:      body.Website,
	}
	result := initializers.DB.Create(&user)
	if result.Error != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"Error": "Failed to Create User",
		})
		return
	}

	//Respond
	c.JSON(http.StatusOK, gin.H{
		"message": "User Created Successfully",
		"user":    &user,
	})

}

func Login(c *gin.Context) {

	// Get the required details from the request body
	var body struct {
		Email    string
		Password string
	}

	if c.Bind(&body) != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"Error": "Failed to read the body",
		})
		return
	}

	//Look for the requested user
	var user models.User
	initializers.DB.First(&user, "email = ?", body.Email)
	if user.ID == 0 {
		c.JSON(http.StatusBadRequest, gin.H{
			"Error": "Invalid Email or Password",
		})
		return
	}

	//compare and send for password hash
	err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(body.Password))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"Error": "Invalid Email or Password",
		})
		return
	}

	//create jwt token
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"sub": user.ID,
		"exp": time.Now().Add(time.Hour * 24 * 30).Unix(),
	})
	tokenString, err := token.SignedString([]byte(os.Getenv("SECRET")))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"Error": "Failed to Generated the Token",
		})
		return
	}

	//send it back
	c.JSON(http.StatusOK, gin.H{
		"message": "User logged In Successfully",
		"Token":   tokenString,
		"user":    &user,
	})

}

func CheckUserName(c *gin.Context) {
	// Get the required details from the request body
	var body struct {
		UserName string
	}

	if c.Bind(&body) != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"Error": "Failed to read the body",
		})
		return
	}

	//check if the username exists
	var user models.User
	initializers.DB.First(&user, "user_name = ?", body.UserName)
	if user.ID != 0 {
		c.JSON(http.StatusBadRequest, gin.H{
			"Error": "UserName Already Taken!",
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"message": "UserName is not in use.",
	})
}

func CheckUserEmail(c *gin.Context) {
	// Get the required details from the request body
	var body struct {
		Email string
	}

	if c.Bind(&body) != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"Error": "Failed to read the body",
		})
		return
	}

	//check if the username exists
	var user models.User
	initializers.DB.First(&user, "email = ?", body.Email)
	if user.ID != 0 {
		c.JSON(http.StatusBadRequest, gin.H{
			"Error": "Email Already Taken!",
		})
		return
	}

	//return the 200 code
	c.JSON(http.StatusOK, gin.H{
		"Message": "Email is not in use.",
	})
}

func Validate(c *gin.Context) {
	user, exists := c.Get("user")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
		return
	}

	// Access user information from the context
	currentUser := user.(models.User)

	c.JSON(http.StatusOK, gin.H{
		"message": "Validation done logged in",
		"user":    currentUser,
	})
}

func hashToID(value string) int64 {
	h := fnv.New64a()
	h.Write([]byte(value))
	var result int64 = int64(h.Sum64())
	if result <= 0 {
		return -1 * result
	}
	return result
}
