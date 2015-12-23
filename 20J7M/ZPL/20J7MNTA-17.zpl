set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.6129, <2> 26.1178, <3> 27.8542, <4> 25.7477, <5> 22.6596, <6> 21.9266, <7> 22.5593, <8> 14.9944, <9> 23.5092, <10> 21.9815, <11> 20.4579, <12> 32.9696, <13> 23.2432, <14> 29.067, <15> 27.2496, <16> 16.5126, <17> 21.3107, <18> 23.1287, <19> 22.7639, <20> 30.1822;
param workload[JOB] := <1> 762.4722, <2> 682.1395, <3> 775.8565, <4> 662.9441, <5> 513.4575, <6> 480.7758, <7> 508.922, <8> 224.832, <9> 552.6825, <10> 483.1863, <11> 418.5257, <12> 1086.9945, <13> 540.2463, <14> 844.8905, <15> 742.5407, <16> 272.666, <17> 454.1459, <18> 534.9368, <19> 518.1951, <20> 910.9652;
param capacity[MACHINE] := <1> 1282.6473, <2> 1282.6473, <3> 1282.6473, <4> 1282.6473, <5> 1282.6473, <6> 1282.6473, <7> 1282.6473;

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