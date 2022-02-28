# u-boot files of amlogic-s9xxx 5.10+ kernel

When using the 5.10+ kernel version, you need to copy the corresponding `u-boot-*.bin` file to `u-boot.ext` (TF/SD card boot file) and `u-boot.emmc` (EMMC boot file).

## Correspondence for Amlogic s9xxx tv box

<table cellpadding="0" cellspacing="0">
<tr><td>ID</td><td>Model Name</td><td>SOC</td><td>FDTFILE</td><td>UBOOT_OVERLOAD</td><td>MAINLINE_UBOOT</td><td>ANDROID_UBOOT</td><td>Brief Description</td></tr>
<tr><td>11</td><td>Phicomm N1</td><td>s905d</td><td>meson-gxl-s905d-phicomm-n1.dtb</td><td>u-boot-n1.bin</td><td>NA</td><td>/lib/u-boot/u-boot-2015-phicomm-n1.bin</td><td>4C@1512Mhz,2GB Mem,1Gb Net,Wifi</td></tr>
<tr><td>12</td><td>Phicomm N1(DMA thresh)</td><td>s905d</td><td>meson-gxl-s905d-phicomm-n1-thresh.dtb</td><td>u-boot-n1.bin</td><td>NA</td><td>/lib/u-boot/u-boot-2015-phicomm-n1.bin</td><td>Same as above, when ethmac flow control is off</td></tr>
<tr><td>13</td><td>hg680p & b860h</td><td>s905x</td><td>meson-gxl-s905x-p212.dtb</td><td>u-boot-p212.bin</td><td>NA</td><td>NA</td><td>4C@1512Mhz,1Gb net</td></tr>
<tr><td>14</td><td>X96-Mini & TX3-Mini</td><td>s905w</td><td>meson-gxl-s905w-tx3-mini.dtb</td><td>u-boot-s905x-s912.bin</td><td>NA</td><td>NA</td><td>4C@1512Mhz,100M Net</td></tr>
<tr><td>15</td><td>MECOOL KI Pro</td><td>s905d</td><td>meson-gxl-s905d-mecool-ki-pro.dtb</td><td>u-boot-p201.bin</td><td>NA</td><td>NA</td><td>2G/16G,1000M Net</td></tr>
<tr><td>21</td><td>Octopus Planet</td><td>s912</td><td>meson-gxm-octopus-planet.dtb</td><td>u-boot-zyxq.bin</td><td>NA</td><td>NA</td><td>4C@1512Mhz+4C@1000Mhz,2GB Mem,1Gb Net</td></tr>
<tr><td>22</td><td>H96 Pro Plus</td><td>s912</td><td>meson-gxm-octopus-planet.dtb</td><td>u-boot-zyxq.bin</td><td>NA</td><td>NA</td><td>4C@1512Mhz+4C@1000Mhz,2GB Mem,1Gb Net</td></tr>
<tr><td>23</td><td>T95Z Plus</td><td>s912</td><td>meson-gxm-t95z-plus.dtb</td><td>u-boot-s905x-s912.bin</td><td>NA</td><td>NA</td><td>3G+32G,Octa-Core,2.4/5.8G Dual-Band Wi-Fi/10-1000M LAN 64Bit BT4.0</td></tr>
<tr><td>31</td><td>X96 Max 4GB</td><td>s905x2</td><td>meson-g12a-x96-max.dtb</td><td>u-boot-x96max.bin</td><td>/lib/u-boot/x96max-u-boot.bin.sd.bin</td><td>NA</td><td>4C@1908Mhz,4GB Mem,1Gb Net</td></tr>
<tr><td>32</td><td>X96 Max 2GB</td><td>s905x2</td><td>meson-g12a-x96-max-rmii.dtb</td><td>u-boot-x96max.bin</td><td>/lib/u-boot/x96max-u-boot.bin.sd.bin</td><td>NA</td><td>4C@1908Mhz,2GB Mem,100M Net</td></tr>
<tr><td>41</td><td>Beelink GT-King</td><td>s922x</td><td>meson-g12b-gtking.dtb</td><td>u-boot-gtking.bin</td><td>/lib/u-boot/gtking-u-boot.bin.sd.bin</td><td>NA</td><td>2C@1800Mhz(A53)+4C@1908Mhz(A73),4GB Mem,1Gb Net,Wifi</td></tr>
<tr><td>42</td><td>Beelink GT-King Pro</td><td>s922x</td><td>meson-g12b-gtking-pro.dtb</td><td>u-boot-gtkingpro.bin</td><td>/lib/u-boot/gtkingpro-u-boot.bin.sd.bin</td><td>NA</td><td>2C@1800Mhz(A53)+4C@1908Mhz(A73),4GB Mem,1Gb Net,Wifi</td></tr>
<tr><td>43</td><td>Beelink GT-King Pro H</td><td>s922x</td><td>meson-g12b-gtking-pro-h.dtb</td><td>u-boot-gtkingpro.bin</td><td>/lib/u-boot/gtkingpro-u-boot.bin.sd.bin</td><td>NA</td><td>S922X-H,2C@1800Mhz(A53)+4C@2208Mhz(A73),4GB Mem,1Gb Net,Wifi</td></tr>
<tr><td>44</td><td>Beelink GT-King Pro Rev_A</td><td>s922x</td><td>meson-g12b-gtking-pro.dtb</td><td>u-boot-gtkingpro-rev-a.bin</td><td></td><td>NA</td><td>2C@1800Mhz(A53)+4C@1908Mhz(A73),4GB Mem,1Gb Net,Wifi</td></tr>
<tr><td>45</td><td>Hardkernel ODroid N2</td><td>s922x</td><td>meson-g12b-odroid-n2.dtb</td><td>u-boot-gtkingpro.bin</td><td>/lib/u-boot/odroid-n2-u-boot.bin.sd.bin</td><td>NA</td><td>2C@1800Mhz(A53)+4C@1908Mhz(A73),4GB Mem,1Gb Net</td></tr>
<tr><td>46</td><td>UGOOS AM6 Plus</td><td>s922x</td><td>meson-g12b-ugoos-am6.dtb</td><td>u-boot-gtkingpro.bin</td><td>/lib/u-boot/gtkingpro-u-boot.bin.sd.bin</td><td>NA</td><td>2C@1800Mhz(A53)+4C@1908Mhz(A73),4GB Mem,1Gb Net,Wifi</td></tr>
<tr><td>51</td><td>X96 Max+</td><td>s905x3</td><td>meson-sm1-x96-max-plus.dtb</td><td>u-boot-x96maxplus.bin</td><td>/lib/u-boot/x96maxplus-u-boot.bin.sd.bin</td><td>/lib/u-boot/hk1box-bootloader.img</td><td>4C@2100Mhz,4GB Mem,1Gb Net</td></tr>
<tr><td>52</td><td>X96 Max+ (OverClock)</td><td>s905x3</td><td>meson-sm1-x96-max-plus-oc.dtb</td><td>u-boot-x96maxplus.bin</td><td>/lib/u-boot/x96maxplus-u-boot.bin.sd.bin</td><td>/lib/u-boot/hk1box-bootloader.img</td><td>4C@2208Mhz,4GB Mem,1Gb Net</td></tr>
<tr><td>53</td><td>HK1 Box</td><td>s905x3</td><td>meson-sm1-hk1box-vontar-x3.dtb</td><td>u-boot-x96maxplus.bin</td><td>/lib/u-boot/hk1box-u-boot.bin.sd.bin</td><td>NA</td><td>4C@2100Mhz,4GB Mem,1Gb Net,Wifi</td></tr>
<tr><td>54</td><td>HK1 Box (OveClock)</td><td>s905x3</td><td>meson-sm1-hk1box-vontar-x3-oc.dtb</td><td>u-boot-x96maxplus.bin</td><td>/lib/u-boot/hk1box-u-boot.bin.sd.bin</td><td>NA</td><td>4C@2208Mhz,4GB Mem,1Gb Net,Wifi</td></tr>
<tr><td>55</td><td>H96 Max X3</td><td>s905x3</td><td>meson-sm1-h96-max-x3.dtb</td><td>u-boot-x96maxplus.bin</td><td>/lib/u-boot/h96maxx3-u-boot.bin.sd.bin</td><td>NA</td><td>4C@2100Mhz,4GB Mem,1Gb Net,Wifi</td></tr>
<tr><td>56</td><td>H96 Max X3</td><td>s905x3</td><td>meson-sm1-h96-max-x3-oc.dtb</td><td>u-boot-x96maxplus.bin</td><td>/lib/u-boot/h96maxx3-u-boot.bin.sd.bin</td><td>NA</td><td>4C@2208Mhz,4GB Mem,1Gb Net,Wifi</td></tr>
<tr><td>57</td><td>Ugoos X3</td><td>s905x3</td><td>meson-sm1-ugoos-x3.dtb</td><td>u-boot-ugoos-x3.bin</td><td>NA</td><td>NA</td><td>4C@2100Mhz,2(Cube)/4(Pro,Plus)GB Mem,1Gb Net,Wifi</td></tr>
<tr><td>58</td><td>Ugoos X3(OverClock)</td><td>s905x3</td><td>meson-sm1-ugoos-x3.dtb</td><td>u-boot-ugoos-x3.bin</td><td>NA</td><td>NA</td><td>4C@2208Mhz,2(Cube)/4(Pro,Plus)GB Mem,1Gb Net,Wifi</td></tr>
<tr><td>61</td><td>Beelink Mini MX 2G</td><td>s905</td><td>meson-gxbb-vega-s95-telos.dtb</td><td>u-boot-s905.bin</td><td>NA</td><td>NA</td><td>Mali-450 GPU 2.4GHz / 5.8GHz WiFi 2GB RAM 16GB ROM Support 1000M LAN</td></tr>
<tr><td>62</td><td>MXQ PRO+ 4K</td><td>s905</td><td>meson-gxbb-mxq-pro-plus.dtb</td><td>u-boot-p201.bin</td><td>NA</td><td>NA</td><td>2GB RAM 16GB ROM 2.4G/5.8G Support 1000M LAN</td></tr>
</table>

