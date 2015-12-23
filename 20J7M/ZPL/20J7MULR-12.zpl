set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.5707, <2> 10.7497, <3> 36.723, <4> 48.8108, <5> 18.6636, <6> 7.6082, <7> 14.4503, <8> 23.2929, <9> 3.6399, <10> 24.012, <11> 33.6277, <12> 39.7777, <13> 36.6919, <14> 28.9719, <15> 21.4672, <16> 3.9461, <17> 29.8914, <18> 46.8836, <19> 37.2971, <20> 33.6083;
param workload[JOB] := <1> 45.7319, <2> 3.851, <3> 0.2091, <4> 37.248, <5> 44.5188, <6> 48.6093, <7> 6.0988, <8> 23.5712, <9> 3.8327, <10> 3.439, <11> 19.4296, <12> 4.2046, <13> 38.5079, <14> 13.331, <15> 2.0599, <16> 41.6458, <17> 29.0625, <18> 20.5289, <19> 22.4536, <20> 42.5867;
param capacity[MACHINE] := <1> 64.4172, <2> 64.4172, <3> 64.4172, <4> 64.4172, <5> 64.4172, <6> 64.4172, <7> 64.4172;

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
