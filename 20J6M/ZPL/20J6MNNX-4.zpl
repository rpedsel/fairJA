set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.1391, <2> 26.9016, <3> 18.5663, <4> 26.2506, <5> 12.0792, <6> 15.9512, <7> 31.0173, <8> 28.9808, <9> 25.0542, <10> 28.308, <11> 31.7711, <12> 21.7045, <13> 37.2508, <14> 33.4938, <15> 21.5564, <16> 31.9603, <17> 22.2541, <18> 21.9176, <19> 26.0819, <20> 29.6232;
param workload[JOB] := <1> 4.9132, <2> 5.1867, <3> 4.3089, <4> 5.1235, <5> 3.4755, <6> 3.9939, <7> 5.5693, <8> 5.3834, <9> 5.0054, <10> 5.3205, <11> 5.6366, <12> 4.6588, <13> 6.1033, <14> 5.7874, <15> 4.6429, <16> 5.6533, <17> 4.7174, <18> 4.6816, <19> 5.107, <20> 5.4427;
param capacity[MACHINE] := <1> 100.7113, <2> 100.7113, <3> 100.7113, <4> 100.7113, <5> 100.7113, <6> 100.7113;

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
