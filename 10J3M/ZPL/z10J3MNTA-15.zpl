set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.3316, <2> 26.4382, <3> 29.5551, <4> 25.8724, <5> 25.3358, <6> 19.9603, <7> 28.5111, <8> 23.8786, <9> 29.122, <10> 28.7544;
param workload[JOB] := <1> 498.7004, <2> 698.9784, <3> 873.5039, <4> 669.3811, <5> 641.9028, <6> 398.4136, <7> 812.8828, <8> 570.1875, <9> 848.0909, <10> 826.8155;
param capacity[MACHINE] := <1> 1709.7142, <2> 1709.7142, <3> 1709.7142;

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
