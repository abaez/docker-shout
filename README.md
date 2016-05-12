# abaez/shout
## A docker container for [shout][1] by [Alejandro Baez][3]

### DESCRIPTION
A quick setup on getting shout running with very little configurations. To make things easy for myself, I have added a systemd service unit file. It runs:

``` Dockerfile
ENTRYPOINT ["shout", "--home", "/config"]
CMD ["start"]
```

as the entrypoint and command. You can find more commands from the [help][2]

### USAGE
You can run this container in 3 ways: `docker run`, `docker-compose`, or sytemd unit service file. All of the three methods need both the port you will be using for the container and the volume location of the `/config` path.


#### docker run
To run using docker, naturally you would use the setup below, with of course changing the volume and port location:

```
docker run -v ./config:/config -p "9000:9000" abaez/shout
```

#### docker-compose
Here you shouldn't have too much issue getting running. All you will need to do is run `docker-compose up` and you good to go.

_Note_: that it actually builds the container instead of fetching it directly from docker hub.

__Note__: don't forget to change those volume and port settings on the `docker-compose.yml` file...

#### systemd unit file
If you want to have the docker container running automagically on your machine, then this is the place to go.

All you need to do is first copy to your systemd service directory and do a quick `daemon-reload`.

```
sudo cp <docker-shout source>/shout@.service /usr/lib/systemd/system
sudo systemctl daemon-reload
```

Finally, you can append to your systemd setup by giving the port you desire for the service to run under.

```
sudo systemctl enable shout@9000
```

You don't need to declare the user, since it uses the default user of the running service. However, if you want to be specific, you can always change the user by replacing `%u`, on line 8 with your user, in the unit file.

Lastly, unless you want the volume configuration auto mounted to `/etc/shout`, change the volume location to whatever desire you may have.

[1]: https://github.com/erming/shout
[2]: http://shout-irc.com/docs/getting_started/usage.html
[3]: https://twitter.com/a_baez
