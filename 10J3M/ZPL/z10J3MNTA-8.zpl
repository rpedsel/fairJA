set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.2305, <2> 25.153, <3> 17.1013, <4> 31.6762, <5> 28.9649, <6> 26.2059, <7> 29.6356, <8> 34.279, <9> 17.5835, <10> 29.3472;
param workload[JOB] := <1> 1241.1881, <2> 632.6734, <3> 292.4545, <4> 1003.3816, <5> 838.9654, <6> 686.7492, <7> 878.2688, <8> 1175.0498, <9> 309.1795, <10> 861.2581;
param capacity[MACHINE] := <1> 1979.7921, <2> 1979.7921, <3> 1979.7921;

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
