FROM python:3.10.8-slim-buster

# apt-get update aur git install ko ek saath karein (cache optimize karne ke liye)
RUN apt-get update && apt-get install -y git

# requirements ko copy karein
COPY requirements.txt /requirements.txt

# pip upgrade aur installation
RUN pip3 install -U pip && pip3 install -U -r requirements.txt

# work directory set karein
WORKDIR /VJ-Forward-Bot
COPY . /VJ-Forward-Bot

# Render port fix aur dono apps ko ek saath chalane ke liye
CMD gunicorn app:app --bind 0.0.0.0:$PORT --daemon && python3 main.py
