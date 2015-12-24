set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.66, <2> 29.3552, <3> 28.5395, <4> 30.712, <5> 31.1781, <6> 24.0303, <7> 23.5746, <8> 31.5617, <9> 30.0206, <10> 32.1981;
param workload[JOB] := <1> 30.66, <2> 29.3552, <3> 28.5395, <4> 30.712, <5> 31.1781, <6> 24.0303, <7> 23.5746, <8> 31.5617, <9> 30.0206, <10> 32.1981;
param capacity[MACHINE] := <1> 291.8301, <2> 291.8301, <3> 291.8301;

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
