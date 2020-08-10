FROM frolvlad/alpine-python3 AS build-env

RUN pip install --upgrade pip
ENV BUILD_DIR=/sn-extensions
RUN mkdir $BUILD_DIR
COPY . $BUILD_DIR
RUN cd $BUILD_DIR \
  && pip install -r requirements.txt \
  && python build_repo.py

############### Build step done ###############
FROM nginx
RUN rm -rf /usr/share/nginx/html
COPY --from=build-env /sn-extensions/public /usr/share/nginx/html
RUN ls /usr/share/nginx/html
