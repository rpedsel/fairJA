set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.3041, <2> 22.5658, <3> 26.0086, <4> 8.1911, <5> 5.4313, <6> 45.6444, <7> 18.1635, <8> 37.2502, <9> 49.0847, <10> 46.9451;
param workload[JOB] := <1> 44.3041, <2> 22.5658, <3> 26.0086, <4> 8.1911, <5> 5.4313, <6> 45.6444, <7> 18.1635, <8> 37.2502, <9> 49.0847, <10> 46.9451;
param capacity[MACHINE] := <1> 101.1963, <2> 101.1963, <3> 101.1963;

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
