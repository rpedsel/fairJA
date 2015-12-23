set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.5342, <2> 2.7382, <3> 14.275, <4> 38.0121, <5> 46.5398, <6> 4.6314, <7> 43.9693, <8> 0.9537, <9> 11.4937, <10> 4.236, <11> 21.3087, <12> 44.2569, <13> 13.2747, <14> 11.8875, <15> 24.0833, <16> 44.8987, <17> 13.936, <18> 39.8642, <19> 28.6649, <20> 16.5576;
param workload[JOB] := <1> 6.6734, <2> 1.6548, <3> 3.7782, <4> 6.1654, <5> 6.822, <6> 2.1521, <7> 6.6309, <8> 0.9766, <9> 3.3902, <10> 2.0582, <11> 4.6161, <12> 6.6526, <13> 3.6434, <14> 3.4478, <15> 4.9075, <16> 6.7006, <17> 3.7331, <18> 6.3138, <19> 5.354, <20> 4.0691;
param capacity[MACHINE] := <1> 9.615, <2> 9.615, <3> 9.615, <4> 9.615, <5> 9.615, <6> 9.615, <7> 9.615;

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
