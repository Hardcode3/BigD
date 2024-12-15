# API

## What is an API?

### Technical definition

API stands for Application Programming Interface.
An API is a set of protocols, routines and tools for building applications.
It defines how different software components should interact with each other.
This way, developers can create applications that are able to interact with other applications, services or platforms through a standardized interface.

### Non-technical definition

Say developers of a new weather app want to populate their app with weather data.
They obviously cannot get and process weather data, because they are not meteorologists.
Therefore meterologists devs create an API to provide weather information for everyone who wants to embed their weather data.
By using the weather API, developers are able to create a new weather app.

## How to interact with an API?

As prerequisits:

1. Find the documentation of the API
2. Find a language supporting HTTP protocol

Then:

1. Request information to the API using (or not) an access token
2. Let the API process the request and send back the response
3. Process the response in the application (can be JSON, XML for [REST APIs](./rest_api.md) for instance)

## API Architecture Styles

!!! cite "Refs"

    [YouTube - ByteByteGo - Top 6 Most Popular API Architecture Styles](https://youtu.be/4vLxWqE94l4)

![API Architecture Styles](https://pbs.twimg.com/media/GOzmnA7bEAANSCR?format=jpg&name=large){target=_blank}

## Refs

- [Katalon - 10 Popular API Examples: A Full List](https://katalon.com/resources-center/blog/api-examples){target=_blank}
