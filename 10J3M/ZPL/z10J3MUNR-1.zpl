set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.0724, <2> 14.9485, <3> 26.7716, <4> 10.9797, <5> 19.7879, <6> 27.3068, <7> 10.2949, <8> 6.5388, <9> 25.8787, <10> 36.6062;
param workload[JOB] := <1> 44.8846, <2> 26.002, <3> 15.8967, <4> 26.1753, <5> 14.8542, <6> 6.1333, <7> 35.7509, <8> 1.8011, <9> 41.7631, <10> 37.3953;
param capacity[MACHINE] := <1> 250.6565, <2> 250.6565, <3> 250.6565;

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
