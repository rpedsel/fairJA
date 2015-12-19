set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.254, <2> 25.5277, <3> 34.1372, <4> 29.8318, <5> 32.0909, <6> 27.6968, <7> 18.6448, <8> 27.7334, <9> 23.081, <10> 33.4334;
param workload[JOB] := <1> 798.2885, <2> 651.6635, <3> 1165.3484, <4> 889.9363, <5> 1029.8259, <6> 767.1127, <7> 347.6286, <8> 769.1415, <9> 532.7326, <10> 1117.7922;
param capacity[MACHINE] := <1> 8069.4702, <2> 8069.4702, <3> 8069.4702;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
