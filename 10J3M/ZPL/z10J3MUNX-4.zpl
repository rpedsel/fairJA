set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.6392, <2> 5.6708, <3> 33.9837, <4> 14.7943, <5> 33.4117, <6> 38.8967, <7> 21.7754, <8> 11.716, <9> 20.836, <10> 43.6154;
param workload[JOB] := <1> 6.5299, <2> 2.3813, <3> 5.8296, <4> 3.8463, <5> 5.7803, <6> 6.2367, <7> 4.6664, <8> 3.4229, <9> 4.5646, <10> 6.6042;
param capacity[MACHINE] := <1> 49.8622, <2> 49.8622, <3> 49.8622;

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
