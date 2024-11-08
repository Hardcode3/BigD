# JSON

!!! info

    JSON (JavaScript Object Notation) is a lightweight data interchange format that is easy for humans to read and write, and easy for machines to parse and generate. It is widely used for representing structured data and exchanging information between a server and a client, or between different components of an application.

## 1. **Data Structure:**

JSON represents data as key-value pairs, similar to a dictionary in Python or an object in JavaScript. The basic data structures in JSON are:

- **Object:** An unordered collection of key-value pairs enclosed in curly braces `{}`. Each key must be a string, and the values can be strings, numbers, objects, arrays, boolean, or `null`.

Example:

```json
{
    "name": "John",
    "age": 30,
    "isStudent": false,
    "grades": [85, 90, 78],
    "address": {
        "city": "New York",
        "zipCode": "10001"
    }
}
```

- **Array:** An ordered list of values enclosed in square brackets `[]`. Elements can be strings, numbers, objects, arrays, booleans, or `null`.

Example:

```json
[1, 2, "three", true, {"name": "Alice"}, null]
```

## 2. **Syntax Rules:**

- Data is represented as key-value pairs.
- Keys and strings must be enclosed in double quotation marks.
- Values can be strings, numbers, objects, arrays, booleans (`true` or `false`), or `null`.
- Whitespace (spaces, tabs, newlines) is allowed and ignored.
- The JSON data structure is hierarchical, allowing nesting of objects and arrays.

## 3. **Example:**

Here's a simple example of a JSON object representing information about a person:

```json
{
    "name": "Alice",
    "age": 25,
    "isStudent": true,
    "courses": ["Math", "History"],
    "address": {
        "city": "Boston",
        "zipCode": "02108"
    }
}
```

## 4. **Usage:**

JSON is commonly used for configuration files, web APIs (as a data interchange format), and exchanging data between a server and a client. It is also used in various programming languages for representing and working with structured data.

## 5. **Parsing and Generating JSON:**

In most programming languages, libraries or built-in functions are available to parse JSON from a string into a data structure and vice versa. For example, in Python, the [`json`](https://docs.python.org/3/library/json.html) module provides functions like `json.loads()` for parsing and `json.dumps()` for generating JSON.

In C++, you can use the [`nlohmann::json`](https://github.com/nlohmann/json) library.

## 6. **JSON Schema:**

JSON Schema is a specification for defining the structure of JSON data. It provides a way to validate the structure of JSON documents, ensuring they conform to a predefined schema.

## 7. **Security Considerations:**

While JSON is a versatile and widely used data format, it's important to be aware of security considerations, especially when dealing with user input. Avoid using `eval()` or similar functions to parse JSON from untrusted sources, as it can lead to security vulnerabilities (JSON Injection). Instead, use dedicated JSON parsing functions provided by the language or library.

Understanding the basic principles of JSON is essential for working with web development, APIs, and many other data exchange scenarios in modern software development.
