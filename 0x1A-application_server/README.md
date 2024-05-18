
# Application Server Setup

This project focuses on setting up an application server using Flask, Gunicorn, and Nginx. The goal is to deploy a web application (an Airbnb clone) and a RESTful API, ensuring proper routing and configuration for each component.

## Task 0: Set Up Development with Python

1. Clone your AirBnB clone v2 repository.
2. Configure `web_flask/0-hello_route.py` to serve content from the route `/airbnb-onepage/` on port `5000`.
3. Run the Flask app: `python3 -m web_flask.0-hello_route`.

## Task 1: Set Up Production with Gunicorn

1. Install Gunicorn and any required libraries.
2. Configure Gunicorn to serve the same content as Task 0, but on port `5000`.
3. Bind Gunicorn to `0.0.0.0:5000` using: `gunicorn --bind 0.0.0.0:5000 web_flask.0-hello_route:app`.

## Task 2: Serve a Page with Nginx

1. Configure Nginx to serve the page from the route `/airbnb-onepage/`.
2. Nginx should proxy requests to the process listening on port `5000`.

## Task 3: Add a Route with Query Parameters

1. Expand the web application to include a route that handles query parameters.
2. Configure Nginx to proxy requests to this route to a Gunicorn instance listening on port `5001`.

## Task 4: Serve Your AirBnB Clone

1. Clone your AirBnB clone v4 repository.
2. Configure Gunicorn to serve content from `web_dynamic/2-hbnb.py` on port `5003`.
3. Configure Nginx to serve static assets from `web_dynamic/static/` and proxy requests to Gunicorn.

## Usage

- Make sure all required packages are installed (`Flask`, `Gunicorn`, `Nginx`).
- Follow the setup instructions for each task to configure and run the application server.

## Notes

- Ensure that your servers are properly configured and running to avoid conflicts and errors.
- Pay attention to file paths, port numbers, and configuration details to ensure smooth operation.

