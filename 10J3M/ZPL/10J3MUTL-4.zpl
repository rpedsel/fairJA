set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 13.2807, <2> 44.6493, <3> 11.304, <4> 2.6641, <5> 17.4283, <6> 1.7487, <7> 26.8169, <8> 17.473, <9> 21.9629, <10> 40.2396;
param workload[JOB] := <1> 13.2807, <2> 44.6493, <3> 11.304, <4> 2.6641, <5> 17.4283, <6> 1.7487, <7> 26.8169, <8> 17.473, <9> 21.9629, <10> 40.2396;
param capacity[MACHINE] := <1> 49.3919, <2> 49.3919, <3> 49.3919;

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
