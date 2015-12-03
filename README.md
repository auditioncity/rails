# Auditioncity API

**Table of Contents**
* [User Methods](#user-methods)
  * [Registration](#user-registration)
  * [Login](#user-login)
  * [Delete User](#user-delete)
* [Actor Profile Methods](#actor-methods)
  * [New Profile](#actor-new)
  * [Update Profile](#actor-update)
  * [Show a Single Actor Profile](#actor-show)
  * [Show a List of Actor Profiles](#actor-list)
  * [Delete an Actor Profile](#actor-destroy)

## <a name="user-methods"></a>User Methods

### <a name="user-registration"></a>Registration

Register as a user to allow for creating new entries on the site.

**Route** /signup

**Method** post

**Request**
	

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| full_name | String | User's First and Last Name |
| email | String      | *(Required)*   User's email (must follow format text@text.text) |
| password | String | *(Requred)* User's password|


**Response**

If successful, you will receive:

	Status Code: 201 - Created
	
```json
{
  "user": {
    "full_name": "Johnny Actor",
    "email": "email@email.com",
    "auth_token": "cb5d7add166d169d4a9b3a598bd8404f"
  }
}
```

If unsuccessful, you will receive:

	Status Code: 422 - Unprocessable Entity
	
```json
{
  "errors": [
    "Email is invalid"
  ]
}
```

### <a name="user-login"></a>Login

User can login.

**Route** /login

**Method** POST

**Request**

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| email | String | *(Required)* users email address |
| password | String | *(Required)* User's password | 

**Response**

If successful, you will receive:

    Status Code: 202 - Accepted

```json
{
  "user": {
    "email": "email@email.com",
    "auth_token": "cb5d7add166d169d4a9b3a598bd8404f"
  }
}
```


If unsuccessful, you will receive:

```json
{
  "error": "Could not find user for email@email.com or wrong password."
}
```

### <a name="user-delete"></a>Delete a user

**Route** /signup

**Method** DELETE

**Request**

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| email | string | *(Required)* User's email address
| password | string | *(Required)* User's password
		

**Response**

If successful, you will receive:
```json
{
  "success": "User deleted"
}
```
	


If unsuccessful, you will receive:

	Status Code: 404 - Unprocessable Entity
	
```json
{
  "errors": [
    "Email is invalid"
  ]
}
```





