# SpaceX Launches 🚀

A Flutter app for viewing information about SpaceX rockets and their launches.

Allows you to scroll through the rockets in a slider, view a list of launches for the selected rocket, and open the mission page on Wikipedia.

## Features

- Displays a list of all SpaceX rockets (with images).
- Slider with visual highlighting of the selected rocket.
- Pagination and current page indicator.
- List of all launches for the selected rocket:
- Launch date and time.
- Mission name.
- Cosmodrome name.
- Click on a Wikipedia link when you click on a launch.
- Support for a dark color scheme with corporate colors.

## Technologies Used

- **Flutter (latest stable)** — cross-platform development.
- **Riverpod** — state management.
- **Dio/HTTP** — requests to the SpaceX REST API (v3).
- **intl** — date and time formatting.
- **url_launcher** — opening Wikipedia in a browser.
- **Custom Theme (AppColors)** — single color scheme.

## Data source

[SpaceX REST API v3](https://docs.spacexdata.com/)

---
