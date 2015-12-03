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

**Information**

Welcome to the Audition City API! It's like Spatula City, but with actors.

**Note:** The API server is `http://api.audition.city`. All Methods *except User Methods* require that you pass an authentication token in the `header`; the name of the token should be `Access-Token`.

## <a name="user-methods"></a>User Methods

### <a name="user-registration"></a>Registration

Register as a user to allow for creating new entries on the site.

**Route** /signup

**Method** POST

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

## <a name="actor-methods"></a>Actor Methods

These methods are used to manage the basic details of Actor profiles. Contact details will be managed through a separate set of methods.

### <a name="actor-new"></a>New Profile

**Route** /actors/new

**Method** POST

**Request**

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| bio | String | Actor's biography
| age_young | Integer | The age of the youngest role the actor is able to portray
| age_old | Integer | The age of the oldest role the actor is able to portray
| height_feet | Integer | The actor's height in feet
| height_inches | Integer | The actor's height in inches
| hair_color | String | The actor's hair color. See defined list, below.
| eye_color | String | The actor's eye color. See defined list, below.
| skills | Comma Separated String Values | A list of the actor's skills
| gender | String | Male or Female
| ethnicity | String | The actor's ethnicity. See defined list, below.
| talent_agency | String | The name of the talent agency representing the actor.
| union | Comma Separated String Values | A list of the actor's union memberships.
| address1 | String | The first line of the actor's primary address.
| address2 | String | The second line of the actor's primary address.
| city | String | The city of the actor's primary address.
| state | String | The two-character state abbreviation of the actor's primary address.
| zip | String | The zip or postal code of the actor's primary address.
| email_type | String | The actor's priamry email type ("Home", "Work", etc.)
| email | String | The actor's primary email address
| phone_type | String | The actor's primary phone number type ("Home", "Cell Phone", etc.)
| phone_number | String | The actor's primary phone number.
| website_type | String | The actor's primary website label or title.
| website_url | String | The URL of the actor's primary website.

**Hair Colors**

* TBD

**Eye Colors**

* TBD

**Ethnicities**

* Black or African American
* Hispanic/Latino
* Asian/Pacific Islander
* White or Caucasian
* American Indian/Alaskan Native
* Other

**Response**

If successful, you will receive:

	Status Code: 201 - Created

```json
{
  "actor": {
    "id": 9,
    "full_name": "Johnny Actor",
    "bio": "Johnny was a young boy with nothing much except a certain kind of look in his eye. He was discovered one day. You see, he had a certain kind of appeal for a certain kind of guy who gave him some advice on what to wear.",
    "age_young": 25,
    "age_old": 35,
    "height_feet": 5,
    "height_inches": 7,
    "hair_color": "Brown",
    "eye_color": "Brown",
    "skills": "actor, singer",
    "gender": "Male",
    "ethnicity": "White or Caucasian",
    "talent_agency": "The People Store",
    "union": "Equity"
  }
}
```

### <a name="actor-update"></a>Update Profile

**Route** /actors/:id

**Method** PUT

**Request**

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| bio | String | Actor's biography
| age_young | Integer | The age of the youngest role the actor is able to portray
| age_old | Integer | The age of the oldest role the actor is able to portray
| height_feet | Integer | The actor's height in feet
| height_inches | Integer | The actor's height in inches
| hair_color | String | The actor's hair color. See defined list, under the New Profile method.
| eye_color | String | The actor's eye color. See defined list, under the New Profile method.
| skills | Comma Separated String Values | A list of the actor's skills
| gender | String | Male or Female
| ethnicity | String | The actor's ethnicity. See defined list, under the New Profile method.
| talent_agency | String | The name of the talent agency representing the actor.
| union | Comma Separated String Values | A list of the actor's union memberships.

**Response**

If successful, you will receive:

	Status Code: 200 - OK

```json
{
  "actor": {
    "id": 9,
    "full_name": "Johnny Actor",
    "bio": "Johnny was a young boy with nothing much except a certain kind of look in his eye. He was discovered one day. You see, he had a certain kind of appeal for a certain kind of guy who gave him some advice on what to wear.",
    "age_young": 25,
    "age_old": 35,
    "height_feet": 5,
    "height_inches": 7,
    "hair_color": "Brown",
    "eye_color": "Brown",
    "skills": "actor, singer",
    "gender": "Male",
    "ethnicity": "White or Caucasian",
    "talent_agency": "The People Store",
    "union": "Equity"
  }
}
```

### <a name="actor-show"></a>Show Profile

**Route** /actors/:id

**Method** GET

**Response**

If successful, you will receive:

	Status Code: 200 - OK

```json
{
  "actor": {
    "id": 9,
    "full_name": "Johnny Actor",
    "bio": "Johnny was a young boy with nothing much except a certain kind of look in his eye. He was discovered one day. You see, he had a certain kind of appeal for a certain kind of guy who gave him some advice on what to wear.",
    "age_young": 25,
    "age_old": 35,
    "height_feet": 5,
    "height_inches": 7,
    "hair_color": "Brown",
    "eye_color": "Brown",
    "skills": "actor, singer",
    "gender": "Male",
    "ethnicity": "White or Caucasian",
    "talent_agency": "The People Store",
    "union": "Equity"
  }
}
```

### <a name="actor-destroy"></a>Delete Profile

**Route** /actors/:id

**Method** DELETE

**Response**

If successful, you will receive:

	Status Code: 200 - OK

```json
{
  "success": "Actor Profile Deleted"
}
```

