set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.1803, <2> 35.0377, <3> 33.0108, <4> 7.4257, <5> 25.2374, <6> 35.0738, <7> 13.4395, <8> 47.4035, <9> 26.7506, <10> 17.4847;
param workload[JOB] := <1> 15.1803, <2> 35.0377, <3> 33.0108, <4> 7.4257, <5> 25.2374, <6> 35.0738, <7> 13.4395, <8> 47.4035, <9> 26.7506, <10> 17.4847;
param capacity[MACHINE] := <1> 64.011, <2> 64.011, <3> 64.011;

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
