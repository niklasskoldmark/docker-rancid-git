niklasskoldmark/rancid-git
==========================

Autobuild repository for [niklasskoldmark/docker-rancid-git](https://github.com/niklasskoldmark/docker-rancid-git)

Builds a image of [rancid-git/](http://dotwaffle.github.io/rancid-git/) which is based on [RANCID](http://www.shrubbery.net/rancid/)

Run it like this:

``docker run --name rancid-gittest niklasskoldmark/rancid-gittest``



# Volumes
*``-v /your/rancid-git/home/configs:/root/configs``
 Should contain your configuration file : [sample](https://github.com/niklasskoldmark/docker-rancid-git/blob/master/sample-rancid.conf), [doc](http://www.shrubbery.net/rancid/man/rancid.conf.5.html)
*``-v /your/rancid-git/home/secrets:/root/secrets``
 Should contain your cloginrc file [doc](http://www.shrubbery.net/rancid/man/cloginrc.5.html)
*``-v /your/rancid-git/home/data:/var/lib/rancid/data``
 Rancids data dir will be placed here
(Replace /your/rancid-git/home with the directory you want to store your data in)

# Optional Volumes
*``-v /your/rancid-git/home/logs:/var/lib/rancid/logs``
 For logs
*``-v /your/rancid-git/home/tmp:/var/lib/rancid/tmp``
 For temp