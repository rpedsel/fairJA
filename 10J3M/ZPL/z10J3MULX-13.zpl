set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.7684, <2> 28.5396, <3> 24.7007, <4> 46.6464, <5> 22.9413, <6> 36.4514, <7> 10.4292, <8> 1.4693, <9> 11.6648, <10> 28.8876;
param workload[JOB] := <1> 4.3323, <2> 5.3422, <3> 4.97, <4> 6.8298, <5> 4.7897, <6> 6.0375, <7> 3.2294, <8> 1.2121, <9> 3.4154, <10> 5.3747;
param capacity[MACHINE] := <1> 15.1777, <2> 15.1777, <3> 15.1777;

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
