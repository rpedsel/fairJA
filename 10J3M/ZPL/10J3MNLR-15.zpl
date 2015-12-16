set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.3068, <2> 25.1747, <3> 26.6341, <4> 23.3073, <5> 21.3329, <6> 32.4533, <7> 30.92, <8> 26.0112, <9> 22.0859, <10> 32.8339;
param workload[JOB] := <1> 4.5436, <2> 20.8, <3> 39.3743, <4> 24.6968, <5> 42.1862, <6> 45.188, <7> 33.2712, <8> 11.7906, <9> 10.4297, <10> 37.4138;
param capacity[MACHINE] := <1> 89.8981, <2> 89.8981, <3> 89.8981;

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
