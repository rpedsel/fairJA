set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.7815, <2> 20.5006, <3> 27.4715, <4> 25.9472, <5> 19.8026, <6> 14.9626, <7> 42.3246, <8> 16.2531, <9> 48.2596, <10> 40.5611;
param workload[JOB] := <1> 9.6561, <2> 21.4088, <3> 24.2332, <4> 10.1561, <5> 49.7309, <6> 17.8551, <7> 29.0291, <8> 15.1305, <9> 31.219, <10> 28.0844;
param capacity[MACHINE] := <1> 236.5032, <2> 236.5032, <3> 236.5032;

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
