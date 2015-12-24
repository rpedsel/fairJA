set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.7806, <2> 23.65, <3> 19.7865, <4> 27.4057, <5> 23.0633, <6> 29.694, <7> 33.6838, <8> 20.165, <9> 20.1436, <10> 27.8502;
param workload[JOB] := <1> 4.5018, <2> 32.5793, <3> 37.6243, <4> 9.7476, <5> 4.2903, <6> 26.3132, <7> 45.2763, <8> 44.2691, <9> 4.1214, <10> 34.6522;
param capacity[MACHINE] := <1> 243.3755, <2> 243.3755, <3> 243.3755;

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
