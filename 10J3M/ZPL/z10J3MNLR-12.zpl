set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.9236, <2> 29.2503, <3> 18.4378, <4> 19.6599, <5> 24.128, <6> 32.1123, <7> 18.6326, <8> 24.3524, <9> 28.0377, <10> 31.5192;
param workload[JOB] := <1> 16.9205, <2> 26.9091, <3> 17.8418, <4> 39.626, <5> 46.9337, <6> 41.5701, <7> 6.1875, <8> 20.5606, <9> 32.1077, <10> 41.8544;
param capacity[MACHINE] := <1> 96.8371, <2> 96.8371, <3> 96.8371;

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
