set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.73, <2> 13.649, <3> 19.1039, <4> 29.5483, <5> 34.2341, <6> 25.4997, <7> 23.9334, <8> 22.2661, <9> 21.5511, <10> 27.5452;
param workload[JOB] := <1> 429.7329, <2> 186.2952, <3> 364.959, <4> 873.102, <5> 1171.9736, <6> 650.2347, <7> 572.8076, <8> 495.7792, <9> 464.4499, <10> 758.738;
param capacity[MACHINE] := <1> 5968.0721, <2> 5968.0721, <3> 5968.0721;

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
