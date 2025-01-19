# Stage 1: Build Stage
FROM python:3.13-slim AS builder

WORKDIR /app/backend

# Set environment variables to optimize Python
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1 

# Install dependencies
COPY requirenments.txt .
RUN pip install --no-cache-dir --user -r requirenments.txt

# Stage 2: Production stage
FROM python:3.13-slim
 
WORKDIR /app/backend

# Copy the Python dependencies from the builder stage
COPY --from=builder /usr/local/lib/python3.13/site-packages/ /usr/local/lib/python3.13/site-packages/
COPY --from=builder /usr/local/bin/ /usr/local/bin/
# Copy application source code
COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]