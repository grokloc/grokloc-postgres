GrokLOC application server PostgreSQL support

[![License:MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![ci](https://github.com/grokloc/grokloc-postgres/workflows/Docker/badge.svg)
[![builds.sr.ht status](https://builds.sr.ht/~grokloc/grokloc-postgres.svg)](https://builds.sr.ht/~grokloc/grokloc-postgres?)
[![CircleCI](https://circleci.com/gh/grokloc/grokloc-postgres.svg?style=svg)](https://circleci.com/gh/grokloc/grokloc-postgres)
# What is this?

The goal of GrokLOC is to eventually provide a code comprehension platform founded upon
structured representations of code-as-data.

This repository provides PostgreSQL support, including schemas and Docker automation.

# Links

This project home is on SourceHut:

https://git.sr.ht/~grokloc/grokloc-postgres

The issue tracker:

https://todo.sr.ht/~grokloc/grokloc-postgres

The discussion list:

https://lists.sr.ht/~grokloc/grokloc-postgres

There is also a GitHub presence, but only for browsing:

https://github.com/grokloc/grokloc-postgres

This GitHub mirror may be temporarily lagging the SourceHut repository.

# Contributor's Guide

See `CONTRIBUTORS.md` in this repository.

# Image Versioning

This repository manages a Docker image. The tag `dev` is applied to the most
recent version, but there is also a fixed version tag pushed to Docker Hub that
you can reference. See `VERSION` in `Makefile`. Periodically, similarly
versioned images for other parts of GrokLOC may make reference to versions
pushed from this repository by the GrokLOC team, so you should be mindful of
these tags. Outdated tags may be removed from Docker Hub.

# Status

This repository is under active development but hasn't reached a useful state yet.

We are committed to working in public while we make progress.

Feel free to look around and exercise the freedoms granted to you by the MIT license.

