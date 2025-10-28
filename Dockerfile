FROM pytorch/pytorch
RUN pip install marker-pdf[full]
RUN pip install -U uvicorn fastapi python-multipart
EXPOSE 8001
ENTRYPOINT ["marker_server", "--port", "8001"]

