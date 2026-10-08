from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def root():
    return {"message": "Hello depuis un conteneur déployé par Terraform"}