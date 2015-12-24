set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.3079, <2> 18.9755, <3> 23.9291, <4> 32.4001, <5> 20.8714, <6> 22.1825, <7> 20.5554, <8> 21.8776, <9> 23.3733, <10> 16.8016;
param workload[JOB] := <1> 4.2788, <2> 4.3561, <3> 4.8917, <4> 5.6921, <5> 4.5685, <6> 4.7098, <7> 4.5338, <8> 4.6773, <9> 4.8346, <10> 4.099;
param capacity[MACHINE] := <1> 46.6417, <2> 46.6417, <3> 46.6417;

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
