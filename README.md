![axon](https://cdn.discordapp.com/avatars/465353539363930123/946f04e6812a3f0b3494fccf499d2d45.webp?size=20) Hey @Shyim, yes, you can use it for a lightweight base and quick start time (objective)
----
![shyim](https://cdn.discordapp.com/avatars/186129546574168065/65bafe1ccfb009894eb69f2ec7068e27.webp?size=20) Does it make difference If I build the image by own and push it to Dockerhub?
----
![david](https://cdn.discordapp.com/avatars/776846008898158672/089f12fc50c4407b96d633f9f0a66163.webp?size=20) You need to do it and time it (in different circumstances) to find out.  I build a custom image in GitLab and keep it in their registry.  It has -base + the stuff from the -python and -c++ chunks, plus some of my own stuff.  It weighs in at ~2.75Gb.  And it takes longer to start up the workspace than just using -full.  And I attribute that (without any way of actually knowing) to time spent getting it over the network at each workspace launch.  Might be different from docker hub itself.  And I also assume that Gitpod caches it's own images locally, which speeds those things up quite a bit too.
----
