set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 37.9496, <2> 11.9954, <3> 48.7434, <4> 39.131, <5> 47.4032, <6> 20.9132, <7> 3.0707, <8> 47.8217, <9> 23.0163, <10> 22.1172;
param workload[JOB] := <1> 26.3494, <2> 39.0302, <3> 8.854, <4> 47.9649, <5> 20.5038, <6> 27.9469, <7> 38.6604, <8> 29.3125, <9> 15.8865, <10> 1.0087;
param capacity[MACHINE] := <1> 63.8793, <2> 63.8793, <3> 63.8793;

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
