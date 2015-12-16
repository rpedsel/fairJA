set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.086, <2> 27.2777, <3> 22.5906, <4> 27.2191, <5> 19.3201, <6> 25.1648, <7> 24.1836, <8> 40.5493, <9> 36.9791, <10> 23.5397;
param workload[JOB] := <1> 17.8842, <2> 43.6394, <3> 41.2921, <4> 22.4878, <5> 37.2021, <6> 40.5742, <7> 5.4028, <8> 2.3011, <9> 35.4737, <10> 17.6488;
param capacity[MACHINE] := <1> 65.9765, <2> 65.9765, <3> 65.9765;

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
