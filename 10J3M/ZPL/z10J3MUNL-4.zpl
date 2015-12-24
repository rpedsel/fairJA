set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.6661, <2> 45.9865, <3> 17.5949, <4> 8.5429, <5> 5.6111, <6> 34.1302, <7> 38.6362, <8> 39.5992, <9> 2.7234, <10> 4.8651;
param workload[JOB] := <1> 35.6661, <2> 45.9865, <3> 17.5949, <4> 8.5429, <5> 5.6111, <6> 34.1302, <7> 38.6362, <8> 39.5992, <9> 2.7234, <10> 4.8651;
param capacity[MACHINE] := <1> 233.3556, <2> 233.3556, <3> 233.3556;

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
