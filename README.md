# Auditioncity API

## User Methods

###Registration

Register as a user to allow for creating new entries on the site.

**Route** /signup", to: "registrations#create

**Method** post

**Request**
	

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| full_name | String | *(Required)*  Must be unique |
| email | String      | *(Required)*   User's email (must follow format text@text.text) |
| password | String | *(Requred)* User's password|


**Response**

If successful, you will receive:

	Status Code: 201 - Created
	
```  "user": {
    "full_name": "Joe Winter",
    "email": "joe@joeventures.com",
    "auth_token": "02d5f2fc2affa9740a603af11fae54c1"
  }			
```

If unsuccessful, you will receive:

	Status Code: 422 - Unprocessable Entity
	
```
{
  "errors": [
    "Email is invalid"
  ]
}
```

### Login

User can login.

**Route** /login", to: "registrations#login

**Method** POST

**Request**

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| full_name | String | *(Required)* users full name | 
| email	| string | (Required) users email adrress |
| password | String | *(Required)* User's password | 

**Response**

If successful, you will receive:

	Status Code: 202 - Accepted
	
```
{
  "user": {
    "email": "joe@joeventures.com",
    "auth_token": "02d5f2fc2affa9740a603af11fae54c1"
  }
}			
```

If unsuccessful, you will receive:

{
  "error": "Could not find user for joe@joeventures.com or wrong password."
}
```
```
```



#### Delete a user

**Route** delete "/signup", to: "registrations#destroy"

**Method** DELETE

***REQUIRED IN HEADERS*** : Password = string

**Request**

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| email | string | *(Required)* | 
		

**Response**

If successful, you will receive:
{
  "success": "User deleted"
}
	


If unsuccessful, you will receive:

	Status Code: 404 - Unprocessable Entity
	
{
  "errors": [
    "Email is invalid"
  ]
}





