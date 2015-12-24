set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.1683, <2> 25.952, <3> 24.1963, <4> 18.1319, <5> 32.994, <6> 25.0479, <7> 24.4818, <8> 18.2076, <9> 26.6722, <10> 31.4623;
param workload[JOB] := <1> 684.7799, <2> 673.5063, <3> 585.4609, <4> 328.7658, <5> 1088.604, <6> 627.3973, <7> 599.3585, <8> 331.5167, <9> 711.4063, <10> 989.8763;
param capacity[MACHINE] := <1> 2206.8907, <2> 2206.8907, <3> 2206.8907;

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
