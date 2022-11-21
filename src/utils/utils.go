package utils

import "gopkg.in/dgrijalva/jwt-go.v3"

type UserClaims struct {
	UserId         string `json:"user_id"`
	Email          string
	SignInProvider string `json:"sign_in_provider"`
	jwt.StandardClaims
}

func ExtractClaims(token string) *UserClaims {

	claims := &UserClaims{}
	jwt.ParseWithClaims(token, claims, func(token *jwt.Token) (interface{}, error) {
		return token.Claims, nil
	})
	return claims
}
