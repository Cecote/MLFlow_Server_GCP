#!/bin/bash 

mlflow db upgrade $POSTGRESQL_URL
mlflow server \
  --host 0.0.0.0 \
  --port 8080 \
  --backend-store-uri $POSTGRESQL_URL \
  --artifacts-destination $STORAGE_URL

sleep 10

mlflow models serve -m 'models:/House Prices/Production' -p 5001
