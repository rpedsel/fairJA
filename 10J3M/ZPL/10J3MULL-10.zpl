set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.718, <2> 31.2777, <3> 41.4407, <4> 34.5011, <5> 45.42, <6> 13.2985, <7> 31.2102, <8> 42.7542, <9> 5.9009, <10> 19.8168;
param workload[JOB] := <1> 39.718, <2> 31.2777, <3> 41.4407, <4> 34.5011, <5> 45.42, <6> 13.2985, <7> 31.2102, <8> 42.7542, <9> 5.9009, <10> 19.8168;
param capacity[MACHINE] := <1> 101.7794, <2> 101.7794, <3> 101.7794;

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
