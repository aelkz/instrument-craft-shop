FROM sdaschner/open-liberty:javaee8-tracing-jdk11-b2

COPY openliberty/server.xml $CONFIG_DIR

COPY target/instrument-craft-shop.war $DEPLOYMENT_DIR
