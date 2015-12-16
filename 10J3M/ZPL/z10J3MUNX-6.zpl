set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.0517, <2> 35.2802, <3> 32.4264, <4> 16.5486, <5> 6.8969, <6> 34.3729, <7> 1.7885, <8> 8.2411, <9> 2.3617, <10> 35.1467;
param workload[JOB] := <1> 5.6614, <2> 5.9397, <3> 5.6944, <4> 4.068, <5> 2.6262, <6> 5.8628, <7> 1.3373, <8> 2.8707, <9> 1.5368, <10> 5.9285;
param capacity[MACHINE] := <1> 41.5258, <2> 41.5258, <3> 41.5258;

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
