# https://docs.docker.com/reference/dockerfile/

FROM astral/uv:python3.12-bookworm-slim

WORKDIR /app

COPY . .

RUN uv sync

WORKDIR /app/rsdc

ENV DJANGO_STATIC_ROOT='/static'
ENV DJANGO_ALLOW_LOCALHOST='True'

RUN uv run manage.py collectstatic

VOLUME ["/static"]

EXPOSE 8000

ENTRYPOINT ["uv", "run", "daphne", "-b", "0.0.0.0", "-p", "8000", "rsdc.asgi:application"]
