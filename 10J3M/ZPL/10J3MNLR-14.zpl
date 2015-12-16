set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.517, <2> 13.0713, <3> 17.1454, <4> 24.3769, <5> 20.3354, <6> 18.2947, <7> 21.3875, <8> 24.1221, <9> 28.9768, <10> 23.8412;
param workload[JOB] := <1> 32.0159, <2> 34.2457, <3> 25.4557, <4> 46.9698, <5> 10.2886, <6> 21.5141, <7> 19.4775, <8> 40.2448, <9> 17.7596, <10> 40.7989;
param capacity[MACHINE] := <1> 96.2569, <2> 96.2569, <3> 96.2569;

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
