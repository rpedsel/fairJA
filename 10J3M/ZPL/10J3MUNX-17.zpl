set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 2.4337, <2> 27.8622, <3> 3.9902, <4> 15.3512, <5> 29.3535, <6> 22.8993, <7> 34.2456, <8> 38.4881, <9> 47.0485, <10> 28.674;
param workload[JOB] := <1> 1.56, <2> 5.2785, <3> 1.9975, <4> 3.9181, <5> 5.4179, <6> 4.7853, <7> 5.852, <8> 6.2039, <9> 6.8592, <10> 5.3548;
param capacity[MACHINE] := <1> 47.2272, <2> 47.2272, <3> 47.2272;

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
