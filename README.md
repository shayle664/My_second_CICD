# Flask CI/CD Pipeline with Jenkins and Docker

This project demonstrates a basic Flask application deployed using a Jenkins CI/CD pipeline and Docker. The pipeline is configured to automatically build, run, test, and optionally push a Docker image to Docker Hub.

## 📁 Project Structure
.
├── app/
│ └── app.py # Flask application source code
├── Dockerfile # Dockerfile to build the Flask app container
├── Jenkinsfile # Jenkins pipeline configuration
├── README.md # Project documentation (this file)
├── TASK.md # Task description or planning notes
├── temp/ # Temporary folder (usage TBD)
└── .gitignore # Git ignored files list


## 🧪 App Overview

- A minimal Flask app located in `app/app.py`
- Exposes HTTP on port `5002`

## 🚀 Jenkins Pipeline Overview

The `Jenkinsfile` defines the following pipeline stages:

1. **Clone Repo**: Checks out the repository code from Git.
2. **Build Docker Image**: Builds a Docker image for the Flask app using the provided `Dockerfile`.
3. **Run Container**: Launches the container on port `5002:5002`.
4. **Test**: Performs an HTTP request to `http://localhost:5002` and saves the result as `result.html`.
5. **Push to Docker Hub**: Placeholder stage to push the built image to Docker Hub (credentials should be added in Jenkins).
6. **Cleanup**: Stops the running container.
