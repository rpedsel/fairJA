set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.2147, <2> 0.9412, <3> 34.8334, <4> 40.7456, <5> 24.7199, <6> 1.5938, <7> 10.6715, <8> 35.2749, <9> 7.1336, <10> 35.4309;
param workload[JOB] := <1> 24.4462, <2> 45.2392, <3> 39.8066, <4> 38.1659, <5> 46.932, <6> 8.6089, <7> 34.9611, <8> 6.1232, <9> 36.1606, <10> 35.623;
param capacity[MACHINE] := <1> 105.3556, <2> 105.3556, <3> 105.3556;

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
