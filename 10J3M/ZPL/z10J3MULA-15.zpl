set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.4547, <2> 0.4536, <3> 33.1176, <4> 0.3208, <5> 4.0989, <6> 7.3537, <7> 16.4061, <8> 41.5599, <9> 47.7353, <10> 12.1234;
param workload[JOB] := <1> 1802.4016, <2> 0.2058, <3> 1096.7754, <4> 0.1029, <5> 16.801, <6> 54.0769, <7> 269.1601, <8> 1727.2253, <9> 2278.6589, <10> 146.9768;
param capacity[MACHINE] := <1> 2464.1282, <2> 2464.1282, <3> 2464.1282;

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
