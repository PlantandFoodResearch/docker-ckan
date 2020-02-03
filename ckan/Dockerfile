FROM openknowledge/ckan-base:2.8

LABEL maintainer="Andrew Watkins <andrew.watkins@plantandfood.co.nz>"
RUN apk add --no-cache openldap-dev ssmtp libldap2-dev libsasl2-dev libssl-dev
ADD ssmtp.conf /etc/ssmtp

# Install CKAN extensions
RUN pip install ckantoolkit && \
    pip install ckanapi && \
    pip install ckanext_scheming && \
    pip install ckanext-pdfview

# install LDAP Extension
RUN pip install -e git+https://github.com/NaturalHistoryMuseum/ckanext-ldap.git@ckan-upgrade-2.8.0a#egg=ckanext-ldap

# install PFR language file for collections
RUN pip install -e git+https://github.com/avowkind/ckanext-en-pfr.git#egg=ckanext-en-pfr && \
    cp -r /srv/app/src/ckanext-en-pfr/en_PFR/* /srv/app/src/ckan/ckan/i18n/en_AU

# install PFR extension for customisations
RUN pip install -e git+https://github.com/PlantandFoodResearch/ckanext-pfr.git#egg=ckanext-pfr

# COPY over our default production.ini file.
ADD production.ini /srv/app/

# Set timezone
ARG TZ
RUN echo $TZ > /etc/timezone
RUN cp /usr/share/zoneinfo/$TZ /etc/localtime

# Install the extension(s) you wrote for your own project
# RUN pip install -e git+https://github.com/your-org/ckanext-your-extension.git@v1.0.0#egg=ckanext-your-extension

# Apply any patches needed to CKAN core or any of the built extensions (not the
# runtime mounted ones)
# See https://github.com/okfn/docker-ckan#applying-patches
# COPY patches ${APP_DIR}/patches

# RUN for d in $APP_DIR/patches/*; do \
#         if [ -d $d ]; then \
#             for f in `ls $d/*.patch | sort -g`; do \
#                 cd $SRC_DIR/`basename "$d"` && echo "$0: Applying patch $f to $SRC_DIR/`basename $d`"; patch -p1 < "$f" ; \
#             done ; \
#         fi ; \
#     done
