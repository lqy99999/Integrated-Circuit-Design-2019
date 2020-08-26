*********************************************
.inc '90nm_bulk.l'
.SUBCKT Inv VDD GND A B C1 C0 S
*.PININFO VDD:I GND:I A:I B:I CI:I CO:O S:O
MM1         CO N18693 VDD VDD PMOS l=0.1u w=0.5u m=1
MM2         CO N18693 GND GND NMOS l=0.1u w=0.25u m=1
MM3         N18700 B VDD VDD PMOS l=0.1u w=0.5u m=1
MM4         N183211 B VDD VDD PMOS l=0.1u w=0.5u m=1
MM5         N18666 B GND GND NMOS l=0.1u w=0.25u m=1
MM6         N18684 B GND GND NMOS l=0.1u w=0.25u m=1
MM7         N18700 A VDD VDD PMOS l=0.1u w=0.5u m=1
MM8         N18675 A N183211 VDD PMOS l=0.1u w=0.5u m=1
MM9         N18675 A N18666 GND NMOS l=0.1u w=0.25u m=1
MM10         N18684 A GND GND NMOS l=0.1u w=0.25u m=1
MM11         N18771 CI VDD VDD PMOS l=0.1u w=0.5u m=1
MM12         N18693 CI N18700 VDD PMOS l=0.1u w=0.5u m=1
MM13         N18675 CI N18684 GND NMOS l=0.1u w=0.25u m=1
MM14         N18771 CI GND GND NMOS l=0.1u w=0.25u m=1
MM15         N19056 CI N19052 VDD PMOS l=0.1u w=0.5u m=1
MM16         N19056 N19052 N18771 GND NMOS l=0.1u w=0.25u m=1
MM17         N19052 CI N19056 VDD PMOS l=0.1u w=0.5u m=1
MM18         N19056 N18771 N19052 GND NMOS l=0.1u w=0.25u m=1
MM19         S N19056 VDD VDD PMOS l=0.1u w=0.5u m=1
MM20         S N19056 GND GND NMOS l=0.1u w=0.25u m=1
MM21         N19376 N19866 VDD VDD PMOS l=0.1u w=0.5u m=1
MM22         N19376 N19866 GND GND NMOS l=0.1u w=0.25u m=1
MM23         N19420 B N19376 VDD PMOS l=0.1u w=0.5u m=1
MM24         N19420 B A GND NMOS l=0.1u w=0.25u m=1
MM25         N19420 N19376 B VDD PMOS l=0.1u w=0.5u m=1
MM26         B N19866 N19420 GND NMOS l=0.1u w=0.25u m=1
.ENDS
*********************************************


Vdd VDD    0   1
Vss  GND      0   0

Vin A     0    pwl (0n 0v 100n 1v 500n 1v 600n 0v 1000n 0v 1100n 1v 1500n 1v 1600n 0v 2000n 0v 2100n 1v 2500n 1v 2600n 0v 3000n 0v 3100n 1v 3500n 1v 3600n 0v);

Vin1 B    0   pwl (0n 0v 100n 1v 900n 1v 1000n 0v 1900n 0v 2000n 1v 2900n 1v 3000n 0v 4000n 0v);

Vin2 CI  0   pwl (0n 0v 100n 1v 400n 1v 500n 0v 900n 0v 1000n 1v 1400n 1v 1500n 0v 1900n 0v 2000n 1v 2400n 1v 2500n 0v 2900n 0v 3000n 1v 3400n 1v 3500n 0v 3900n 0v 4000n 1v 4400n 1v 4500n 0v 4900n 0v );

x1 VDD GND A B  CO CI S  Inv

.tran 10n 2.1u
.op
.option post
.end
