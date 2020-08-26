*********************************************
.inc '90nm_bulk.l'
.SUBCKT Inv VDD GND A B CI CO S
*.PININFO VDD:I GND:I A:I B:I CI:I CO:O S:O
M_M1         CO N14413 VDD VDD PMOS l=0.1u w=0.5u m=1
M_M2         CO N14413 GND GND NMOS l=0.1u w=0.25u m=1
M_M3         N15145 B VDD VDD PMOS l=0.1u w=0.5u m=1
M_M4         N145962 B VDD VDD PMOS l=0.1u w=0.5u m=1
M_M5         N146352 B GND GND NMOS l=0.1u w=0.25u m=1
M_M6         N15185 B GND GND NMOS l=0.1u w=0.25u m=1
M_M7         N15145 A VDD VDD PMOS l=0.1u w=0.5u m=1
M_M8         N14413 A N145962 VDD PMOS l=0.1u w=0.5u m=1
M_M11         N15194 CI VDD VDD PMOS l=0.1u w=0.5u m=1
M_M12         N14413 CI N15145 VDD PMOS l=0.1u w=0.5u m=1
M_M13         N14413 CI N15185 GND NMOS l=0.1u w=0.25u m=1
M_M10         N15185 A GND GND NMOS l=0.1u w=0.25u m=1
M_M9         N14413 A N146352 GND NMOS l=0.1u w=0.25u m=1
M_M14         N15194 CI GND GND NMOS l=0.1u w=0.25u m=1
M_M15         N15385 N15755 CI VDD PMOS l=0.1u w=0.5u m=1
M_M16         N15385 N15755 N15194 GND NMOS l=0.1u w=0.25u m=1
M_M17         N15755 CI N15385 VDD PMOS l=0.1u w=0.5u m=1
M_M18         N15385 N15194 N15755 GND NMOS l=0.1u w=0.25u m=1
M_M19         S N15385 VDD VDD PMOS l=0.1u w=0.5u m=1
M_M20         S N15385 GND GND NMOS l=0.1u w=0.25u m=1
M_M21         N15830 A VDD VDD PMOS l=0.1u w=0.5u m=1
M_M22         N15830 A GND GND NMOS l=0.1u w=0.25u m=1
M_M23         N15755 B N15830 VDD PMOS l=0.1u w=0.5u m=1
M_M24         N15755 B A GND NMOS l=0.1u w=0.25u m=1
M_M25         N15755 N15830 B VDD PMOS l=0.1u w=0.5u m=1
M_M26         B A N15755 GND NMOS l=0.1u w=0.25u m=1
.ENDS
*********************************************


Vdd VDD    0   1
Vss  GND      0   0

Vin A     0    pulse (0 1 0 100n 100n 1.9u 4u)

Vin1 B    0   pulse (0 1 0 100n 100n 0.9u 2u)

Vin2 CI  0   pulse (0 1 0 100n 100n 0.4u 1u)

x1 VDD GND A B  CI CO S  Inv

.tran 10n 4.4u
.op
.option post
.end
