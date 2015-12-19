set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.0702, <2> 20.3216, <3> 25.504, <4> 25.1947, <5> 30.7252, <6> 22.1105, <7> 19.6256, <8> 26.5443, <9> 13.9899, <10> 24.622;
param workload[JOB] := <1> 21.0702, <2> 20.3216, <3> 25.504, <4> 25.1947, <5> 30.7252, <6> 22.1105, <7> 19.6256, <8> 26.5443, <9> 13.9899, <10> 24.622;
param capacity[MACHINE] := <1> 57.427, <2> 57.427, <3> 57.427;

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
