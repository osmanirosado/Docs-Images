FROM bash:5.0 as builder

# La imagen de bash:5.0 se usa en lugar de la imagen de 
# httpd:2.4-alpine en la etapa de preparacion. Se toma
# esta decision porque la imagen de bash trae el comando
# unzip instalado mientras la otra imagen no.

# No se descompacta automaticamente con ADD
# porque no soporta archivos zip 

# Copiar el paquete
COPY ./django-docs-1.11-en.zip /home

# Desempaquetar los archivos de la documentacion
RUN mkdir /home/docs
RUN unzip /home/django-docs-1.11-en.zip -d /home/docs
# Agregar permisos de lectura y ejecucion para cualquier usuario
# Esto es necesario para que el servidor httpd tenga acceso a los archivos
RUN chmod -R o+rx /home/docs

FROM httpd:2.4-alpine

# Copy the result obtained in builder stage
# The target files are in /usr/local/apache2/htdocs directory
COPY --from=builder /home/docs /usr/local/apache2/htdocs/
