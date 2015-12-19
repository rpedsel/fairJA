set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.882, <2> 30.3311, <3> 40.1563, <4> 20.0257, <5> 23.2366, <6> 24.0551, <7> 19.8105, <8> 22.9515, <9> 21.435, <10> 27.2204;
param workload[JOB] := <1> 32.882, <2> 30.3311, <3> 40.1563, <4> 20.0257, <5> 23.2366, <6> 24.0551, <7> 19.8105, <8> 22.9515, <9> 21.435, <10> 27.2204;
param capacity[MACHINE] := <1> 65.5261, <2> 65.5261, <3> 65.5261;

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
