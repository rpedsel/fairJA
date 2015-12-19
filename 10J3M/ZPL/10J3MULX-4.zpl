set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 2.5813, <2> 45.2975, <3> 1.79, <4> 12.6455, <5> 2.8338, <6> 30.0641, <7> 5.7083, <8> 8.3059, <9> 28.4352, <10> 21.2323;
param workload[JOB] := <1> 1.6066, <2> 6.7303, <3> 1.3379, <4> 3.5561, <5> 1.6834, <6> 5.4831, <7> 2.3892, <8> 2.882, <9> 5.3325, <10> 4.6079;
param capacity[MACHINE] := <1> 11.8697, <2> 11.8697, <3> 11.8697;

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
