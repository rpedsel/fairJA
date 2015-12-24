set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.7354, <2> 8.8985, <3> 30.0644, <4> 27.8611, <5> 44.3255, <6> 39.857, <7> 31.5638, <8> 21.7855, <9> 37.1738, <10> 20.2476;
param workload[JOB] := <1> 23.01, <2> 40.6078, <3> 26.9613, <4> 38.6682, <5> 25.2889, <6> 45.6496, <7> 7.3709, <8> 33.507, <9> 37.7313, <10> 27.6613;
param capacity[MACHINE] := <1> 306.4563, <2> 306.4563, <3> 306.4563;

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
