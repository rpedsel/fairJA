set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.6505, <2> 31.432, <3> 28.4558, <4> 40.312, <5> 38.5768, <6> 47.0233, <7> 39.4829, <8> 35.2551, <9> 34.8744, <10> 23.2706;
param workload[JOB] := <1> 20.6505, <2> 31.432, <3> 28.4558, <4> 40.312, <5> 38.5768, <6> 47.0233, <7> 39.4829, <8> 35.2551, <9> 34.8744, <10> 23.2706;
param capacity[MACHINE] := <1> 339.3334, <2> 339.3334, <3> 339.3334;

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
