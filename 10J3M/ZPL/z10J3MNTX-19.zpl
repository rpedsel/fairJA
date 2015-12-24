set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.8174, <2> 21.8719, <3> 26.6686, <4> 20.6183, <5> 26.675, <6> 30.1479, <7> 17.3444, <8> 25.1092, <9> 15.2582, <10> 28.8719;
param workload[JOB] := <1> 4.9817, <2> 4.6767, <3> 5.1642, <4> 4.5407, <5> 5.1648, <6> 5.4907, <7> 4.1647, <8> 5.0109, <9> 3.9062, <10> 5.3733;
param capacity[MACHINE] := <1> 12.1185, <2> 12.1185, <3> 12.1185;

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
