# bash-startup-files

I use this collection of bash startup files at work and decided to share it since I haven't seen anything like it online. My team  develops various applications across a set of servers soon to be in the triple digits. I'm mostly stuck doing sysadmin and  troubleshooting work, pitching in to help with design and coding when others get stuck or I have bandwidth to help. Most of our servers are Linux and all but a couple of those are configured as standard servers, without a GUI like Gnome and accessible primarily via ssh. This means I depend heavily on command line Linux tools to get my work done, so it makes sense for me to invest some time in improving my bash setup. Plus working within the limitations of "pure" bash to create genuinely useful tools is challenging and occasionally fun. 


Here are some features of this file collection.

1. This collection is structured so that only the .bashrc file needs to reside on the server (in the user root). This requires that you have a common data store mounted in the same location on all your servers, a super useful thing to have anyway. When loaded the .bashrc attempts to access a set of config files through this common data store and if it finds them, it uses them to set up a bash environment. If it can't access those files, it falls back to using some basic configuration built into the .bashrc.   
2. I often change the configuration files referenced by .bashrc (e.g. adding functions or aliases or changing the prompt). Because these are stored in a common share, you change them in just one place. If you change the .bashrc for some reason, then normally you'd have to copy the new .bashrc to every server you use. That got annoying quickly for me. So I implemented a simple versioning system where the .bashrc file has a version embedded in it and the common data store has a version config file. When the .bashrc is loaded, it checks that version config file and if the version in that file is newer than the one in the .bashrc, the script notifies the user and writes out a script to update the local .bashrc with the latest version (stored in the common share). I searched the internet and didn't find anyone doing this exactly, though the post at this link https://prefetch.net/blog/2017/01/25/automatically-updating-your-bashrc-when-you-log-into-a-server/ describes something similar using git. I work in a pretty locked down environment and we don't have easy access to a git system, plus I like my system better anyway.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them


### Installing

A step by step series of examples that tell you how to get a development env running


## Deployment

Add additional notes about how to deploy this on a live system

## Contributing



## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments
