FROM python:3.11-slim

USER root

RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    python3-dev \
    libldap2-dev \
    libsasl2-dev \
    libssl-dev \
    libpq-dev \
    libxml2-dev \
    libxslt1-dev \
    libjpeg-dev \
    zlib1g-dev \
    libffi-dev \
    postgresql-client \
    wkhtmltopdf \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/odoo

COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

COPY . .

RUN chmod +x odoo-bin

EXPOSE 8069

CMD python odoo-bin \
    --db_host="${DB_HOST}" \
    --db_port="${DB_PORT:-5432}" \
    --db_user="${DB_USER}" \
    --db_password="${DB_PASSWORD}" \
    --database="${DB_NAME}"