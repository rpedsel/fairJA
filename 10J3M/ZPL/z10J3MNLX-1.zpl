set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.7219, <2> 23.3663, <3> 21.6591, <4> 18.369, <5> 24.8072, <6> 28.771, <7> 25.0805, <8> 19.9048, <9> 21.7966, <10> 27.3181;
param workload[JOB] := <1> 5.4518, <2> 4.8339, <3> 4.6539, <4> 4.2859, <5> 4.9807, <6> 5.3639, <7> 5.008, <8> 4.4615, <9> 4.6687, <10> 5.2267;
param capacity[MACHINE] := <1> 16.3117, <2> 16.3117, <3> 16.3117;

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
