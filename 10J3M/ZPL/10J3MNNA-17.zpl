set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.9717, <2> 27.6101, <3> 23.6297, <4> 27.762, <5> 24.7638, <6> 32.9836, <7> 26.3141, <8> 24.8616, <9> 32.3664, <10> 24.501;
param workload[JOB] := <1> 398.8688, <2> 762.3176, <3> 558.3627, <4> 770.7286, <5> 613.2458, <6> 1087.9179, <7> 692.4319, <8> 618.0992, <9> 1047.5838, <10> 600.299;
param capacity[MACHINE] := <1> 7149.8553, <2> 7149.8553, <3> 7149.8553;

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
