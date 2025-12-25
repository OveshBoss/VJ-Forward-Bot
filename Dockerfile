# Buster ki jagah Bullseye (Debian 11) use karein jo stable hai
FROM python:3.10-slim-bullseye

# System updates aur git installation
RUN apt-get update && apt-get install -y git

# Work directory set karein
WORKDIR /app
COPY . .

# Requirements install karein
RUN pip3 install -U pip && pip3 install -U -r requirements.txt

# Render port fix aur bot start
CMD gunicorn app:app --bind 0.0.0.0:$PORT --daemon && python3 main.py
