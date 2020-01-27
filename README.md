
Things you may want to cover:

* Ruby version = 2.6.0

rails version = 5.2.0

database = postgres

Its a login service for bank app and it handles user sign-up , login and authentication for all requests.
it works as proxy server for all requests. All requests go through this service.

Need to start user_app and bank_user_app servers for following apis, add bank_user_app url in user_app service.

API 1: 
 POST  http://localhost:3000/sign-up
 body: {
	"phone_number": "9874563241",
	"password": "akshay",
	"password_confirmation": "akshay"
}


API 2: 
POST http://localhost:3000/login
body:{
	"phone_number": "0123456789",
	"password": "akshay"
	
}

response: {
    "status": "success",
    "token": "a4e302f57e72"
}

need to use this token in all other requests for authentication purpose.

API 3:
GET http://localhost:3000/logout
headers: token:86a8b41a669e #this is token got from login api

API 4 :
 POST http://localhost:3000/user/create-account
 headers: token:86a8b41a669e #this is token got from login api
 
 
API 5:
  GET http://localhost:3000/user/get-details
  headers: token:86a8b41a669e #this is token got from login api
  
  
API 6:   API to add mmoney to account 
 POST: http://localhost:3000/user/add
 Body: {
	"amount": 20
}

headers: token:86a8b41a669e #this is token got from login api

API 7: To withdraw money from account
POST  http://localhost:3000/user/withdraw

Body: {
	"amount": 20
}

headers: token:86a8b41a669e #this is token got from login api


  
