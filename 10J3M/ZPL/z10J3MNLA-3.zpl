set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.5468, <2> 22.0535, <3> 24.3986, <4> 16.3772, <5> 35.2301, <6> 25.6046, <7> 25.3371, <8> 22.2868, <9> 24.8972, <10> 23.8735;
param workload[JOB] := <1> 273.7966, <2> 486.3569, <3> 595.2917, <4> 268.2127, <5> 1241.1599, <6> 655.5955, <7> 641.9686, <8> 496.7015, <9> 619.8706, <10> 569.944;
param capacity[MACHINE] := <1> 1949.6327, <2> 1949.6327, <3> 1949.6327;

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
