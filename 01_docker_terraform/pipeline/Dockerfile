FROM python:3.13.11-slim
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/

WORKDIR /code
# With this command Docker for default is executed within the uv 
ENV PATH="/code/.venv/bin:$PATH"

# When we add a virtual environment within our docker container, we also need to append the necessary files to the uv.
WORKDIR /code
COPY pyproject.toml .python-version uv.lock ./

# IMPORTANT: If this command fails, it means there is an issue with the dependencies specified in the pyproject.toml and uv.lock files.
# so we need to figure out which dependency is causing the issue.
# Hint: Docker-desktop indicates the error in the build logs. 
RUN uv sync --locked

COPY ingest_data.py .

#RUN pip install pandas pyarrow

#WORKDIR /code
#COPY pipeline.py .

ENTRYPOINT ["python", "ingest_data.py"]

