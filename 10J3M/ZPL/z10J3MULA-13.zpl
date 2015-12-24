set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.5006, <2> 40.9774, <3> 34.4669, <4> 40.7038, <5> 9.4757, <6> 1.5085, <7> 5.752, <8> 48.0681, <9> 16.6231, <10> 46.3283;
param workload[JOB] := <1> 1806.301, <2> 1679.1473, <3> 1187.9672, <4> 1656.7993, <5> 89.7889, <6> 2.2756, <7> 33.0855, <8> 2310.5422, <9> 276.3275, <10> 2146.3114;
param capacity[MACHINE] := <1> 3729.5153, <2> 3729.5153, <3> 3729.5153;

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
