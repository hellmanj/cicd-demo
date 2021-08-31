# CI/CD POC Project Demo Service

This is a database-less rails application meant for deployment into kubernetes clusters for pipeline evaluation.

## Configuration and Use

The app can be deployed in two modes (frontend and backend) which is selected using [config/mode.yml](config/mode.yml)

Frontend mode exposes the `/guests` endpoint which makes a request to the backend found at the location specified in [config/backend.yml](config/backend.yml) and then presents the results in HTML.

Backend mode exposes `/guest_from_db` endpoint which responds with some JSON representing a list of guests.

[Dockerfile](Dockerfile) builds the app and exposes the endpoints on port 9000 in the resulting image.  

## Health Checks

A 200 response from the `/health` endpoint indicates the app is healthy and able to respond to requests independent of health status of external dependencies.

A 200 response from the `/deep_health` endpoint indicates that the app and all external dependencies are healthy.  The results of each check are listed in a table in the response. 