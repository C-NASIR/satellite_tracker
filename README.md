# README

### Versions

Rails 7.0.4
ruby 3.2.0 (2022-12-25 revision a528908271)

### Describe your approach to solving this problem 

- Thursday: Dedicated to learning how www.space-track.org works and run multiple requests in many differen ways using Postman to understand how the API worked inside and out. **Result**, I was able to call all the endpoints I needed to call using postman.
- Friday: 2 hours of reading and practicing ruby to familiarize myself with the language. **Result**, I was able to understand most ruby code and able to read ruby & rails documentations.
- Saturday: Installed and dedicated to learning how ruby on rails work. Learned about all different parts of the framework from Views (not needed), Controllers, Models, Helpers, Jobs, Errors etc **Result**, I was able to understand when I read what people are wrote about rails, I was able to understand most code I saw online. I could ask for help (Knew what to google) as well as create hello world application.
- Sunday: Thinking through and designing the logic of the application. Some of my decisions
  - Don't store any data. build a pass through API
  - Use the post with credentials HTTP request instead of using the cookie (struggled to use the cookie properly)
  - Create a versioned routes. example /api/v1/satcat/info
  - Create a list of all things you will need .env, authentication, excon, error handling, etc
  - **Result**. I knew what I was building, what i needed, and did most of the thinking.
- Monday: Time to dive in and start coding. I started building and got most of the application done.
- Tuesday: Finished up the rest of the application and added authentication and user creating, as well as documentation.

### How to use the application

- Clone the repo
- install the bundle
- resolve two bending migrations: run "bin/rails db:migrate"
- enable caching in development mode: run "rails dev:cache" otherwise every query will take a long time.
- You will need an .env file to to query endpoints
- run the application. You should get a message about certain end-points and what you can do with them
- You can call "_/api/v1/satcat/info_" to get api endpoint documentation
- To call other endpoints you will need to create an account
- Using postman (or whatever you choose). Send a post request with params (username and password) to /api/v1/signup
- If you already have an account, please send the same post request to /api/v1/signin to signin
- Both options will return a a Bearer Token. You should be able to call all other endpoints with your Bearer token

### Major parts of the application

- **routes** root route and api routes configuration
- **satcat_controller** The main controller of the application. Has all the endpoints (actions) you can call.
- **authentication_controller** The main controller for authentication. Has actions for signup and signin
- **application_controller** has action for the root endpoint and handles all application wide exceptions
- **exceptions** This file has all custom exceptions needed for the application
- **satcat_helper** A helper module that handles satcat controller specific validation and third api calling
- **data_helper** This class has a static data we need to call for example dictionary of satcat endpoints and satellite constellations
- **application_helper** Has some methods that are needed many places
- **authentication_token_service** handes JWT authentication. has encode and decode functions

### Comments explaining implementation

The code is properly commanted. All the classes and methods have an appropriate comments

### The API endpoints & available constellations

visit "_/api/v1/satcat/info_" to get all end points and available satellite constellations

### How readable is your code?

The code is very madular, organized, and written. It is very easy to comprehend and doesn't have any long methods that may cause a problem.

### How easy would it be to integrate this code into a wider code base?

The code is very madular. Every class does a single job and can be copied and pasted to a wider code base.

### How easy would it be for another developer to continue working on this project?

Very easy. Every module is concise and to the point. Anyone who knows basic rails api shouldn't have a problem expanding it.

### Usage of object-oriented programming (OOP) where it makes sense

I have used OOP in some important places, like when I inherited from Exceptions class to create a customazed derived Exceptions.

### Is your code testable?

My code is very testable. I wanted to write testing myself. But, I run out of time. So, I wrote the whole code base with testing in mind.

### Detail future improvements/expansions of the solution

- I chose to make the API passthrough. I am not storing any data in my API except caching. This is a decision I am not very condifent, since it makes the API class very slow. I would differently rethink this with other developers.
- testing. I didn't have enough time to implement testing since I was learning both the language and the framework while building this application. So, it needs testing
