set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 49.6731, <2> 15.7221, <3> 1.4484, <4> 46.1347, <5> 16.0736, <6> 37.5657, <7> 26.508, <8> 42.9095, <9> 39.7827, <10> 18.7064;
param workload[JOB] := <1> 49.6731, <2> 15.7221, <3> 1.4484, <4> 46.1347, <5> 16.0736, <6> 37.5657, <7> 26.508, <8> 42.9095, <9> 39.7827, <10> 18.7064;
param capacity[MACHINE] := <1> 98.1747, <2> 98.1747, <3> 98.1747;

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
