set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.2685, <2> 16.5478, <3> 34.096, <4> 28.1927, <5> 27.0906, <6> 19.6177, <7> 24.3601, <8> 24.4791, <9> 22.2719, <10> 10.7418;
param workload[JOB] := <1> 690.0341, <2> 273.8297, <3> 1162.5372, <4> 794.8283, <5> 733.9006, <6> 384.8542, <7> 593.4145, <8> 599.2263, <9> 496.0375, <10> 115.3863;
param capacity[MACHINE] := <1> 5844.0487, <2> 5844.0487, <3> 5844.0487;

var x[JM] binary;
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
