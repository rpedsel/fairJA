set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.269, <2> 24.2736, <3> 21.7624, <4> 27.1684, <5> 23.9021, <6> 16.2997, <7> 24.2235, <8> 22.5503, <9> 31.8414, <10> 22.9275;
param workload[JOB] := <1> 28.269, <2> 24.2736, <3> 21.7624, <4> 27.1684, <5> 23.9021, <6> 16.2997, <7> 24.2235, <8> 22.5503, <9> 31.8414, <10> 22.9275;
param capacity[MACHINE] := <1> 60.8044, <2> 60.8044, <3> 60.8044;

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
