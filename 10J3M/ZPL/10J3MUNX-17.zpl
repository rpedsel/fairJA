set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.7135, <2> 11.9712, <3> 3.5225, <4> 33.1689, <5> 47.2825, <6> 39.697, <7> 12.9251, <8> 46.4763, <9> 13.2542, <10> 24.5191;
param workload[JOB] := <1> 3.1166, <2> 3.4599, <3> 1.8768, <4> 5.7592, <5> 6.8762, <6> 6.3006, <7> 3.5951, <8> 6.8174, <9> 3.6406, <10> 4.9517;
param capacity[MACHINE] := <1> 46.3941, <2> 46.3941, <3> 46.3941;

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
