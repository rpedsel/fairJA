set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.2742, <2> 20.3731, <3> 27.3669, <4> 26.4514, <5> 22.7848, <6> 22.3666, <7> 26.3754, <8> 27.0246, <9> 25.1892, <10> 36.7248;
param workload[JOB] := <1> 298.398, <2> 415.0632, <3> 748.9472, <4> 699.6766, <5> 519.1471, <6> 500.2648, <7> 695.6617, <8> 730.329, <9> 634.4958, <10> 1348.7109;
param capacity[MACHINE] := <1> 2196.8981, <2> 2196.8981, <3> 2196.8981;

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
