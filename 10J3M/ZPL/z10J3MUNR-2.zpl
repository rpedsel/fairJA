set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.3931, <2> 35.737, <3> 12.3823, <4> 39.6651, <5> 32.4142, <6> 39.397, <7> 17.5528, <8> 32.8454, <9> 2.0871, <10> 32.4994;
param workload[JOB] := <1> 20.872, <2> 46.2569, <3> 49.3358, <4> 4.5025, <5> 14.346, <6> 34.4669, <7> 16.7802, <8> 19.2361, <9> 49.339, <10> 7.3897;
param capacity[MACHINE] := <1> 262.5251, <2> 262.5251, <3> 262.5251;

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
