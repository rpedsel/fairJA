set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.5606, <2> 16.2561, <3> 49.8538, <4> 38.4605, <5> 27.871, <6> 24.8024, <7> 44.4498, <8> 2.5395, <9> 26.2216, <10> 10.2797, <11> 4.335, <12> 8.6979, <13> 28.2445, <14> 16.1407, <15> 41.5738, <16> 12.9289, <17> 39.8895, <18> 41.1566, <19> 14.2268, <20> 4.6551;
param workload[JOB] := <1> 1.887, <2> 4.0319, <3> 7.0607, <4> 6.2017, <5> 5.2793, <6> 4.9802, <7> 6.6671, <8> 1.5936, <9> 5.1207, <10> 3.2062, <11> 2.0821, <12> 2.9492, <13> 5.3146, <14> 4.0175, <15> 6.4478, <16> 3.5957, <17> 6.3158, <18> 6.4153, <19> 3.7718, <20> 2.1576;
param capacity[MACHINE] := <1> 12.728, <2> 12.728, <3> 12.728, <4> 12.728, <5> 12.728, <6> 12.728, <7> 12.728;

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
