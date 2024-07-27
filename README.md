# ADSB Setup

This is my custom ADSB setup I have running at home on a Raspberry Pi 5. I have it running with [Ultrafeeder](https://sdr-enthusiasts.gitbook.io/ads-b/intro/overview), and this currently feeds the following sources:

- Flightradar24
- FlightAware
- RadarBox
- ADSB.lol
- airplanes.live
- theairtraffic.com

## Prerequisites

- Raspberry Pi (4 or 5 works) with Raspberry Pi OS Lite installed (full desktop install will also work)
- Docker installed onto the Raspberry Pi
  - Note: For Pi5, just follow the debian instructions

## Environment Setup

If this is the first time doing this, follow the [Deploy Ultrafeeder](https://sdr-enthusiasts.gitbook.io/ads-b/foundations/deploy-ultrafeeder-container) doc, then follow the docs in the _Feeder Containers_ section for each feeder that needs to be setup.

Below is the current state of what I have setup in my `.envrc`, the ones that are blank must be set.

```
export ULTRAFEEDER_UUID=
export FEEDER_ALT_FT=
export FEEDER_ALT_M=
export FEEDER_LAT=
export FEEDER_LONG=
export FEEDER_TZ=
export FEEDER_NAME=
export ADSB_SDR_SERIAL=1090
export ADSB_SDR_GAIN=autogain
export ADSB_SDR_PPM=59
export FEEDER_HEYWHATSTHAT_ID=
export FEEDER_HEYWHATSTHAT_ALTS=
export ADSBFI_UUID=
export ADSB_LOL_UUID=
export AIRPLANES_LIVE_UUID=
export PLANESPOTTERS_UUID=
export AIRTRAFFIC_COM_UUID=

# FlightRadar24
export FR24_SHARING_KEY=
export FR24_RADAR_ID=

# FlightAware (PiAware)
export PIAWARE_FEEDER_ID=

# RadarBox
export RADARBOX_SHARING_KEY=
```

## Usage

```
docker compose up -d
```

## Monitoring

This also runs Prometheus and Grafana for monitoring of both the system and the ADSB data metrics. The monitoring stack includes:

- prometheus (port `9090`)
- grafana (UI on port `3000`)
- cadvisor (forwarded to port `8082`; container port `8080`)
- node-exporter (port `9100`)
