set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.5207, <2> 3.4083, <3> 33.8152, <4> 47.5592, <5> 46.1726, <6> 41.4805, <7> 4.0596, <8> 21.2438, <9> 16.0558, <10> 5.4625;
param workload[JOB] := <1> 24.5207, <2> 3.4083, <3> 33.8152, <4> 47.5592, <5> 46.1726, <6> 41.4805, <7> 4.0596, <8> 21.2438, <9> 16.0558, <10> 5.4625;
param capacity[MACHINE] := <1> 60.9445, <2> 60.9445, <3> 60.9445;

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
