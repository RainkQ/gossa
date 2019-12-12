gossa
=============

![e](https://user-images.githubusercontent.com/760637/64541706-a3163080-d322-11e9-85ef-a4d8001fa6a5.gif)

[![build status](https://github.com/pldubouilh/gossa/workflows/ci/badge.svg)](https://github.com/pldubouilh/gossa/actions)
[![docker build status](https://img.shields.io/docker/cloud/build/pldubouilh/gossa.svg?logo=docker)](https://hub.docker.com/r/pldubouilh/gossa)
[![docker pulls](https://img.shields.io/docker/pulls/pldubouilh/gossa.svg?logo=docker)](https://hub.docker.com/r/pldubouilh/gossa)
[![github downloads](https://img.shields.io/github/downloads/pldubouilh/gossa/total.svg?logo=github)](https://github.com/pldubouilh/gossa/releases)

a fast and simple webserver for your files, that's dependency-free and with under 200 lines of code, easy to review.

a [simple UI](https://github.com/pldubouilh/gossa-ui) comes as default, featuring :

  * 🔍 files/directories browser
  * 📩 drag-and-drop file/directory uploader
  * 🗺️ files handling - move/rename/delete
  * 📸 picture browser
  * 📽️ video streaming
  * ✍️ simple text editor
  * ⌨️ keyboard shortcuts
  * 🥂 speed - will easily fill available bandwidth
  * 🔒 safe - easy/secure multi account setup

### build
built blobs are available on the [release page](https://github.com/pldubouilh/gossa/releases) - or simply `make build` this repo.

### usage
```sh
% ./gossa --help

% ./gossa -h 192.168.100.33 ~/storage
```

### fancier setups
release images are pushed to [dockerhub](https://hub.docker.com/r/pldubouilh/gossa), e.g. :

```sh
# pull from dockerhub and run
% sudo docker run -v ~/LocalDirToShare:/shared -p 8001:8001 pldubouilh/gossa
```

in a do-one-thing-well mindset, HTTPS and authentication has been left to middlewares and proxies. for instance [caddy](https://caddyserver.com/) handles this very well - have a look at this small [caddy config](https://github.com/pldubouilh/gossa/blob/master/support/Caddyfile) with authentication and option for HTTPS that works along with gossa.

### shortcuts
the default UI is fully usable by through keyboard/UI shortcuts - press `Ctrl/Cmd + h` to see them all.

