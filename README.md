## Docker build and config to get cas overlay "just working" without tinkering.

When attempting to use apereo/cas 5.x I ran into a number of problems:

* The JSON loader not being present in the web app
* Certain builds crashing when adding it
* Default configuration not allowing any services.


This build will simply come up and start accepting CAS authentication from any app http or https://

### To Build

```
./build.sh
```

OR

```
docker build -t cas . 
```

### To Run

This example uses port 8443 for the SSL port and 8080 for http

```
./runcas.sh
```

OR

```
docker run -p 8080:8080 -p 8443:8443 -t "cas" 
```

Thanks!