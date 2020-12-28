FROM python:3.8.7

RUN apt-get update && \
    apt-get install -y --no-install-recommends libgl1

WORKDIR /app

COPY requirements-pip-tools.txt ./
RUN pip install -r requirements-pip-tools.txt

COPY requirements.txt .
RUN pip-sync

COPY saved_models ./saved_models
COPY *.py .
COPY pbarrs.npz .
