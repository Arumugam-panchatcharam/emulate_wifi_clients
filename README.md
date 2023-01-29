# emulate_wifi_clients
To connect wifi client remotely with gateway for testing purpose

## Hardware Details

<html>
<body>
    <table>
        <thead>
            <tr>
                <th><em> Sno </em></th>
                <th><em> Desciption </em></th>
                <th><em> Hardware </em></th>
            </tr>
        </thead>
        <tbody>
           <tr>
                <td>1</td>
                <td><a href="https://amzn.eu/d/7bEEflm">ESP01</a></td>
                <td><img src="https://user-images.githubusercontent.com/35920764/215311101-b1d0838d-1a57-4958-9edb-771541cf217d.jpg" alt="ESP01" hieght=100 width=100/></td>
            </tr>
           <tr>
                <td>2</td>
                <td><a href="https://amzn.eu/d/b8dwMxA">ESP01 Flasher</a></td>
                <td><img src="https://user-images.githubusercontent.com/35920764/215311096-fbf11ad5-5f96-4dcc-9c67-1da77561f5de.jpg" alt="ESP01 Flasher" hieght=100 width=100/></td>
         </tr>
          <tr>
                <td>3</td>
                <td><a href="https://amzn.eu/d/cFOHzTH">BreadBoard + Power supply module </a></td>
                <td><img src="https://user-images.githubusercontent.com/35920764/215311099-e195f56e-45d8-428c-9c4b-2cd9d99b7a73.jpg" alt="breadboard power supply" hieght=100 width=100/></td>
            </tr>
            <tr>
                <td>4</td>
                <td>5 to 12V 1A power Aapter</td>
                <td><img src="https://user-images.githubusercontent.com/35920764/215311101-b1d0838d-1a57-4958-9edb-771541cf217d.jpg" alt="Power Adapter" hieght=100 width=100/></td>
            </tr>
        </tbody>
    </table>
</body>
</html>

## Setup Details
 ESP01 clients (802.11n) are used for remote wifi clients connect test. ESP01 is configured to bootup with AP mode. The enduser setup captive portal is used to configure WiFi credentials to connect as STA. additional Timeout params is added to reset ESP01 as AP again to make it available for testing.

<img src="https://user-images.githubusercontent.com/35920764/215311104-8ecd3458-9e1c-4678-b2e9-014fc77b0554.jpg" alt="TOP View" width="400"/> <img src="https://user-images.githubusercontent.com/35920764/215311102-0c1a7224-8ab7-469f-9983-4f498b97fc54.jpg" alt="Front View" width="400"/>

### 1. Flash ESP01

you can use the firmware provided in [Firmware](ESP_Tools/nodemcu-release-13-modules-2022-12-18-11-19-47-integer.bin) or you can custome build Node MCU firmware [nodemcu-build](https://nodemcu-build.com/). Enable WiFi manager/captive portal to configure WiFi credentials. The [NodeMCU-PyFlasher](ESP_Tools/NodeMCU-PyFlasher_executable.zip) can be used to flash ESP01 board.

`Update details on how to flash`

update the Accesspoint SSID `ESP_STA_001` for each ESP01 board.

### 2. Upload init.lua

upload the default [init](ESP_Tools/init.lua) program to run in ESP01.

### 3. Upload modified enuser_setup page

using ESPlorer we can upload the [enduser_setup.html.gz](ESP_Tools/enduser_setup.html.gz) into ESP01 board.

The Enduser setup page which is used in captive portal

## Host scripts

1. [scan clients](./scan_clients.sh) - To get the list of ESP01 clients
2. [Configure clients](./configure_clients.sh) - Run this script with SSID, PSK and Timeout (how long to connect to the client).




