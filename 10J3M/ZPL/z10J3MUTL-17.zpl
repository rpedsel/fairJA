set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.8567, <2> 29.3934, <3> 33.9278, <4> 24.4819, <5> 33.461, <6> 5.3683, <7> 18.6718, <8> 37.9886, <9> 24.5027, <10> 32.9699;
param workload[JOB] := <1> 19.8567, <2> 29.3934, <3> 33.9278, <4> 24.4819, <5> 33.461, <6> 5.3683, <7> 18.6718, <8> 37.9886, <9> 24.5027, <10> 32.9699;
param capacity[MACHINE] := <1> 65.1555, <2> 65.1555, <3> 65.1555;

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
