#!/bin/sh

if [ -n "$PROXY_JSON" ]; then
    echo "Using the provided proxy json file"
    echo $PROXY_JSON > /app/proxy.json
fi

if [ -n "$PROXY_TMPL" ]; then
    echo "Using the provided proxy template file"
    echo $PROXY_TMPL > /app/proxy.tmpl
fi

if [ ! -e "/app/proxy.json" ]
then    
    dockerize -template /app/proxy.tmpl:/app/proxy.json java -jar /app/bin/launcher.jar /app/proxy.json
else
    java -jar /app/bin/launcher.jar /app/proxy.json
fi
