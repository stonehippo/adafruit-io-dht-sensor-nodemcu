# DHT temperature and humidity sensor over MQTT on an esp8266

A simple remote sensor for temparature and humidity, using a DHTxx module and an esp8266 microcontroller. The app connects to an MQTT broker and publishes to a topic the current temp, humidity, and a timestamp (based on SNTP clock sync).

While this app uses the MQTT broker provided by the [Adafruit IO](https://io.adafruit.com) service, any MQTT 3.1+ compatible broker should work. Edit the connection information in `mqtt.lua` if you want to move to a different broker.

## Application

These files need to get loaded onto the esp8266 for the application to work:

- `init.lua`: Runs at startup
- `app.lua`: The main application
- `net.lua`: Wifi setep
- `net_secrets.lua`: Wifi credentials. You need to create this file; see `net_secrets.template` for the format
- `mqtt.lua`: MQTTT broker connection and events
- `mqtt_secrets.lua`: MQTT crendentials and the topic to subscribe to. Use `mqtt_secrets.template` as the basis.

See https://nodemcu.readthedocs.io/en/latest/upload/ for help with uploading code.

## NodeMCU firmware

The application was built on NodeMCU firmware, and needs a few modules to run. Two appropriate firmware images are provided.

Both builds include the same libraries: dht, file, gpio, mqtt, net, node, rtcfifo, rtcmem, rtctime, sntp, tmr, uart, wifi, tls.

- `nodemcu-temp-sensor-512k.bin`: based on NodeMCU 1.5.4.1-final, and small enough to work on esp8266 512KB modules 
- `nodemcu-temp-sensor-1mb-plus.bin`: based on NodeMCU release (as of 8/15/2021), and meant for esp8266 modules with 1MB or more of flash

These builds have float support (which is a bit nicer for getting the values from the DHT).

See https://nodemcu.readthedocs.io/en/latest/flash/ for help with flashing firmware.


