# Custom Docker Images

A collection of purpose-built Docker images for various testing and development use cases.

## 📦 Available Images

### [insecure-openssh](./insecure-openssh/)

Docker images for generating intentionally insecure SSH keys using older OpenSSH versions.

- **Versions:** 6.6, 7.1, 7.2
- **Use Case:** Security testing, vulnerability reproduction, educational purposes
- **Status:** ⚠️ Testing only - not for production

**Quick Start:**

```shell
cd insecure-openssh
docker build --tag insecure-openssh:6.6 --file insecure-openssh-66.dockerfile .
```

[📖 Full Documentation](./insecure-openssh/README.md)

---

## 🚀 Getting Started

### Prerequisites

- Docker installed on your machine
- Basic knowledge of Docker and command line

### General Usage

Each subdirectory contains:

- One or more Dockerfiles for different versions
- A dedicated README with detailed instructions
- Build and usage examples

Navigate to the specific image directory for detailed documentation.

## 📁 Repository Structure

```
custom-docker-images/
├── README.md                    # This file
├── LICENSE                      # Repository license
└── insecure-openssh/           # Insecure OpenSSH images
    ├── README.md               # Detailed documentation
    ├── insecure-openssh-66.dockerfile
    ├── insecure-openssh-71.dockerfile
    └── insecure-openssh-72.dockerfile
```

## 🛠️ Contributing

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for detailed information on:

- Adding new Docker images
- Documentation standards
- Pull request process
- License agreement (GPL v3)

## ⚠️ Security Notice

Some images in this repository are intentionally insecure and designed for testing purposes only. Always:

- Review the image's README before use
- Never use testing images in production
- Delete generated artifacts (keys, certificates, etc.) after testing
- Follow your organization's security policies

## 📋 Planned Images

Future additions may include:

- Legacy SSL/TLS certificate generators
- Testing databases with known vulnerabilities
- Minimal development environments
- CI/CD testing utilities

## 📄 License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

### Copyright and Warranty

Copyright (C) 2024 Justin Alex Paramanandan

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

## 🤝 Support

For issues, questions, or contributions:

- Open an issue in this repository
- Check individual image READMEs for specific documentation
- Review existing issues before creating new ones

---

**Note:** All images in this repository are provided as-is for testing and educational purposes. Use at your own risk.
