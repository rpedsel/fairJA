set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.0837, <2> 46.0164, <3> 12.6984, <4> 15.7861, <5> 8.332, <6> 15.1669, <7> 13.808, <8> 15.0138, <9> 12.5496, <10> 34.2762;
param workload[JOB] := <1> 1161.6986, <2> 2117.5091, <3> 161.2494, <4> 249.201, <5> 69.4222, <6> 230.0349, <7> 190.6609, <8> 225.4142, <9> 157.4925, <10> 1174.8579;
param capacity[MACHINE] := <1> 5737.5407, <2> 5737.5407, <3> 5737.5407;

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
