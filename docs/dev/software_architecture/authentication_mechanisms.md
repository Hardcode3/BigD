# Authentication Mechanisms

![bytebytego_gif](https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F969687e0-8f52-4a52-9ecc-40ab5e56aa2b_1280x1700.jpeg){target=_blank}

## SSH Keys

SSH (Secure Shell) is a network protocol used to securely connect to remote machines over an unsecured network.
It encrypts the connection and provides various mechanisms for authentication and data transfer.

![bytebytego_gif](https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_lossy/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fed998b2e-fbc8-4c3c-b339-eca5abd85ce3_1289x1536.gif){target=_blank}

## OAuth Tokens

Tokens that provide limited access to user data on third-party applications

## SSL Certificates

Digital certificates ensure secure and encrypted communication between servers and clients

## Credentials

User authentication information is used to verify and grant access to various systems and services

## Encoding vs Encryption vs Tokenization

![bytebytego_gif](https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_lossy/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F4860ad53-ec02-4f95-8845-992fae6cf16f_1536x1536.gif){target=_blank}

!!! quote "ByteByteGo.com"

    - Encoding

        Encoding converts data into a different format using a scheme that can be easily reversed. Examples include Base64 encoding, which encodes binary data into ASCII characters, making it easier to transmit data over media that are designed to deal with textual data.

        Encoding is not meant for securing data. The encoded data can be easily decoded using the same scheme without the need for a key.

    - Encryption

        Encryption involves complex algorithms that use keys for transforming data. Encryption can be symmetric (using the same key for encryption and decryption) or asymmetric (using a public key for encryption and a private key for decryption).

        Encryption is designed to protect data confidentiality by transforming readable data (plaintext) into an unreadable format (ciphertext) using an algorithm and a secret key. Only those with the correct key can decrypt and access the original data.

    - Tokenization

        Tokenization is the process of substituting sensitive data with non-sensitive placeholders called tokens. The mapping between the original data and the token is stored securely in a token vault. These tokens can be used in various systems and processes without exposing the original data, reducing the risk of data breaches.


        Tokenization is often used for protecting credit card information, personal identification numbers, and other sensitive data. Tokenization is highly secure, as the tokens do not contain any part of the original data and thus cannot be reverse-engineered to reveal the original data. It is particularly useful for compliance with regulations like PCI DSS (Payment Card Industry Data Security Standard).
