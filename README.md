# Auditioncity API

## User Methods

### Signup/Registration

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

### Login ###

User can login.

**Route** /login", to: "registrations#login

**Method** POST

**Request**

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| full_name | String | *(Required)* users full name | 
|email	|string|(Required) users email adrress
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
###Anything below from this point is old leftovers and not good for anything but confusion.  I'll do more tommorrow Tuesday.
------------------------------
















## Images

### Upload a new image

Authenticated users can create images. 

**Route** "journeys/:journey_id/images"

**Method** POST

***REQUIRED IN HEADERS*** : Access-Token = string

**Request**

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| journey_id | Integer | *(Required)* | 
| photo | file |.jpg .jpeg etc|
|description|t.string|Photo description			|

**Response**

If successful, you will receive:

	Status Code: 201 - Created
	
```
	{ "image": 
			{ "id": 2
				"journey_id": 1,
			  "photo_file_name": "terrific.jpeg",
			  "description": "my awesome trip"
			}
	}			
```

If unsuccessful, you will receive:

	Status Code: 404 - Unprocessable Entity

### Get an index of images

**Route** /"journeys/:journey_id/images"

**Method** GET

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| journey_id| integer | *(Required)* | 

**Response**

If successful, you will receive:

	Status Code: 200 - OK


If unsuccessful, you will receive:

	Status Code: 404 - Not Found

	```
	{ "image": 
			{ "id": 2
				"journey_id": 1,
			  "photo_file_name": "terrific.jpeg",
			  "description": "my awesome trip"
			}
	}		
	```

### Delete Image###

Authenticated users can delete an image that they have created.

**Route** "images/:image_id", to: "images#destroy"

**Method** DESTROY

***HEADERS*** : Access-Key = String


| Parameter        | Type           | Description  |
| ---------------- |----------------|------------- |
| image_id| Integer | Required | 


**Response**

If successful, you will receive:

	Status Code: 200 - OK
	
```
		{
			"The image has been deleted successfully."
		}	
```

If unsuccessful, you will receive:

	Status Code: 401 - Not Authorized
	
```
	{ "errors": [ 
				"You're not authorized to delete this image"
				] 
```

## Journeys

### Index

Retrieve a list of all the user's journeys

**Route** "/journeys"

**Method** GET

**Request**
	

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| user_id  | integer | *(Required)*  |
| title      | t.string      |  *(Required)*    |
| description | String      | *(Required)* journey description |
| region | t.string | *(Required)* |
|

**Response**

If successful, you will receive:

	Status Code: 201 - Created

```
  "journeys": [
    {
      "id": 2,
      "title": "My first trip",
      "description": "Trip to Uruguay",
      "region": "South America",
      "user_id": 13,
      "photo_url": "http://voyage-prod.s3.amazonaws.com/journeys/photos/000/000/002/original/uruguay.jpg"
    }
   ]
 ```

If the request fails, you will get:

```
{ error: "There are no journeys to display." }
```

	Status Code: 404 - Not Found
	
	
### Create

Create a new journey

**Route** "/journeys"

**Method** GET

	

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| title  | t.string | *(Required)*  |
| description      | t.string      |  *(Required)*    |
| region | t.string | *(Required)* |
| user_id |integer	 |*(Required)*

**Response**

If successful, you will receive:

	Status Code: 201 - Created
	
	```
	{	"journey":
      "id": 3,
      "title": "My second trip",
      "description": "Trip to Ireland",
      "region": "Europe",
      "user_id": 13,
      "photo_url": "http://voyage-prod.s3.amazonaws.com/journeys/photos/000/000/003/original/Irish-ruins.jpg"
    }
    ```

If the request fails, you will get:

	Status Code: 402 - Unauthorized

	
### Update

Update an existing journey

**Route** "journeys/:journey_id"

**Method** PATCH

	

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| title  | t.string | *(Required)*  |
| description      | t.string      |  *(Required)*    |
| region | t.string | *(Required)* |
|user_id |integer	 |*(Required)*

**Response**

If successful, you will receive:

	Status Code: 202 - Accepted
	
	```
	{	"journey":
      "id": 3,
      "title": "My second trip",
      "description": "Trip to Ireland",
      "region": "Europe",
      "user_id": 13,
      "photo_url": "http://voyage-prod.s3.amazonaws.com/journeys/photos/000/000/003/original/Irish-ruins.jpg"
    }
    ```

If the request fails, you will get:

	Status Code: 422 - Unprocessable Entity
	
	```
	{ error: "The journey you've requested does not exist." }
	```
	
### Show

Find a specific journey

**Route** journeys/:journey_id"

**Method** GET


| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| journey_id  | integer | *(Required)*  |

**Response**

If successful, you will receive:

	Status Code: 200 - OK
	
	```
	{	"journey":
      "id": 3,
      "title": "My second trip",
      "description": "Trip to Ireland",
      "region": "Europe",
      "user_id": 13,
      "photo_url": "http://voyage-prod.s3.amazonaws.com/journeys/photos/000/000/003/original/Irish-ruins.jpg"
    }
    ```

If the request is unsuccessful, you will get:

	Status Code: 404 - Not Found

	```
	{ error: "The journey you've requested does not exist." }
	```
	
### Delete

Delete an existing journey

**Route** journeys/:journey_id"

**Method** DESTROY

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| journey_id  | integer | *(Required)*  |

**Response**

If successful, you will receive:

	Status Code: 202 - Accepted
	
	{
		"The journey has been deleted."
	}

If the request was unsuccessful, you will get:

	Status Code: 404 - Not Found

	```
	{ error: "The journey you've requested does not exist." }

	```
## Comment Methods
###Comments Index 

Users may pull up all the comments listed on the immage.

**URL** "images/:image_id/comments"

**Method** get 

**Request**

*Required* 

***HEADERS*** : Access-Key = string

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| immage_id  | integer | *(Required)*||

**Response**

If successful, you will receive:

```
a comment	:-}
```	
Status Code: 201 - Created	
	

If unsuccessful, you will receive:

	Status Code: 404 - Not found

```

Status Code: 201 - Created	
	

```


### Create Comment

Authenticated users can create Coments. 


**URL** "journeys/:journey_id/images"
**Method** POST


***REQUIRED IN HEADERS*** : Access-Token = string


| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| journey_id| Integer | *(Required)* | 
| photo | file |.jpg .jpeg etc|
|description|t.string|Photo description			|


**Response**
?



### Update

A user is able to update comments

**URL** "comments/:comment_id"

**Method** PATCH


	

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| comment_id  | integer | *(Required)*  |

**Response**

If successful, you will receive:

	a changed comment
	

If failfull, you will get:

	json: { error: "The comment you've requested does not exist." },
        status: :not_found
        
        
 
	
### Delete

A user is able to delete comments

**URL** ""comments/:comment_id""

**Method** DESTROY


	

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| comment_id  | integer | *(Required)*  |

**Response**

If successful, you will receive:

	"The comment was deleted successfully."
	

If failfull, you will get:

	error 404

	"The comment you've requested does not exist." } 