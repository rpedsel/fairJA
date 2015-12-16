set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.1312, <2> 26.6365, <3> 23.2661, <4> 16.2696, <5> 22.376, <6> 32.256, <7> 26.6952, <8> 26.0859, <9> 24.4513, <10> 26.8121;
param workload[JOB] := <1> 791.3644, <2> 709.5031, <3> 541.3114, <4> 264.6999, <5> 500.6854, <6> 1040.4495, <7> 712.6337, <8> 680.4742, <9> 597.8661, <10> 718.8887;
param capacity[MACHINE] := <1> 6557.8764, <2> 6557.8764, <3> 6557.8764;

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
