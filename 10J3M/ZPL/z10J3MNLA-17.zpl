set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.3628, <2> 27.0888, <3> 30.0305, <4> 24.9214, <5> 27.3641, <6> 18.6452, <7> 9.851, <8> 23.467, <9> 28.4638, <10> 31.529;
param workload[JOB] := <1> 748.7228, <2> 733.8031, <3> 901.8309, <4> 621.0762, <5> 748.794, <6> 347.6435, <7> 97.0422, <8> 550.7001, <9> 810.1879, <10> 994.0778;
param capacity[MACHINE] := <1> 2184.6262, <2> 2184.6262, <3> 2184.6262;

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
