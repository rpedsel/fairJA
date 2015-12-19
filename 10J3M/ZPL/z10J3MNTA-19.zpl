set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.7779, <2> 22.5098, <3> 21.1551, <4> 29.6874, <5> 34.5408, <6> 24.5943, <7> 25.2924, <8> 11.613, <9> 27.341, <10> 25.4025;
param workload[JOB] := <1> 664.5001, <2> 506.6911, <3> 447.5383, <4> 881.3417, <5> 1193.0669, <6> 604.8796, <7> 639.7055, <8> 134.8618, <9> 747.5303, <10> 645.287;
param capacity[MACHINE] := <1> 1616.3506, <2> 1616.3506, <3> 1616.3506;

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
