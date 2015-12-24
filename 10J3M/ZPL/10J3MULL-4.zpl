set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.6191, <2> 49.8714, <3> 2.8121, <4> 4.2688, <5> 8.4711, <6> 9.0745, <7> 39.7944, <8> 33.3269, <9> 30.1713, <10> 3.2408;
param workload[JOB] := <1> 33.6191, <2> 49.8714, <3> 2.8121, <4> 4.2688, <5> 8.4711, <6> 9.0745, <7> 39.7944, <8> 33.3269, <9> 30.1713, <10> 3.2408;
param capacity[MACHINE] := <1> 71.5501, <2> 71.5501, <3> 71.5501;

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
