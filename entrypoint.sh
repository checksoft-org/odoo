#!/bin/bash
set -e

exec odoo \
  --http-port="${PORT:-8069}" \
  --db_host="${ODOO_DB_HOST}" \
  --db_port="${ODOO_DB_PORT:-5432}" \
  --db_user="${ODOO_DB_USER}" \
  --db_password="${ODOO_DB_PASSWORD}"