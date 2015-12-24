set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.8901, <2> 14.8459, <3> 28.9203, <4> 29.236, <5> 22.8748, <6> 21.3692, <7> 23.6347, <8> 30.4514, <9> 22.4329, <10> 25.8026;
param workload[JOB] := <1> 523.9567, <2> 220.4007, <3> 836.3838, <4> 854.7437, <5> 523.2565, <6> 456.6427, <7> 558.599, <8> 927.2878, <9> 503.235, <10> 665.7742;
param capacity[MACHINE] := <1> 6070.2801, <2> 6070.2801, <3> 6070.2801;

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
