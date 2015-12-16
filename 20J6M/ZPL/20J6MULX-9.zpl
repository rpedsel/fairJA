set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 47.916, <2> 39.5377, <3> 37.4919, <4> 21.2711, <5> 17.7454, <6> 16.7076, <7> 13.6599, <8> 36.6909, <9> 4.0991, <10> 9.4343, <11> 12.1982, <12> 35.5211, <13> 6.937, <14> 29.0768, <15> 26.4394, <16> 44.8377, <17> 6.8555, <18> 44.4417, <19> 28.9175, <20> 27.4074;
param workload[JOB] := <1> 6.9221, <2> 6.2879, <3> 6.1231, <4> 4.6121, <5> 4.2125, <6> 4.0875, <7> 3.6959, <8> 6.0573, <9> 2.0246, <10> 3.0715, <11> 3.4926, <12> 5.96, <13> 2.6338, <14> 5.3923, <15> 5.1419, <16> 6.6961, <17> 2.6183, <18> 6.6665, <19> 5.3775, <20> 5.2352;
param capacity[MACHINE] := <1> 16.0515, <2> 16.0515, <3> 16.0515, <4> 16.0515, <5> 16.0515, <6> 16.0515;

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
