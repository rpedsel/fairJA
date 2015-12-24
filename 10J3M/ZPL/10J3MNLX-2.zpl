set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.645, <2> 31.0485, <3> 31.4686, <4> 23.3058, <5> 24.4846, <6> 18.0734, <7> 33.0503, <8> 32.4845, <9> 26.4908, <10> 27.0054;
param workload[JOB] := <1> 4.4323, <2> 5.5721, <3> 5.6097, <4> 4.8276, <5> 4.9482, <6> 4.2513, <7> 5.7489, <8> 5.6995, <9> 5.1469, <10> 5.1967;
param capacity[MACHINE] := <1> 17.1444, <2> 17.1444, <3> 17.1444;

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
