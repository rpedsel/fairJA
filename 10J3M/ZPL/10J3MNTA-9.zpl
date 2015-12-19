set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.128, <2> 26.8724, <3> 22.1489, <4> 20.1808, <5> 21.6279, <6> 21.0038, <7> 31.2263, <8> 29.7177, <9> 25.6629, <10> 29.1167;
param workload[JOB] := <1> 489.6484, <2> 722.1259, <3> 490.5738, <4> 407.2647, <5> 467.7661, <6> 441.1596, <7> 975.0818, <8> 883.1417, <9> 658.5844, <10> 847.7822;
param capacity[MACHINE] := <1> 1595.7821, <2> 1595.7821, <3> 1595.7821;

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
