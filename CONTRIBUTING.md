# Contributing to Custom Docker Images

Thank you for your interest in contributing to this project! We welcome contributions that add new Docker images, improve existing ones, or enhance documentation.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How to Contribute](#how-to-contribute)
- [Adding a New Docker Image](#adding-a-new-docker-image)
- [Documentation Standards](#documentation-standards)
- [Pull Request Process](#pull-request-process)
- [License Agreement](#license-agreement)

## Code of Conduct

Please be respectful and constructive in all interactions. We aim to maintain a welcoming and inclusive environment for all contributors.

## How to Contribute

### Reporting Issues

- Check existing issues before creating a new one
- Provide detailed information about the problem
- Include steps to reproduce if applicable
- Specify which Docker image is affected

### Suggesting Enhancements

- Open an issue to discuss your idea first
- Explain the use case and benefits
- Consider security implications for testing-oriented images

## Adding a New Docker Image

When contributing a new Docker image, follow these guidelines:

### 1. Directory Structure

Create a new directory with a descriptive name:

```
custom-docker-images/
└── your-image-name/
    ├── README.md
    ├── Dockerfile (or versioned dockerfiles)
    └── (any additional files)
```

### 2. Dockerfile Requirements

- Use clear, well-commented Dockerfiles
- Pin base image versions for reproducibility
- Follow Docker best practices (multi-stage builds, layer optimization)
- Include appropriate LABEL metadata:

  ```dockerfile
  LABEL maintainer="your-email@example.com"
  LABEL version="1.0"
  LABEL description="Brief description of the image"
  ```

### 3. Documentation Standards

Each image directory must include a `README.md` with:

#### Required Sections

- **About** - Purpose and use case
- **Prerequisites** - Required tools and knowledge
- **Quick Start** - Condensed commands for experienced users
- **Build Instructions** - Step-by-step build process
- **Usage Instructions** - How to run and use the image
- **Examples** - Concrete usage examples
- **Troubleshooting** - Common issues and solutions

#### Optional but Recommended

- Version comparison table
- Security notices/warnings
- References and links
- Cleanup instructions

#### Example Template

```markdown
## About
[Description and purpose]

## Quick Start
[One-liner or short command sequence]

## Prerequisites
- Requirement 1
- Requirement 2

## Build Instructions
[Step-by-step guide]

## Usage
[How to use the image]

## Examples
[Concrete examples]

## Troubleshooting
[Common issues]
```

### 4. Versioning

- Use semantic versioning for image tags
- Provide separate Dockerfiles for different versions if needed
- Clearly document version differences

### 5. Security Considerations

- **If the image is intentionally insecure** (for testing):
  - Add prominent warnings in the README
  - Include `⚠️ Testing only - not for production` status
  - Document the security implications
  
- **For production-ready images**:
  - Follow security best practices
  - Keep dependencies updated
  - Document any security considerations

## Pull Request Process

1. **Fork the repository** and create a new branch from `main`

   ```bash
   git checkout -b feature/your-image-name
   ```

2. **Make your changes** following the guidelines above

3. **Test your Docker image**:
   - Ensure it builds successfully
   - Test all documented commands
   - Verify on multiple platforms if possible (amd64, arm64)

4. **Update the root README.md**:
   - Add your image to the "Available Images" section
   - Follow the existing format

5. **Commit your changes** with clear commit messages:

   ```bash
   git commit -m "Add [image-name] for [use case]"
   ```

6. **Push to your fork** and submit a pull request:

   ```bash
   git push origin feature/your-image-name
   ```

7. **Pull request checklist**:
   - [ ] Dockerfile(s) follow best practices
   - [ ] README.md is comprehensive and follows template
   - [ ] Root README.md is updated
   - [ ] Image builds successfully
   - [ ] All commands in documentation have been tested
   - [ ] Security warnings included (if applicable)

### Review Process

- Maintainers will review your PR for completeness and quality
- Be responsive to feedback and questions
- Once approved, your contribution will be merged

## License Agreement

**Important:** By contributing to this project, you agree that your contributions will be licensed under the **GNU General Public License v3.0**.

This means:

- Your code contributions become part of the GPL v3 licensed codebase
- You retain copyright of your contributions
- You grant others the rights specified in GPL v3
- Your contributions can be freely used, modified, and distributed under GPL v3 terms

### Copyright Notice

When adding substantial new files, consider including a copyright header:

```
# Copyright (C) [YEAR] [YOUR NAME]
#
# This file is part of Custom Docker Images.
#
# Custom Docker Images is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
```

## Questions?

If you have questions about contributing:

- Open an issue with the `question` label
- Review existing documentation and issues
- Reach out to maintainers

---

Thank you for contributing to Custom Docker Images! 🎉
