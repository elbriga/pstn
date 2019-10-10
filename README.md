# Asterisk pstn
Docker asterisk simulating PSTN based on andrius/asterisk Alpine Linux images

# Running
```bash
docker run --rm -ti --name pstn --hostname pstn elbriga/pstn
```

# Alternative user
It is possible to specifty other than asterisk user to start through environment variable `ASTERISK_USER`:

```bash
docker run -ti --rm -e ASTERISK_USER=root andrius/asterisk
```

# Running a shell
```bash
docker exec -ti pstn /bin/sh
```
