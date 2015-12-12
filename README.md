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
  * [Add an Actor Address](#actor-new-address)
  * [Update an Actor Address](#actor-update-address)
  * [Delete an Actor Address](#actor-delete-address)
  * [Add Actor's Contact Information](#actor-new-contactable)
  * [Update Actor's Contact Information](#actor-update-contactable)
  * [Delete Actor's Contact Information](#actor-delete-contactable)
  * [Set Actor's Primary Contact](#actor-set-primary)
* [Director Profile Methods](#director-methods)
  * [New Profile](#director-new)
  * [Update Profile](#director-update)
  * [Show a Single Director Profile](#director-show)
  * [Show a List of Director Profiles](#director-list)
  * [Delete a Director Profile](#director-destroy)

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

These methods are used to manage the basic details of Actor profiles.

### <a name="actor-new"></a>New Profile

This is an endpoint to add Actor profiles for a specific User. This is a Multipart Encoded POST request because it may include the headshot and resume.

**Route** /actors/new

**Method** POST

**Request**

The Headshot must be of type `image/jpeg` and passed in a form object called `headshot`. The Resumé must be of type `application/pdf` and passed in a form object called `resume`.

The JSON data should be passed in a form object called `info`, with the following parameters:

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| full_name | String | User's full name. This will change the User's full name across *all* profiles.
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

* Blonde
* Brown
* Hazel
* Grey
* Black
* Red
* White
* Other
* None

**Eye Colors**

* Blue
* Brown
* Hazel
* Green
* Black
* Grey
* Purple

**Ethnicities**

* Black or African American
* Hispanic/Latino
* Asian/Pacific Islander
* White or Caucasian
* American Indian/Alaskan Native
* Other

**Sample Request**

```
------WebKitFormBoundaryLDO5L5uBiaTrJSgj
Content-Disposition: form-data; name="headshot"; filename="Iam-Actor-headshot-1.jpg"
Content-Type: image/jpeg


------WebKitFormBoundaryLDO5L5uBiaTrJSgj
Content-Disposition: form-data; name="resume"; filename="Iam-Actor-resume.pdf"
Content-Type: application/pdf


------WebKitFormBoundaryLDO5L5uBiaTrJSgj
Content-Disposition: form-data; name="info"

{"name":"Iam Actor","address_1":"123 Main St","address_2":null,"city":"Atlanta","state":"GA","zip":"30303","phone_type":"Home","phone":"404-555-1234","email_type":"Work","email":"iam@actor.org","Website":"http://iamactor.org","bio":"Iam Actor was born singing.","age_young":25,"age_old":35,"height_feet":5,"height_inches":8,"hair_color":Brown,"eye_color":Blue,"gender":Male,"ethnicity":"White or Caucasian","talent_agency":"Actors R Us","union":["Equity"],"skills":["Acting Instructor","Director","Prop Artisan"]}
------WebKitFormBoundaryLDO5L5uBiaTrJSgj--
```

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

Updating an Actor profile includes many of the same parameters as creating a new profile. However, contact information (address, email, phone, website URL) is not included.

The headshot and resume can be included in this request. Therefore, the structure of this request is the same as creating a new profile.

**Route** /actors/:id

**Method** PUT

**Request**

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| full_name | String | User's full name. This will change the User's full name across *all* profiles.
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

### <a name="actor-list"></a>Show a List of Actor Profiles

**Route** /actors

**Method** GET

**Response**

If successful, you will receive:

	Status Code: 200 - OK

```json
{
  "actors": [
    {
      "actor": {
        "id": 1,
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
        "talent_agency": "Actors R Us",
        "union": "Equity",
        "headshot_full": "/headshots/full/missing.png",
        "headshot_large": "/headshots/large/missing.png",
        "headshot_mobile": "/headshots/mobile/missing.png",
        "headshot_small": "/headshots/small/missing.png",
        "headshot_thumb": "/headshots/thumb/missing.png",
        "resume": "/resumes/original/missing.png"
      }
    }
  ]
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

### <a name="actor-new-address"></a>Add an Actor Address

**Route** /actors/:id/address

**Method** POST

**Request**

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| address_type | String | The Address type (Home, Work, etc.)
| address1 | String | The first line of the address
| address2 | String | The second line of the address
| city | String | The city
| state | String | The two-character state abbreviation
| zip | String | The zip code

### <a name="actor-update-address"></a>Update an Actor Address

**Route** /actors/:id/address/:type

**Method** PUT

**Request**

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| address_type | String | The Address type (Home, Work, etc.)
| address1 | String | The first line of the address
| address2 | String | The second line of the address
| city | String | The city
| state | String | The two-character state abbreviation
| zip | String | The zip code

### <a name="actor-delete-address"></a>Delete an Actor Address

**Route** /actors/:id/address/:type

**Method** DELETE

That's it!

### <a name="actor-new-contactable"></a>Add an Actor Email/Phone/Website URL

**Route** /actors/:id/:medium

For this Route, `:medium` should either be `email`, `phone`, or `url`

**Method** POST

**Request**

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| type | String | The contact type (Home, Work, etc.)
| email (if `:medium` is `email`) | String | The Actor's email address
| phone (if `:medium` is `phone`) | String | The Actor's phone number
| website_url (if `:medium` is `url`) | String | The URL for the Actor's website

### <a name="actor-update-contactable"></a>Update an Actor's Contact Information

**Route** /actors/:id/:medium

For this Route, `:medium` should either be `email`, `phone`, or `url`

**Method** PUT

**Request**

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| type | String | The contact type (Home, Work, etc.)
| email (if `:medium` is `email`) | String | The Actor's email address
| phone (if `:medium` is `phone`) | String | The Actor's phone number
| website_url (if `:medium` is `url`) | String | The URL for the Actor's website

### <a name="actor-set-primary"></a>Set Actor's Primary Contact

**Route** /actors/:id/primary/:medium

For this Route, `:medium` should either be `address`, `email`, `phone`, or `url`

**Method** PUT

**Request**

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| primary | String | The name of the contact type (Home, Work, etc.)

## <a name="director-methods"></a>Director Methods

These methods are used to manage the basic details of Director profiles.

### <a name="director-new"></a>New Profile

This is an endpoint to add Director profiles for a specific User.

**Route** /directors/new

**Method** POST

**Request**

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| full_name | String | User's full name. This will change the User's full name across *all* profiles.
| company_name | String | The Director's company name
| address1 | String | The first line of the director's primary address.
| address2 | String | The second line of the director's primary address.
| city | String | The city of the director's primary address.
| state | String | The two-character state abbreviation of the director's primary address.
| zip | String | The zip or postal code of the director's primary address.
| email_type | String | The director's priamry email type ("Home", "Work", etc.)
| email | String | The director's primary email address
| phone_type | String | The director's primary phone number type ("Home", "Cell Phone", etc.)
| phone_number | String | The director's primary phone number.
| website_type | String | The director's primary website label or title.
| website_url | String | The URL of the director's primary website.

**Response**

If successful, you will receive:

	Status Code: 201 - Created

```json
{
  "director": {
    "id": 1,
    "full_name": "Johnny Director",
    "company_name": "Amazing Productions",
    "addresses": [
      {
        "type": "Home",
        "address1": "123 Main St",
        "address2": "Suite 456",
        "city": "Atlanta",
        "state": "GA",
        "zip": "30303"
      }
    ],
    "emails": [
      {
        "type": "Home",
        "email": "amazing@director.com"
      }
    ],
    "phones": [
      {
        "type": "Home",
        "phone": "404-404-40404"
      }
    ],
    "urls": [
      {
        "type": "Personal",
        "url": "http://director.com"
      }
    ]
  }
}
```

### <a name="director-update"></a>Update Profile

Updating a Director profile includes many of the same parameters as creating a new profile. However, contact information (address, email, phone, website URL) is not included.

**Route** /directors/:id

**Method** PUT

**Request**

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| full_name | String | User's full name. This will change the User's full name across *all* profiles.
| company_name | String | The Director's company name

### <a name="director-show"></a>Show a Director's Profile

**Route** /directors/:id

**Method** GET

### <a name="actor-show"></a>Show Profile

**Route** /actors/:id

**Method** GET

**Response**

If successful, you will receive:

	Status Code: 200 - OK

```json
{
  "director": {
    "id": 1,
    "full_name": "Johnny Director",
    "company_name": "Amazing Productions",
    "addresses": [
      {
        "type": "Home",
        "address1": "123 Main St",
        "address2": "Suite 456",
        "city": "Atlanta",
        "state": "GA",
        "zip": "30303"
      }
    ],
    "emails": [
      {
        "type": "Home",
        "email": "amazing@director.com"
      }
    ],
    "phones": [
      {
        "type": "Home",
        "phone": "404-404-40404"
      }
    ],
    "urls": [
      {
        "type": "Personal",
        "url": "http://director.com"
      }
    ]
  }
}
```

### <a name="director-list"></a>Show All Director Profiles

**Route** /directors

**Method** GET

**Response**

If successful, you will receive:

	Status Code: 200 - OK

```json
{
"directors": [
  {
      "director": {
        "id": 1,
        "full_name": "Johnny Director",
        "company_name": "Amazing Productions",
        "addresses": [
          {
            "type": "Home",
            "address1": "123 Main St",
            "address2": "Suite 456",
            "city": "Atlanta",
            "state": "GA",
            "zip": "30303"
          }
        ],
        "emails": [
          {
            "type": "Home",
            "email": "amazing@director.com"
          }
        ],
        "phones": [
          {
            "type": "Home",
            "phone": "404-404-40404"
          }
        ],
        "urls": [
          {
            "type": "Personal",
            "url": "http://director.com"
          }
        ]
      }
    }
  ]
}
```

### <a name="director-list"></a>Delete a Director Profile

**Route** /directors/:id

**Method** DELETE

**Response**

If successful, you will receive:

	Status Code: 200 - OK

```json
{
  "success": "Director Profile Deleted"
}
```