set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 1.0637, <2> 17.5836, <3> 32.3348, <4> 45.4249, <5> 37.125, <6> 11.9847, <7> 4.2503, <8> 31.2886, <9> 25.0881, <10> 11.4958;
param workload[JOB] := <1> 1.0314, <2> 4.1933, <3> 5.6864, <4> 6.7398, <5> 6.093, <6> 3.4619, <7> 2.0616, <8> 5.5936, <9> 5.0088, <10> 3.3905;
param capacity[MACHINE] := <1> 14.4201, <2> 14.4201, <3> 14.4201;

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
