set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.2661, <2> 48.7002, <3> 7.4541, <4> 12.0246, <5> 34.8848, <6> 2.3392, <7> 3.6612, <8> 33.6056, <9> 46.5828, <10> 36.8419;
param workload[JOB] := <1> 6.3456, <2> 6.9786, <3> 2.7302, <4> 3.4677, <5> 5.9063, <6> 1.5294, <7> 1.9134, <8> 5.797, <9> 6.8252, <10> 6.0698;
param capacity[MACHINE] := <1> 47.5632, <2> 47.5632, <3> 47.5632;

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
