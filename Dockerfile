FROM python:3.12-slim
RUN useradd -m -u 1000 user
WORKDIR /app
COPY api/requirements.txt /tmp/req.txt
RUN pip install --no-cache-dir -r /tmp/req.txt
COPY --chown=user . /app
RUN ln -s dist /app/web/public
USER user
ENV ATALAIA_CACHE=/app/data/cache
EXPOSE 7860
CMD uvicorn server:app --app-dir /app --host 0.0.0.0 --port ${PORT:-7860}
