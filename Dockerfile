# get shiny server and R from the rocker project
FROM rocker/r-ver:4.1.0

# system libraries of general use. i'm not sure if these are needed
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev 

# moving the working directory from home into a directory just for the app
WORKDIR /home/app

# installing renv so that we can use the renv.lock file to install the rest of the packages
RUN R -e "install.packages('renv')"

# pull in a manifest file and restore it
COPY renv.lock ./
RUN R -e 'renv::restore()'

# copy the app into the working directory
COPY app ./

# this may or may not help with setting the app to work on the correct port?
COPY Rprofile.site /usr/lib/R/etc/

EXPOSE 3838

CMD ["R", "-e", "shiny::runApp('/home/app', host='0.0.0.0', port=3838)"]