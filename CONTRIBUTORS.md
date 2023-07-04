# Contributing

As noted in `README.md`, this project is hosted at SourceHut:

The issue tracker:

https://todo.sr.ht/~grokloc/grokloc-postgres

The discussion list:

https://lists.sr.ht/~grokloc/grokloc-postgres

Please feel free to introduce yourself on the mailing list or create tickets
in the issue tracker. Obvious spam may be erased without notice or notification.

## Git Workflow

As this project is hosted on SourceHut, there are no "pull requests" or "merge requests"
as provided by other Git hosting services. This project is utilizing an email
workflow provided by `git` directly through patches. For more information, try:

https://git-send-email.io/

Contributors should

1. Clone this repository
2. Make changes
3. Squash the commits
4. Use the single squashed commit to provide a patch over email

All contributors, including the repository owner(s), shall follow this process;
the only activity as the project home will be merged patches.

It is strongly encouraged to GPG-sign your commits.

Send patches to `~grokloc/grokloc-postgres@lists.sr.ht`

A paste with some more tips with command examples is available at:

https://paste.sr.ht/~grokloc/35bcd3dcc8175efce83aaa4deb88eec4406a394f

## Development

(This section will become more detailed over time, please suggest changes)

### Requirements

- `docker`
- `make`
- optional: local PostgreSQL client support

`make docker`

which builds the local image.

`make up`

which brings the database up.

`make psql`

which provides a connection.

`make down`

which brings down the container and removes resources.

