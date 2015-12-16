set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.2613, <2> 30.3139, <3> 26.8796, <4> 24.0038, <5> 29.9, <6> 30.8953, <7> 16.4509, <8> 24.3733, <9> 23.5136, <10> 30.0986;
param workload[JOB] := <1> 264.4299, <2> 918.9325, <3> 722.5129, <4> 576.1824, <5> 894.01, <6> 954.5196, <7> 270.6321, <8> 594.0578, <9> 552.8894, <10> 905.9257;
param capacity[MACHINE] := <1> 6654.0923, <2> 6654.0923, <3> 6654.0923;

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
