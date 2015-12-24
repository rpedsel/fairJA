set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 4.7828, <2> 48.7519, <3> 32.8031, <4> 18.0005, <5> 7.1177, <6> 3.2502, <7> 13.5574, <8> 49.8697, <9> 26.5368, <10> 29.8021;
param workload[JOB] := <1> 22.8752, <2> 2376.7478, <3> 1076.0434, <4> 324.018, <5> 50.6617, <6> 10.5638, <7> 183.8031, <8> 2486.987, <9> 704.2018, <10> 888.1652;
param capacity[MACHINE] := <1> 8124.067, <2> 8124.067, <3> 8124.067;

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
