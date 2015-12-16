set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.3969, <2> 30.7109, <3> 31.3821, <4> 25.1546, <5> 32.2395, <6> 20.7941, <7> 23.2554, <8> 25.7903, <9> 17.0423, <10> 24.409;
param workload[JOB] := <1> 750.5901, <2> 943.1594, <3> 984.8362, <4> 632.7539, <5> 1039.3854, <6> 432.3946, <7> 540.8136, <8> 665.1396, <9> 290.44, <10> 595.7993;
param capacity[MACHINE] := <1> 1718.828, <2> 1718.828, <3> 1718.828;

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
