set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 1.9842, <2> 28.6684, <3> 10.2205, <4> 14.0919, <5> 5.2216, <6> 42.5714, <7> 21.3752, <8> 10.1918, <9> 46.9457, <10> 38.2584;
param workload[JOB] := <1> 3.937, <2> 821.8772, <3> 104.4586, <4> 198.5816, <5> 27.2651, <6> 1812.3241, <7> 456.8992, <8> 103.8728, <9> 2203.8987, <10> 1463.7052;
param capacity[MACHINE] := <1> 7196.8195, <2> 7196.8195, <3> 7196.8195;

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
