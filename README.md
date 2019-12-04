Install commandbox

https://commandbox.ortusbooks.com/setup/installation


Install dependancies

```
$ box install
```

Start engine (u6)
```
$ box start cfengine=adobe@2018.0.06
```

Will start up a server on http://127.0.0.1:8585/ (if the port is free)

Clear the template cache, run the tests. Note timings then run a few more times (without clearing the cache again)

Shutdown server once done 

```
box stop
```

move onto a different engine version.

Start engine (u5)
```
$ box start cfengine=adobe@2018.0.05
```


Start engine (u4)
```
$ box start cfengine=adobe@2018.0.04
```