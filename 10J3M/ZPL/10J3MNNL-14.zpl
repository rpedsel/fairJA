set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.4138, <2> 25.4837, <3> 29.9401, <4> 26.6756, <5> 12.6795, <6> 17.5978, <7> 18.3577, <8> 22.3098, <9> 28.8364, <10> 18.4839;
param workload[JOB] := <1> 20.4138, <2> 25.4837, <3> 29.9401, <4> 26.6756, <5> 12.6795, <6> 17.5978, <7> 18.3577, <8> 22.3098, <9> 28.8364, <10> 18.4839;
param capacity[MACHINE] := <1> 220.7783, <2> 220.7783, <3> 220.7783;

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
