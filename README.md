# Rails without jobs

This is an experiment in trying to extract worker logic from a Rails app.

## Dependencies

Docker, Docker compose, and make.

## Play with it

Setup this sample app by running `make setup`.

Then you can spin up the containers with `make serve`.

In a separate terminal, you can issue post request and see the workers response
in the logs. For example:

```console
curl -X POST http://localhost:3000/process -d "complexity=hard" 
```
