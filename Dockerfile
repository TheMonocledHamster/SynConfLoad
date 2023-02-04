FROM python:3.10-slim

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip

# Install Python packages
COPY requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt && \
    rm requirements.txt && \
    mkdir /load

# Copy source code
WORKDIR /load
COPY arrival_rates      \
     /load              \
     loadserver.py      \
     ./

# Set user
USER nobody

# Expose uvicorn port
EXPOSE 8000

# Run the application
CMD ["uvicorn", "load.loadserver:app", "--host", "0.0.0.0", "--port", "8000"]
