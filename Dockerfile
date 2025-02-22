FROM ubuntu:18.04
USER root
WORKDIR /TLE

RUN apt-get update
RUN apt-get install -y git apt-utils sqlite3
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y libcairo2-dev libgirepository1.0-dev libpango1.0-dev pkg-config python3-dev gir1.2-pango-1.0 python3.7-venv libpython3.7-dev libjpeg-dev zlib1g-dev python3-pip
RUN python3.7 -m pip install poetry lockfile
RUN python3.7 -m pip install --upgrade keyrings.alt

COPY ./poetry.lock ./poetry.lock
COPY ./pyproject.toml ./pyproject.toml
COPY . .

RUN chmod +x run.sh

ENTRYPOINT ["/TLE/run.sh"]
