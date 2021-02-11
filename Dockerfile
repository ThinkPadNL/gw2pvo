FROM python:3.9-slim

RUN pip install gw2pvo && \
apt update -y -qq && apt install vim-tiny -y -qq && apt install wget -y -qq  && \
rm -f /usr/local/lib/python3.9/site-packages/gw2pvo/__main__.py && wget https://github.com/ThinkPadNL/gw2pvo/raw/master/gw2pvo/__main__.py -P /usr/local/lib/python3.9/site-packages/gw2pvo/ && \
rm -f /usr/local/lib/python3.9/site-packages/gw2pvo/gw_api.py && wget https://github.com/ThinkPadNL/gw2pvo/raw/master/gw2pvo/gw_api.py -P /usr/local/lib/python3.9/site-packages/gw2pvo/

ENV GW_STATION_ID="" \
    GW_ACCOUNT="" \
    GW_PASSWORD="" \
    PVO_SYSTEM_ID="" \
    PVO_API_KEY="" \
    PVO_INTERVAL="5" \
    DARKSKY_API_KEY="none" \
    LOG="info" \
    CITY="Amsterdam" \
    TZ="Europe/Amsterdam"

ENTRYPOINT exec gw2pvo \
    --gw-station-id ${GW_STATION_ID} \
    --gw-account ${GW_ACCOUNT} \
    --gw-password ${GW_PASSWORD} \
    --pvo-system-id ${PVO_SYSTEM_ID} \
    --pvo-api-key ${PVO_API_KEY} \
    --pvo-interval ${PVO_INTERVAL} \
    --darksky-api-key ${DARKSKY_API_KEY} \
    --log ${LOG} \
    --city ${CITY} \
    --skip-offline \
    --pv-voltage
