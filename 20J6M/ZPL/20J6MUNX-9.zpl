set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 0.6717, <2> 41.3374, <3> 2.3759, <4> 26.6777, <5> 14.2656, <6> 7.7625, <7> 22.1848, <8> 13.124, <9> 31.9766, <10> 14.2917, <11> 29.7587, <12> 40.6725, <13> 29.8655, <14> 25.5504, <15> 12.7395, <16> 26.0012, <17> 19.3301, <18> 38.0821, <19> 24.6106, <20> 13.3208;
param workload[JOB] := <1> 0.8196, <2> 6.4294, <3> 1.5414, <4> 5.165, <5> 3.777, <6> 2.7861, <7> 4.7101, <8> 3.6227, <9> 5.6548, <10> 3.7804, <11> 5.4552, <12> 6.3775, <13> 5.4649, <14> 5.0547, <15> 3.5692, <16> 5.0991, <17> 4.3966, <18> 6.1711, <19> 4.9609, <20> 3.6498;
param capacity[MACHINE] := <1> 88.4855, <2> 88.4855, <3> 88.4855, <4> 88.4855, <5> 88.4855, <6> 88.4855;

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
