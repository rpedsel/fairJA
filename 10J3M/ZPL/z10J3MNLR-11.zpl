set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.6456, <2> 28.8696, <3> 25.2734, <4> 32.4884, <5> 25.2138, <6> 24.4679, <7> 29.2281, <8> 25.4586, <9> 25.9347, <10> 31.2702;
param workload[JOB] := <1> 41.2084, <2> 30.506, <3> 14.2027, <4> 36.3943, <5> 11.0916, <6> 8.4714, <7> 22.6156, <8> 34.6257, <9> 25.476, <10> 29.7273;
param capacity[MACHINE] := <1> 84.773, <2> 84.773, <3> 84.773;

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
