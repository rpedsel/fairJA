set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.0281, <2> 32.8154, <3> 16.3204, <4> 28.569, <5> 21.4019, <6> 39.026, <7> 29.8477, <8> 23.5038, <9> 28.6369, <10> 30.0266;
param workload[JOB] := <1> 32.0281, <2> 32.8154, <3> 16.3204, <4> 28.569, <5> 21.4019, <6> 39.026, <7> 29.8477, <8> 23.5038, <9> 28.6369, <10> 30.0266;
param capacity[MACHINE] := <1> 70.5439, <2> 70.5439, <3> 70.5439;

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
