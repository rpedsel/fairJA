set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.0876, <2> 16.7406, <3> 23.2437, <4> 27.8651, <5> 17.8045, <6> 27.1293, <7> 21.5827, <8> 22.3311, <9> 24.0001, <10> 24.9725;
param workload[JOB] := <1> 533.0373, <2> 280.2477, <3> 540.2696, <4> 776.4638, <5> 317.0002, <6> 735.9989, <7> 465.8129, <8> 498.678, <9> 576.0048, <10> 623.6258;
param capacity[MACHINE] := <1> 5347.139, <2> 5347.139, <3> 5347.139;

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
