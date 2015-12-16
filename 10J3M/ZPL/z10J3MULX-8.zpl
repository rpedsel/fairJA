set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.8552, <2> 47.1974, <3> 16.5385, <4> 8.3048, <5> 40.4492, <6> 17.2887, <7> 28.8583, <8> 31.1211, <9> 38.1925, <10> 32.8718;
param workload[JOB] := <1> 4.8842, <2> 6.87, <3> 4.0668, <4> 2.8818, <5> 6.36, <6> 4.158, <7> 5.372, <8> 5.5786, <9> 6.18, <10> 5.7334;
param capacity[MACHINE] := <1> 17.3616, <2> 17.3616, <3> 17.3616;

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
