niklasskoldmark/rancid-git
==========================

Autobuild repository for [niklasskoldmark/docker-rancid-git](https://github.com/niklasskoldmark/docker-rancid-git)

Builds a image of [rancid-git/](http://dotwaffle.github.io/rancid-git/) which is based on [RANCID](http://www.shrubbery.net/rancid/)

Run it like this:

`docker run \
--name rancid-gittest \
-v /your/rancid-git/home/configs:/root/configs \
-v /your/rancid-git/home/secrets:/root/secrets \
-v /your/rancid-git/home/data:/var/lib/rancid/data \
-v /your/rancid-git/home/logs:/var/lib/rancid/logs \
-v /your/rancid-git/home/tmp:/var/lib/rancid/tmp \
niklasskoldmark/rancid-gittest`

(Replace /your/rancid-git/home with the directory you want to store your data in)
