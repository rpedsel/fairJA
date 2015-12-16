set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.4003, <2> 32.2439, <3> 24.3921, <4> 20.7284, <5> 36.3293, <6> 21.8624, <7> 24.8689, <8> 33.6981, <9> 33.8304, <10> 19.7578;
param workload[JOB] := <1> 696.9758, <2> 1039.6691, <3> 594.9745, <4> 429.6666, <5> 1319.818, <6> 477.9645, <7> 618.4622, <8> 1135.5619, <9> 1144.496, <10> 390.3707;
param capacity[MACHINE] := <1> 7847.9593, <2> 7847.9593, <3> 7847.9593;

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
