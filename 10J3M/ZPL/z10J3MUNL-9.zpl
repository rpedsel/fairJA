set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 37.6964, <2> 4.09, <3> 8.2812, <4> 18.8991, <5> 19.4218, <6> 15.9621, <7> 33.9822, <8> 45.6045, <9> 48.6092, <10> 47.4723;
param workload[JOB] := <1> 37.6964, <2> 4.09, <3> 8.2812, <4> 18.8991, <5> 19.4218, <6> 15.9621, <7> 33.9822, <8> 45.6045, <9> 48.6092, <10> 47.4723;
param capacity[MACHINE] := <1> 280.0188, <2> 280.0188, <3> 280.0188;

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
