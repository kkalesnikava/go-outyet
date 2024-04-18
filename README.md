# go-outyet

> Inspired by: https://github.com/golang/example/blob/master/outyet/main.go

A sample Go app which answers the question: "Is Go 1.22.0 out yet?"

## How to test it locally

Checkout the repo, switch to the repository root and run the following command to build an image:

```
docker build -t local:outyet .
```

Run docker image:
```
docker run --rm -p 8080:8080 -d --name outyet local:outyet
```

Check container logs if the app is running:
```
docker logs outyet
```

To access the app open your browser and type `http://localhost:8080` on the URL or run curl command on your terminal:
```
curl localhost:8080
```

![Alt text](image.png)

Stop container by running:
```
docker stop outyet
```
## GHA workflow
GitHub workflow builds and pushes an image to GitHub packages after pushing a new repository tag

## Deployment
> Source: https://skaffold.dev/docs/quickstart/#use-skaffold-for-continuous-development

Start minikube:
```
minikube start --profile custom
skaffold config set --global local-cluster true
eval $(minikube -p custom docker-env)
```

Run the following command to use Skaffold for continuous development:
```
skaffold dev
```
Run on the terminal:
```
minikube tunnel -p custom
```
Open your browser at `http://localhost:8080` and browse the app webpage
