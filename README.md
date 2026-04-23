# My New Project

This repository is a beginner-friendly Express backend starter that is ready for:

- local Node.js runs
- containerization with Docker
- deployment with Jenkins on AWS EC2
- automated EC2 deployment with GitHub Actions

## Project structure

```text
my-new-project/
├── .github/workflows/docker-deploy.yml
├── Dockerfile
├── Jenkinsfile
├── docker-compose.yml
├── index.js
└── package.json
```

## Run locally

```bash
npm install
npm start
```

Open:

- `http://localhost:3000`
- `http://localhost:3000/health`

## Run with Docker

```bash
docker build -t my-new-project:latest .
docker run -d -p 3000:3000 --name my-new-project-app my-new-project:latest
```

You can also use the helper scripts:

```bash
npm run docker:build
npm run docker:run
```

To stop and remove the container:

```bash
npm run docker:stop
```

## Run with Docker Compose

```bash
docker compose up --build
```

The compose setup builds and uses the project image `my-new-project:latest`.

## Jenkins setup summary

1. Create an EC2 Ubuntu instance.
2. Open inbound ports `22`, `8080`, and `3000`.
3. Install Docker on EC2.
4. Run Jenkins in Docker with port `8080`.
5. Install Suggested Plugins plus `Docker` and `Docker Pipeline`.
6. Create a Pipeline job that reads `Jenkinsfile` from SCM.

## GitHub Actions setup

Add these GitHub repository secrets:

- `EC2_HOST`
- `EC2_USER`
- `EC2_SSH_KEY`

The workflow in `.github/workflows/docker-deploy.yml` deploys the app to your EC2 machine on every push to `main`.

## Important note

If your GitHub repository is private, cloning from EC2 will need extra authentication such as a deploy key or token.
