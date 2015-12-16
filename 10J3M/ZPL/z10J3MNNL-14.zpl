set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.0542, <2> 20.6276, <3> 27.1364, <4> 27.2475, <5> 15.1239, <6> 23.1225, <7> 26.2729, <8> 20.5569, <9> 20.9521, <10> 25.8881;
param workload[JOB] := <1> 28.0542, <2> 20.6276, <3> 27.1364, <4> 27.2475, <5> 15.1239, <6> 23.1225, <7> 26.2729, <8> 20.5569, <9> 20.9521, <10> 25.8881;
param capacity[MACHINE] := <1> 234.9821, <2> 234.9821, <3> 234.9821;

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
