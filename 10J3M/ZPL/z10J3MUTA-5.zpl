set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 5.5867, <2> 1.2821, <3> 17.9559, <4> 32.8407, <5> 0.9387, <6> 26.4119, <7> 14.2276, <8> 37.1506, <9> 20.0734, <10> 8.7554;
param workload[JOB] := <1> 31.2112, <2> 1.6438, <3> 322.4143, <4> 1078.5116, <5> 0.8812, <6> 697.5885, <7> 202.4246, <8> 1380.1671, <9> 402.9414, <10> 76.657;
param capacity[MACHINE] := <1> 1599.9559, <2> 1599.9559, <3> 1599.9559;

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
