set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.2057, <2> 12.3251, <3> 25.08, <4> 37.4998, <5> 5.0506, <6> 33.4694, <7> 42.0079, <8> 19.7894, <9> 0.6618, <10> 27.1866;
param workload[JOB] := <1> 42.2057, <2> 12.3251, <3> 25.08, <4> 37.4998, <5> 5.0506, <6> 33.4694, <7> 42.0079, <8> 19.7894, <9> 0.6618, <10> 27.1866;
param capacity[MACHINE] := <1> 245.2763, <2> 245.2763, <3> 245.2763;

var x[JM];
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
