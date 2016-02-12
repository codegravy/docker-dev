# Setup

First build Dockerfile.base with the tag dev_base

Then build Dockerfile with the tag dev

Finally make sure both scripts in `bin/` are executable, and add them to
`$PATH`

You should be able to use `setup <name> [git repo]` to start a project
container, and `teardown <name>` to bind up a wip branch and destroy the
container.  If a container with the name docker-host exists, then it will
automatically link to it and support docker commands inside.
