# Use CPU-only PyTorch image
FROM python:3.13.9-trixie

# Set working directory
WORKDIR /app


# Clone the marker repo
#RUN pip install marker-pdf[full]
RUN pip install torch torchvision torchaudio
RUN pip install marker-pdf
RUN pip install uvicorn fastapi python-multipart


COPY test.pdf /test.pdf
RUN marker_single /test.pdf

# Expose API port
EXPOSE 8081

# Run the API server
CMD ["marker_server", "--port", "8081", "--host", "0.0.0.0"]

