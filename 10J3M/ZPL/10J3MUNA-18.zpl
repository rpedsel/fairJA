set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.3006, <2> 22.3672, <3> 32.2776, <4> 39.5581, <5> 43.2635, <6> 41.1984, <7> 36.8708, <8> 11.8927, <9> 12.6572, <10> 28.4543;
param workload[JOB] := <1> 1624.1384, <2> 500.2916, <3> 1041.8435, <4> 1564.8433, <5> 1871.7304, <6> 1697.3082, <7> 1359.4559, <8> 141.4363, <9> 160.2047, <10> 809.6472;
param capacity[MACHINE] := <1> 10770.8995, <2> 10770.8995, <3> 10770.8995;

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
