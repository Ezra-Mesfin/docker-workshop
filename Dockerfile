# 1. Use a lightweight Python 3.13 image
FROM python:3.13-slim

# 2. Install 'uv' inside the container
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# 3. Set the working directory
WORKDIR /app

# 4. Copy your dependency files first (for faster builds)
COPY pyproject.toml uv.lock ./

# 5. Install dependencies into the container
# --system tells uv to install into the container's global python
RUN uv pip install --system -r pyproject.toml

# 6. Copy your code folders
COPY pipeline/ ./pipeline/

# 7. Set the command to run your script
# We use ENTRYPOINT so we can pass the "month" argument easily
ENTRYPOINT ["python", "pipeline/pipeline.py"]