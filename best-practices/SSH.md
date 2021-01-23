# SSH

## Table of contents
1. [Introduction](#introduction)
2. [Cryptography](#cryptography)
    1. [DSA is insecure](#subparagraph1)
    2. [Use Ed25519 when possible](#subparagraph2)
    3. [Use RSA with 4096 bits when Ed25519 is unavailable](#subparagraph3)
3. [Bibliography](#bibliography)


## 1. Introduction <a name="introduction"></a>

SSH uses public/private key pairs, so id_rsa is your RSA private key (based on prime numbers), which is more secure than your id_dsa DSA private key (based on exponents). Keep your private keys safe and share your id_rsa.pub and id_dsa.pub public keys broadly.

## 2. Cryptography <a name="cryptography"></a>

### 2.1. DSA is insecure <a name="subparagraph1"></a>
DSA has a guessable parameter if your computer's random number generator is sub par, which will reveal your secret key. ECDSA (DSA's elliptical curve upgrade) is similarly vulnerable. Even with good random numbers, DSA has other strength concernsPDF (these are also found in Diffie-Hellman).

OpenSSH creates insecure 1024 bit keys(workaround) and now disables DSA by default.

### 2.2. Use Ed25519 when possible <a name="subparagraph2"></a>
Elliptic curve cryptography offers increased complexity with smaller key sizes. Ed25519 (based on the complexity of plane-modeled elliptical curves) is the preferred implementation due to its assumed lack of meddling (leaked documents show that the US NSA weakens crypto standards).

Unfortunately, Ed25519 is still rather new, requiring OpenSSH 6.5 or GnuPG 2.1 (see the full list).

```shell
ssh-keygen -t ed25519 -a 100
```

### 2.3. Use RSA with 4096 bits when Ed25519 is unavailable <a name="subparagraph3"></a>
RSA key sizes of 4096 bits should have comparable complexity to Ed25519.

Ed25519 is still preferred to RSA due to a worry that RSA may be vulnerable to the same strength concerns as DSA, though applying that exploit to RSA is expected to be considerably harder.


```shell
ssh-keygen -t rsa -b 4096 -o -a 100
```

## 3. Bibliography <a name="bibliography"></a>

- https://stackoverflow.com/a/27855045/13719509