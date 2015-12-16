set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.245, <2> 11.9364, <3> 30.4726, <4> 29.4619, <5> 0.2252, <6> 21.4151, <7> 19.446, <8> 16.1911, <9> 11.6066, <10> 5.2506;
param workload[JOB] := <1> 914.76, <2> 142.4776, <3> 928.5794, <4> 868.0036, <5> 0.0507, <6> 458.6065, <7> 378.1469, <8> 262.1517, <9> 134.7132, <10> 27.5688;
param capacity[MACHINE] := <1> 1371.6861, <2> 1371.6861, <3> 1371.6861;

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
