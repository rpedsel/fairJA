set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.2735, <2> 26.9428, <3> 20.0225, <4> 26.5003, <5> 33.0695, <6> 31.9116, <7> 21.933, <8> 23.9236, <9> 32.2421, <10> 23.6382;
param workload[JOB] := <1> 743.8438, <2> 725.9145, <3> 400.9005, <4> 702.2659, <5> 1093.5918, <6> 1018.3502, <7> 481.0565, <8> 572.3386, <9> 1039.553, <10> 558.7645;
param capacity[MACHINE] := <1> 1834.1448, <2> 1834.1448, <3> 1834.1448;

var x[JM] binary;
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
