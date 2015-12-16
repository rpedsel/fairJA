set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.6858, <2> 21.6193, <3> 25.1323, <4> 27.4829, <5> 31.2437, <6> 21.2263, <7> 26.7672, <8> 27.9791, <9> 26.5528, <10> 19.416;
param workload[JOB] := <1> 3.8534, <2> 39.1376, <3> 38.5639, <4> 31.978, <5> 10.5001, <6> 28.8012, <7> 46.0245, <8> 11.801, <9> 11.3693, <10> 28.069;
param capacity[MACHINE] := <1> 83.366, <2> 83.366, <3> 83.366;

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
