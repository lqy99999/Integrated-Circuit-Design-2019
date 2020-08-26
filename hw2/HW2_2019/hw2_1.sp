*********************************************
.inc '90nm_bulk.l'
.SUBCKT Inv DVDD GND A B Out
*.PININFO DVDD:I GND:I A:I B:I Out:O
MM1         Out B DVDD DVDD PMOS l=0.1u w=0.5u m=1
MM2         Out A DVDD DVDD PMOS l=0.1u w=0.5u m=1
MM3         Out A N144540 N144540 NMOS l=0.1u w=0.25u m=1
MM4         N144540 B GND GND NMOS l=0.1u w=0.25u m=1
.ENDS
*********************************************


Vdd DVDD    0   1
Vss  GND      0   0

Vin A  0    pwl (0n 0v 100n 1v 500n 1v 600n 0v 1000n 0v 1100n 1v 1500n 1v 1600n 0v 2000n 0v 2100n 1v 2500n 1v 2600n 0v 3000n 0v 3100n 1v 3500n 1v 3600n 0v);

Vin1 B    0   pwl (0n 0v 100n 1v 900n 1v 1000n 0v 1900n 0v 2000n 1v 2900n 1v 3000n 0v 4000n 0v);



x1 DVDD   GND A B  Out     Inv

.tran 10n 2.1u
.op
.option post
.end
