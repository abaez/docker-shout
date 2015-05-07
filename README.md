# abaez/shout
## A docker container for [shout](https://github.com/erming/shout) by [Alejandro Baez](https://twitter.com/a_baez)

### DESCRIPTION
A quick setup on getting shout running with very little configurations.
To make things easy for myself, I have added a systemd service unit file.

### USAGE
You can run this container in 3 ways: `docker run`, `docker-compose`, or
sytemd unit service file. All of the three methods need both the port you will
be using for the container and the volume location of the `/config` path.


#### docker run
To run using docker, naturally you would use the setup below, with of course
changing the volume and port location:

```
docker run -v ./config:/config -p "9000:9000" abaez/shout
```

#### docker-compose
Here you shouldn't have too much issue getting running. All you will need to
do is run `docker-compose up` and you good to go.

_Note_: that it actually builds the container instead of fetching it directly
from docker hub.

__Note__: don't forget to change those volume and port settings on the
`docker-compose.yml` file...

#### systemd unit file
If you want to have the docker container running automagically on your
machine, then this is the place to go. All you need to do is make a soft link
of the `docker-shout@.service` file with the port you want to the multi-user
directory of your systemd set up.

```
sudo ln -s docker-shout@.service \
/etc/systemd/system/multi-user.target.wants/docker-shout@9000.service
```
You don't need to declare the user, since it uses the default user of the
running service. However, if you want to be specific, you can always change
the user by replacing `%u`, on line 8 with your user, in the unit file.
