---
title: "Python Docs"
output:
  html_document:
    keep_md: yes
---

## Version 1


```bash
cat v1.Dockerfile
```

```
## FROM httpd:2.4
## 
## # Desempaquetar el directorio python-3.6.8-docs-html
## # en /home
## ADD ./python-3.6.8-docs-html.tar.bz2 /home
## # Reemplazar el directorio /usr/local/apache2/htdocs
## # por el directorio /home/python-3.6.8-docs-html
## RUN rm -r /usr/local/apache2/htdocs
## RUN mv /home/python-3.6.8-docs-html /usr/local/apache2/htdocs
## # Agregar permisos de lectura y ejecucion para cualquier usuario
## RUN chmod -R o+rx /usr/local/apache2/htdocs
```



```bash
docker build --file v1.Dockerfile --tag example-build-v1  .
```

```
## Sending build context to Docker daemon  6.851MB
## Step 1/5 : FROM httpd:2.4
##  ---> ef1dc54703e2
## Step 2/5 : ADD ./python-3.6.8-docs-html.tar.bz2 /home
##  ---> Using cache
##  ---> 1471b29dc334
## Step 3/5 : RUN rm -r /usr/local/apache2/htdocs
##  ---> Using cache
##  ---> e550937185c1
## Step 4/5 : RUN mv /home/python-3.6.8-docs-html /usr/local/apache2/htdocs
##  ---> Using cache
##  ---> 6cc68aca48fc
## Step 5/5 : RUN chmod -R o+rx /usr/local/apache2/htdocs
##  ---> Using cache
##  ---> e9b4971210f8
## Successfully built e9b4971210f8
## Successfully tagged example-build-v1:latest
```


```bash
docker history example-build-v1
```

```
## IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
## e9b4971210f8        4 weeks ago         /bin/sh -c chmod -R o+rx /usr/local/apache2/…   43.8MB              
## 6cc68aca48fc        4 weeks ago         /bin/sh -c mv /home/python-3.6.8-docs-html /…   43.8MB              
## e550937185c1        5 weeks ago         /bin/sh -c rm -r /usr/local/apache2/htdocs      0B                  
## 1471b29dc334        5 weeks ago         /bin/sh -c #(nop) ADD file:a40a68a9368f38ccc…   43.8MB              
## ef1dc54703e2        2 months ago        /bin/sh -c #(nop)  CMD ["httpd-foreground"]     0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  EXPOSE 80                    0B                  
## <missing>           2 months ago        /bin/sh -c #(nop) COPY file:8b68ac010cb13f58…   133B                
## <missing>           2 months ago        /bin/sh -c set -eux;   savedAptMark="$(apt-m…   43.1MB              
## <missing>           2 months ago        /bin/sh -c #(nop)  ENV APACHE_DIST_URLS=http…   0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  ENV HTTPD_PATCHES=           0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  ENV HTTPD_SHA256=3498dc5c…   0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  ENV HTTPD_VERSION=2.4.37     0B                  
## <missing>           2 months ago        /bin/sh -c set -eux;  apt-get update;  apt-g…   33.3MB              
## <missing>           2 months ago        /bin/sh -c #(nop) WORKDIR /usr/local/apache2    0B                  
## <missing>           2 months ago        /bin/sh -c mkdir -p "$HTTPD_PREFIX"  && chow…   0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  ENV PATH=/usr/local/apach…   0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  ENV HTTPD_PREFIX=/usr/loc…   0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  CMD ["bash"]                 0B                  
## <missing>           2 months ago        /bin/sh -c #(nop) ADD file:6d6f6f123e45697d3…   55.3MB
```

## Version 2


```bash
cat v2.Dockerfile
```

```
## FROM httpd:2.4
## 
## # Desempaquetar el directorio python-3.6.8-docs-html
## # en /home
## ADD ./python-3.6.8-docs-html.tar.bz2 /home
## # Reemplazar el directorio /usr/local/apache2/htdocs
## # por el directorio /home/python-3.6.8-docs-html
## RUN rm -r /usr/local/apache2/htdocs && \
##     mv /home/python-3.6.8-docs-html /usr/local/apache2/htdocs && \
## # Agregar permisos de lectura y ejecucion para cualquier usuario
##     chmod -R o+rx /usr/local/apache2/htdocs
```


```bash
docker build --file v2.Dockerfile --tag example-build-v2  .
```

```
## Sending build context to Docker daemon  6.851MB
## Step 1/3 : FROM httpd:2.4
##  ---> ef1dc54703e2
## Step 2/3 : ADD ./python-3.6.8-docs-html.tar.bz2 /home
##  ---> Using cache
##  ---> 1471b29dc334
## Step 3/3 : RUN rm -r /usr/local/apache2/htdocs &&     mv /home/python-3.6.8-docs-html /usr/local/apache2/htdocs &&     chmod -R o+rx /usr/local/apache2/htdocs
##  ---> Using cache
##  ---> 738d78519ea4
## Successfully built 738d78519ea4
## Successfully tagged example-build-v2:latest
```



```bash
docker history example-build-v2
```

```
## IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
## 738d78519ea4        4 weeks ago         /bin/sh -c rm -r /usr/local/apache2/htdocs &…   43.8MB              
## 1471b29dc334        5 weeks ago         /bin/sh -c #(nop) ADD file:a40a68a9368f38ccc…   43.8MB              
## ef1dc54703e2        2 months ago        /bin/sh -c #(nop)  CMD ["httpd-foreground"]     0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  EXPOSE 80                    0B                  
## <missing>           2 months ago        /bin/sh -c #(nop) COPY file:8b68ac010cb13f58…   133B                
## <missing>           2 months ago        /bin/sh -c set -eux;   savedAptMark="$(apt-m…   43.1MB              
## <missing>           2 months ago        /bin/sh -c #(nop)  ENV APACHE_DIST_URLS=http…   0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  ENV HTTPD_PATCHES=           0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  ENV HTTPD_SHA256=3498dc5c…   0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  ENV HTTPD_VERSION=2.4.37     0B                  
## <missing>           2 months ago        /bin/sh -c set -eux;  apt-get update;  apt-g…   33.3MB              
## <missing>           2 months ago        /bin/sh -c #(nop) WORKDIR /usr/local/apache2    0B                  
## <missing>           2 months ago        /bin/sh -c mkdir -p "$HTTPD_PREFIX"  && chow…   0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  ENV PATH=/usr/local/apach…   0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  ENV HTTPD_PREFIX=/usr/loc…   0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  CMD ["bash"]                 0B                  
## <missing>           2 months ago        /bin/sh -c #(nop) ADD file:6d6f6f123e45697d3…   55.3MB
```


## Version 3


```bash
cat v3.Dockerfile
```

```
## FROM httpd:2.4 as builder
## 
## # Desempaquetar el directorio python-3.6.8-docs-html
## # en /home
## ADD ./python-3.6.8-docs-html.tar.bz2 /home
## # Reemplazar el directorio /usr/local/apache2/htdocs
## # por el directorio /home/python-3.6.8-docs-html
## RUN rm -r /usr/local/apache2/htdocs
## RUN mv /home/python-3.6.8-docs-html /usr/local/apache2/htdocs
## # Agregar permisos de lectura y ejecucion para cualquier usuario
## RUN chmod -R o+rx /usr/local/apache2/htdocs
## 
## FROM httpd:2.4
## 
## # Copy the result obtained in builder stage
## # The target files are in /usr/local/apache2/htdocs directory
## COPY --from=builder /usr/local/apache2/htdocs /usr/local/apache2/htdocs
```


```bash
docker build --file v3.Dockerfile --tag example-build-v3  .
```

```
## Sending build context to Docker daemon  6.851MB
## Step 1/7 : FROM httpd:2.4 as builder
##  ---> ef1dc54703e2
## Step 2/7 : ADD ./python-3.6.8-docs-html.tar.bz2 /home
##  ---> Using cache
##  ---> 1471b29dc334
## Step 3/7 : RUN rm -r /usr/local/apache2/htdocs
##  ---> Using cache
##  ---> e550937185c1
## Step 4/7 : RUN mv /home/python-3.6.8-docs-html /usr/local/apache2/htdocs
##  ---> Using cache
##  ---> 6cc68aca48fc
## Step 5/7 : RUN chmod -R o+rx /usr/local/apache2/htdocs
##  ---> Using cache
##  ---> e9b4971210f8
## Step 6/7 : FROM httpd:2.4
##  ---> ef1dc54703e2
## Step 7/7 : COPY --from=builder /usr/local/apache2/htdocs /usr/local/apache2/htdocs
##  ---> Using cache
##  ---> 31d90b36701e
## Successfully built 31d90b36701e
## Successfully tagged example-build-v3:latest
```



```bash
docker history example-build-v3
```

```
## IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
## 31d90b36701e        4 weeks ago         /bin/sh -c #(nop) COPY dir:7dfa4b59152468098…   43.8MB              
## ef1dc54703e2        2 months ago        /bin/sh -c #(nop)  CMD ["httpd-foreground"]     0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  EXPOSE 80                    0B                  
## <missing>           2 months ago        /bin/sh -c #(nop) COPY file:8b68ac010cb13f58…   133B                
## <missing>           2 months ago        /bin/sh -c set -eux;   savedAptMark="$(apt-m…   43.1MB              
## <missing>           2 months ago        /bin/sh -c #(nop)  ENV APACHE_DIST_URLS=http…   0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  ENV HTTPD_PATCHES=           0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  ENV HTTPD_SHA256=3498dc5c…   0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  ENV HTTPD_VERSION=2.4.37     0B                  
## <missing>           2 months ago        /bin/sh -c set -eux;  apt-get update;  apt-g…   33.3MB              
## <missing>           2 months ago        /bin/sh -c #(nop) WORKDIR /usr/local/apache2    0B                  
## <missing>           2 months ago        /bin/sh -c mkdir -p "$HTTPD_PREFIX"  && chow…   0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  ENV PATH=/usr/local/apach…   0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  ENV HTTPD_PREFIX=/usr/loc…   0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  CMD ["bash"]                 0B                  
## <missing>           2 months ago        /bin/sh -c #(nop) ADD file:6d6f6f123e45697d3…   55.3MB
```

## Version 4


```bash
cat v4.Dockerfile
```

```
## FROM httpd:2.4 as builder
## 
## # Desempaquetar el directorio python-3.6.8-docs-html
## # en /home
## ADD ./python-3.6.8-docs-html.tar.bz2 /home
## # Reemplazar el directorio /usr/local/apache2/htdocs
## # por el directorio /home/python-3.6.8-docs-html
## RUN rm -r /usr/local/apache2/htdocs
## RUN ln -s -T /home/python-3.6.8-docs-html /usr/local/apache2/htdocs
## # Agregar permisos de lectura y ejecucion para cualquier usuario
## RUN chmod -R o+rx /usr/local/apache2/htdocs
## 
## FROM httpd:2.4-alpine
## 
## # Copy the result obtained in builder stage
## # The target files are in /usr/local/apache2/htdocs directory
## COPY --from=builder /usr/local/apache2/htdocs /usr/local/apache2/htdocs
```


```bash
docker build --file v4.Dockerfile --tag example-build-v4  .
```

```
## Sending build context to Docker daemon  6.851MB
## Step 1/7 : FROM httpd:2.4 as builder
##  ---> ef1dc54703e2
## Step 2/7 : ADD ./python-3.6.8-docs-html.tar.bz2 /home
##  ---> Using cache
##  ---> 1471b29dc334
## Step 3/7 : RUN rm -r /usr/local/apache2/htdocs
##  ---> Using cache
##  ---> e550937185c1
## Step 4/7 : RUN ln -s -T /home/python-3.6.8-docs-html /usr/local/apache2/htdocs
##  ---> Using cache
##  ---> 79eba54f6e4a
## Step 5/7 : RUN chmod -R o+rx /usr/local/apache2/htdocs
##  ---> Using cache
##  ---> ea7b0e3121c7
## Step 6/7 : FROM httpd:2.4-alpine
##  ---> 07612f66b55b
## Step 7/7 : COPY --from=builder /usr/local/apache2/htdocs /usr/local/apache2/htdocs
##  ---> Using cache
##  ---> 7c0c003b0dab
## Successfully built 7c0c003b0dab
## Successfully tagged example-build-v4:latest
```



```bash
docker history example-build-v4
```

```
## IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
## 7c0c003b0dab        4 weeks ago         /bin/sh -c #(nop) COPY dir:06b29c2c10dc4c488…   43.8MB              
## 07612f66b55b        5 weeks ago         /bin/sh -c #(nop)  CMD ["httpd-foreground"]     0B                  
## <missing>           5 weeks ago         /bin/sh -c #(nop)  EXPOSE 80                    0B                  
## <missing>           5 weeks ago         /bin/sh -c #(nop) COPY file:8b68ac010cb13f58…   133B                
## <missing>           5 weeks ago         /bin/sh -c set -eux;   runDeps='   apr-dev  …   93.1MB              
## <missing>           5 weeks ago         /bin/sh -c #(nop)  ENV APACHE_DIST_URLS=http…   0B                  
## <missing>           5 weeks ago         /bin/sh -c #(nop)  ENV HTTPD_PATCHES=           0B                  
## <missing>           5 weeks ago         /bin/sh -c #(nop)  ENV HTTPD_SHA256=7dc65857…   0B                  
## <missing>           5 weeks ago         /bin/sh -c #(nop)  ENV HTTPD_VERSION=2.4.38     0B                  
## <missing>           2 months ago        /bin/sh -c #(nop) WORKDIR /usr/local/apache2    0B                  
## <missing>           2 months ago        /bin/sh -c mkdir -p "$HTTPD_PREFIX"  && chow…   0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  ENV PATH=/usr/local/apach…   0B                  
## <missing>           2 months ago        /bin/sh -c #(nop)  ENV HTTPD_PREFIX=/usr/loc…   0B                  
## <missing>           2 months ago        /bin/sh -c set -x  && addgroup -g 82 -S www-…   4.85kB              
## <missing>           2 months ago        /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B                  
## <missing>           2 months ago        /bin/sh -c #(nop) ADD file:2ff00caea4e83dfad…   4.41MB
```

## Resultado


```bash
docker images | grep example | sort --key=5 
```

```
## example-build-v4                      latest              7c0c003b0dab        4 weeks ago         141MB
## example-build-v3                      latest              31d90b36701e        4 weeks ago         175MB
## example-build-v2                      latest              738d78519ea4        4 weeks ago         219MB
## example-build-v1                      latest              e9b4971210f8        4 weeks ago         263MB
```

