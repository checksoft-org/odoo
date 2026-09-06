FROM odoo:19.0

USER root

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

USER odoo

EXPOSE 8069

ENTRYPOINT ["/entrypoint.sh"]