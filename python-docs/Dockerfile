FROM httpd:2.4-alpine as builder

# Desempaquetar el directorio python-3.6.8-docs-html
# en /home
ADD ./python-3.6.8-docs-html.tar.bz2 /home
# Reemplazar el directorio /usr/local/apache2/htdocs
# por el directorio /home/python-3.6.8-docs-html
RUN rm -r /usr/local/apache2/htdocs
RUN ln -s -T /home/python-3.6.8-docs-html /usr/local/apache2/htdocs
# Agregar permisos de lectura y ejecucion para cualquier usuario
RUN chmod -R o+rx /usr/local/apache2/htdocs

FROM httpd:2.4-alpine

# Copy the result obtained in builder stage
# The target files are in /usr/local/apache2/htdocs directory
COPY --from=builder /usr/local/apache2/htdocs /usr/local/apache2/htdocs
