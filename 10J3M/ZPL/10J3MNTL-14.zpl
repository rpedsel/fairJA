set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.031, <2> 34.9574, <3> 20.0667, <4> 13.1107, <5> 23.6235, <6> 29.2109, <7> 27.651, <8> 20.9287, <9> 28.4542, <10> 22.7746;
param workload[JOB] := <1> 31.031, <2> 34.9574, <3> 20.0667, <4> 13.1107, <5> 23.6235, <6> 29.2109, <7> 27.651, <8> 20.9287, <9> 28.4542, <10> 22.7746;
param capacity[MACHINE] := <1> 62.9522, <2> 62.9522, <3> 62.9522;

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
