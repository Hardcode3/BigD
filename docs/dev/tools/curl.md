# Curl

!!! info "`curl` is a versatile command-line tool used to transfer data to or from a server."

    It supports various protocols, such as HTTP, HTTPS, FTP, and more.

---

## Basic Usage

### Get a URL's Content

```bash
curl https://example.com
```

This fetches the HTML content of the page at the specified URL and prints it to the terminal.

!!! note
    This command outputs the response directly to the terminal. Use the `-o` or `-O` options to save it to a file.

### Download a File

```bash
curl -O https://example.com/file.txt
```

The `-O` option saves the file with its original name.

### Save to a Specific File

```bash
curl -o myfile.txt https://example.com/file.txt
```

The `-o` option lets you specify the name for the saved file.

---

## Sending Data

### Send a GET Request with Parameters

```bash
curl "https://example.com?key1=value1&key2=value2"
```

!!! info
    URL parameters are included directly in the query string.

### Send a POST Request

```bash
curl -X POST -d "key1=value1&key2=value2" https://example.com
```

- `-X POST`: Specifies the HTTP method.
- `-d`: Sends data in the body of the request.

!!! warning
    Be cautious when sending sensitive data in plain text. Use HTTPS to secure your request.

### Send JSON Data

```bash
curl -X POST -H "Content-Type: application/json" -d '{"key1":"value1"}' https://example.com
```

- `-H`: Adds headers to the request.

!!! warning
    Many APIs require JSON data. Ensure the `Content-Type` header is set appropriately.

---

## Authentication

### Basic Authentication

```bash
curl -u username:password https://example.com
```

- `-u`: Adds a username and password.

!!! danger
    Avoid including sensitive credentials directly in the command, as they may be stored in shell history. Use environment variables for better security.

### Bearer Token Authentication

```bash
curl -H "Authorization: Bearer your_token" https://example.com
```

---

## Headers and Responses

### Include Response Headers

```bash
curl -i https://example.com
```

### Custom Request Headers

```bash
curl -H "Custom-Header: Value" https://example.com
```

!!! example
    Custom headers can be useful for testing APIs or adding metadata to your requests.

---

## Advanced Features

### Follow Redirects

```bash
curl -L https://example.com
```

!!! note
    Use the `-L` option to handle HTTP redirects automatically.

### Limit the Rate of Data Transfer

```bash
curl --limit-rate 100k https://example.com/file.txt
```

!!! info
    This is helpful for testing bandwidth limits or ensuring your server isn't overloaded.

### Upload a File

```bash
curl -T myfile.txt https://example.com/upload
```

!!! example
    Some servers may require authentication or specific headers for file uploads.

### Save Cookies

```bash
curl -c cookies.txt https://example.com
```

### Use Cookies

```bash
curl -b cookies.txt https://example.com
```

!!! tip
    Saved cookies are often required to maintain sessions with websites.

---

## Debugging

### Verbose Mode

```bash
curl -v https://example.com
```

!!! info
    Use verbose mode to see detailed information about the request and response, including headers and connection details.

### Show Only Response Code

```bash
curl -o /dev/null -s -w "%{http_code}\n" https://example.com
```

!!! note
    This is useful for monitoring server responses or scripting health checks.

---

## Helpful Tips

- Use `man curl` for the official manual.
- Add `--help` to see a list of options:
  ```bash
  curl --help
  ```
