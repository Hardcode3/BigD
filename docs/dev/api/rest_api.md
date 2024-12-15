# REST API

!!! cite "References"

    [Real Python - API Integration](https://realpython.com/api-integration-in-python/){target=_blank}

## What Is a REST API?

A **REST API (Representational State Transfer Application Programming Interface)** is a standardized way to allow different applications to communicate with each other over HTTP. It is widely used to build web services that are lightweight, scalable, and easy to integrate.

![REST API image](https://images.ctfassets.net/vwq10xzbe6iz/5sBH4Agl614xM7exeLsTo7/9e84dce01735f155911e611c42c9793f/rest-api.png)

---

## Key Concepts in REST APIs

### Resources

REST APIs expose resources (e.g., users, posts, products) identified by unique URLs, typically in the form:

        https://api.example.com/users/123

### HTTP Methods

RESTful APIs rely on standard HTTP methods to perform actions on resources:

- **GET**: Retrieve a resource.
- **POST**: Create a new resource.
- **PUT**: Update an existing resource.
- **PATCH**: Partially update a resource.
- **DELETE**: Remove a resource.

!!! note
    REST APIs use HTTP methods to interact with resources. Each method is associated with a specific type of action.

### Stateless

REST APIs are stateless, meaning each request is self-contained and independent. The server does not retain information about previous requests.

!!! info
    Because REST APIs are stateless, any necessary context (like authentication tokens) must be included in each request.

### Response Format

REST APIs often use [JSON (JavaScript Object Notation)](../../file_formats/json.md) for requests and responses because it’s lightweight and widely supported.

[XML](../../file_formats/xml.md) can also be used.

### Status Codes

HTTP status codes are used to indicate the outcome of a request:

- **200**: Success
- **201**: Resource created
- **400**: Bad request
- **401**: Unauthorized
- **404**: Resource not found
- **500**: Internal server error

!!! tip
    Always include meaningful status codes in your API responses to help developers understand the outcome of their requests.

---

## Authentication

![ByteByteGo - REST API authentication methods](https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F152fcb14-3acf-4027-a3c2-307f4596ef4b_3000x3900.png){target=_blank}

## Tools to Build REST APIs

### Programming Frameworks

The following frameworks can be used, depending on your preferred language:

#### JavaScript/TypeScript

- [Express.js](https://expressjs.com/): Minimal and flexible Node.js framework.
- [NestJS](https://nestjs.com/): A progressive Node.js framework built on TypeScript.

#### Python

- [Flask](https://flask.palletsprojects.com/): Lightweight and simple.
- [Django REST Framework (DRF)](https://www.django-rest-framework.org/): Full-featured and powerful for Django-based projects.
- [FastAPI](https://fastapi.tiangolo.com/): High-performance framework with built-in validation.

##### Comparison

!!! cite

    [Comparison of Flask, Django, and FastAPI: Advantages, Disadvantages, and Use Cases](https://medium.com/@tubelwj/comparison-of-flask-django-and-fastapi-advantages-disadvantages-and-use-cases-63e7c692382a){target=_blank}

| Framework | Advantages                                                                | Disadvantages                                                                    | Use Cases                                                                                   |
|-----------|---------------------------------------------------------------------------|----------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| Flask     | - Lightweight and easy to learn                                           | - Fewer built-in features, requiring additional libraries                        | - Small to medium-sized projects                                                            |
|           | - Highly flexible, allowing custom tool and library choices               | - Lack of standardized project structures                                        | - Rapid prototyping and simple APIs                                                         |
|           | - Supports rapid development                                              |                                                                                  | - Quick iteration projects                                                                  |
| Django    | - All-in-one framework with powerful built-in features (ORM, auth, admin) | - Steeper learning curve                                                         | - Large and complex web applications                                                        |
|           | - Comprehensive documentation and active community support                | - Lower performance due to rich features                                         | - Content management systems (CMS)                                                          |
|           | - Scalable with flexible extension mechanisms                             |                                                                                  | - Applications requiring reliability, security, and admin functionality                     |
| FastAPI   | - High performance with asynchronous programming                          | - Relatively new, with potentially less mature solutions and community support   | - High-performance APIs and real-time applications                                          |
|           | - Automatically generates interactive documentation                       | - Steeper learning curve for developers unfamiliar with asynchronous programming | - Applications handling a large number of concurrent requests with low latency              |
|           | - Type annotations enhance readability and maintainability                |                                                                                  | - Prototypes, Proof of Concepts (POC), and rapid development projects requiring type safety |



#### Java

- [Spring Boot](https://spring.io/projects/spring-boot): Enterprise-level and highly configurable.

#### PHP

- [Laravel](https://laravel.com/): Popular with built-in support for REST APIs.

#### Ruby

- [Ruby on Rails](https://rubyonrails.org/): Convention-over-configuration framework.

#### Go

- [Gin](https://gin-gonic.com/): Lightweight and fast.

#### C sharp

- [ASP.NET Core](https://dotnet.microsoft.com/apps/aspnet): Powerful for .NET applications.

!!! info

    Your choice of framework depends on factors like the programming language you’re comfortable with, the size of your project, and performance requirements.

### No-Code/Low-Code Platforms

- **Postman API Builder**: A GUI-based API builder that allows you to prototype and test REST APIs without writing much code.
- **Swagger/OpenAPI**: Define and document APIs with a YAML or JSON specification, and use tools like SwaggerHub to generate code automatically.

!!! tip

    For quick prototyping, tools like Postman or Swagger can help you build an API without writing much code.

### Cloud Platforms

- **AWS API Gateway**: Build and deploy REST APIs without managing servers.
- **Google Cloud Endpoints**: Easily manage APIs for Google Cloud.
- **Azure API Management**: Develop REST APIs on Microsoft’s cloud.

!!! tip

    Using a cloud platform can save you time and effort, especially for large-scale or high-traffic APIs.

---

## Tools for Testing REST APIs

- **Postman**: User-friendly interface to test API requests and responses.
- **cURL**: Command-line tool for making API calls.
- **Insomnia**: Lightweight API testing tool.
- **Swagger UI**: Interactive documentation for testing API endpoints directly in the browser.

!!! note

    Regular testing ensures your API is functioning correctly and meets client expectations.

---

## How to Start Building a REST API

### Plan Your Resources and Endpoints

Example:

- **Resource**: `Users`
- Endpoints:
    - `GET /users` → Get all users
    - `POST /users` → Create a user
    - `GET /users/{id}` → Get a user by ID

### Choose a Framework

Select a framework based on your preferred programming language and project needs.

### Set Up Your Development Environment

Install the required tools, such as a programming language, framework, and package manager.

### Design the API

- Use tools like Swagger/OpenAPI to plan and document endpoints.

### Build and Test

- Write your API logic.Build and Test
- Test with tools like Postman or cURL.

### Deploy

- Use cloud services like AWS, Heroku, or Docker containers to host your API.

!!! tip

    Start small, test thoroughly, and iterate based on user feedback.
