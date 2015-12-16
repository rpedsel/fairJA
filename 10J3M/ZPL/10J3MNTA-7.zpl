set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.5239, <2> 27.9257, <3> 24.1787, <4> 32.839, <5> 20.8544, <6> 17.563, <7> 27.9534, <8> 23.4403, <9> 28.552, <10> 30.5165;
param workload[JOB] := <1> 931.7085, <2> 779.8447, <3> 584.6095, <4> 1078.3999, <5> 434.906, <6> 308.459, <7> 781.3926, <8> 549.4477, <9> 815.2167, <10> 931.2568;
param capacity[MACHINE] := <1> 1798.8103, <2> 1798.8103, <3> 1798.8103;

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
