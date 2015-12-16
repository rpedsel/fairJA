set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.7743, <2> 27.6784, <3> 22.5895, <4> 25.3405, <5> 24.3097, <6> 23.6901, <7> 23.2362, <8> 22.6497, <9> 29.263, <10> 25.2733;
param workload[JOB] := <1> 19.7743, <2> 27.6784, <3> 22.5895, <4> 25.3405, <5> 24.3097, <6> 23.6901, <7> 23.2362, <8> 22.6497, <9> 29.263, <10> 25.2733;
param capacity[MACHINE] := <1> 60.9511, <2> 60.9511, <3> 60.9511;

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
