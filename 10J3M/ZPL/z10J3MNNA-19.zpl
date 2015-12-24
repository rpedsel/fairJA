set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.3334, <2> 24.4989, <3> 30.954, <4> 32.4805, <5> 24.8391, <6> 30.939, <7> 27.9109, <8> 27.6672, <9> 17.1744, <10> 26.2615;
param workload[JOB] := <1> 1178.7824, <2> 600.1961, <3> 958.1501, <4> 1054.9829, <5> 616.9809, <6> 957.2217, <7> 779.0183, <8> 765.474, <9> 294.96, <10> 689.6664;
param capacity[MACHINE] := <1> 7895.4328, <2> 7895.4328, <3> 7895.4328;

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
