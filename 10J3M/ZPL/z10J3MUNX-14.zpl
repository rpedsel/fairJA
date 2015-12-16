set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.176, <2> 16.4857, <3> 40.9204, <4> 5.3521, <5> 23.2608, <6> 33.5103, <7> 32.2213, <8> 49.9467, <9> 48.3841, <10> 26.064;
param workload[JOB] := <1> 4.2633, <2> 4.0603, <3> 6.3969, <4> 2.3135, <5> 4.8229, <6> 5.7888, <7> 5.6764, <8> 7.0673, <9> 6.9559, <10> 5.1053;
param capacity[MACHINE] := <1> 52.4506, <2> 52.4506, <3> 52.4506;

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
