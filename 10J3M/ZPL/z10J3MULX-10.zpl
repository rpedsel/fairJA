set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.2741, <2> 9.6414, <3> 32.2869, <4> 48.2206, <5> 10.5035, <6> 11.7322, <7> 5.9367, <8> 21.4219, <9> 37.9159, <10> 22.0648;
param workload[JOB] := <1> 4.3902, <2> 3.1051, <3> 5.6822, <4> 6.9441, <5> 3.2409, <6> 3.4252, <7> 2.4365, <8> 4.6284, <9> 6.1576, <10> 4.6973;
param capacity[MACHINE] := <1> 14.9025, <2> 14.9025, <3> 14.9025;

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
