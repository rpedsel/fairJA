set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 37.0091, <2> 9.7209, <3> 40.9596, <4> 48.4757, <5> 30.1877, <6> 6.614, <7> 3.9656, <8> 44.9589, <9> 7.4381, <10> 28.4112;
param workload[JOB] := <1> 6.0835, <2> 3.1178, <3> 6.4, <4> 6.9624, <5> 5.4943, <6> 2.5718, <7> 1.9914, <8> 6.7051, <9> 2.7273, <10> 5.3302;
param capacity[MACHINE] := <1> 47.3838, <2> 47.3838, <3> 47.3838;

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
