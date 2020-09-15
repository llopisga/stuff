# Testing



# SSH

SSH uses public/private key pairs, so id_rsa is your RSA private key (based on prime numbers), which is more secure than your id_dsa DSA private key (based on exponents). Keep your private keys safe and share your id_rsa.pub and id_dsa.pub public keys broadly.

# DSA is insecure
DSA has a guessable parameter if your computer's random number generator is sub par, which will reveal your secret key. ECDSA (DSA's elliptical curve upgrade) is similarly vulnerable. Even with good random numbers, DSA has other strength concernsPDF (these are also found in Diffie-Hellman).

OpenSSH creates insecure 1024 bit keys(workaround) and now disables DSA by default.

# Use Ed25519 when possible
Elliptic curve cryptography offers increased complexity with smaller key sizes. Ed25519 (based on the complexity of plane-modeled elliptical curves) is the preferred implementation due to its assumed lack of meddling (leaked documents show that the US NSA weakens crypto standards).

Unfortunately, Ed25519 is still rather new, requiring OpenSSH 6.5 or GnuPG 2.1 (see the full list).

ssh-keygen -t ed25519 -a 100

# Use RSA with 4096 bits when Ed25519 is unavailable
RSA key sizes of 4096 bits should have comparable complexity to Ed25519.

Ed25519 is still preferred to RSA due to a worry that RSA may be vulnerable to the same strength concerns as DSA, though applying that exploit to RSA is expected to be considerably harder.

ssh-keygen -t rsa -b 4096 -o -a 100
