# EV Smart Range Assistant 🚗🔋  
*A smart assistant app to mitigate electric vehicle (EV) mileage anxiety*  
**Status: Work in Progress 🚧**

## Overview

This project aims to develop a mobile application for electric vehicle (EV) users that intelligently predicts battery range and optimizes route planning to reduce mileage anxiety. The app integrates real-time environmental and behavioral data into a predictive model that suggests the most energy-efficient routes, charging options, and driving strategies.

> 🌱 This project is currently in development as part of a course-based team assignment. Stay tuned for updates.

---

## 🔍 Key Features (Planned)

- **Dynamic Range Prediction**  
  Incorporates live weather, road type, traffic, battery condition, and driver behavior to estimate range more accurately than native vehicle systems.

- **Route & Charging Optimization**  
  Suggests optimal paths with charging station recommendations based on estimated consumption and availability.

- **Personalized Insights**  
  Learns from user driving patterns and tailors predictions over time.

- **Mobile-first Experience**  
  Designed for iOS and Android with a clean, intuitive UI/UX.

---

## 🧠 Model Inputs

| Category         | Variables Considered                                | Source         |
|------------------|------------------------------------------------------|----------------|
| **Weather**      | Temperature, wind, rain, snow                        | Real-time APIs |
| **Load**         | Passengers, luggage, etc.                            | User/device    |
| **Road**         | Traffic, incline, road type                          | Mapping APIs   |
| **Battery**      | Make, condition, state of charge                     | Vehicle data   |
| **Driver**       | AC/music usage, acceleration patterns, etc.         | User behavior  |
| **Charging**     | Nearest stations, real-time availability             | Charging APIs  |

---

## ⚙️ Technologies (Planned)

- **Frontend**: Swift / React Native
- **Backend**: Python (Flask or FastAPI), Node.js (TBD)
- **ML Model**: Custom regression or neural network (in development)
- **Deployment**: Cloud-based + optional on-device model for real-time prediction
- **Data Sources**: OpenWeatherMap, Google Maps API, vehicle API (if available)

---

## 📦 Project Structure (Planned)

