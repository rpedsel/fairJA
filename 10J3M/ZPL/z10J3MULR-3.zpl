set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.3343, <2> 41.9477, <3> 16.1762, <4> 20.7269, <5> 38.4758, <6> 32.5023, <7> 20.8221, <8> 36.501, <9> 38.0066, <10> 47.4377;
param workload[JOB] := <1> 25.5627, <2> 49.9214, <3> 33.504, <4> 29.4253, <5> 26.2887, <6> 36.3876, <7> 9.8814, <8> 48.1182, <9> 14.6831, <10> 34.5975;
param capacity[MACHINE] := <1> 102.79, <2> 102.79, <3> 102.79;

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
