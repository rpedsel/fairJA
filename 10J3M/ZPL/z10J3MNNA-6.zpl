set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.7799, <2> 28.2416, <3> 27.1685, <4> 21.0034, <5> 18.8235, <6> 21.209, <7> 27.8012, <8> 23.8136, <9> 23.5308, <10> 27.5249;
param workload[JOB] := <1> 717.163, <2> 797.588, <3> 738.1274, <4> 441.1428, <5> 354.3242, <6> 449.8217, <7> 772.9067, <8> 567.0875, <9> 553.6985, <10> 757.6201;
param capacity[MACHINE] := <1> 6149.4799, <2> 6149.4799, <3> 6149.4799;

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
