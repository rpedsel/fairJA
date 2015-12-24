set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.7272, <2> 46.7752, <3> 10.5069, <4> 9.0966, <5> 11.9069, <6> 36.126, <7> 17.6802, <8> 0.3209, <9> 47.6166, <10> 12.2111, <11> 9.8615, <12> 46.4488, <13> 1.7407, <14> 40.9653, <15> 31.0851, <16> 44.8605, <17> 48.6928, <18> 43.8168, <19> 45.8175, <20> 0.2279;
param workload[JOB] := <1> 9.7272, <2> 46.7752, <3> 10.5069, <4> 9.0966, <5> 11.9069, <6> 36.126, <7> 17.6802, <8> 0.3209, <9> 47.6166, <10> 12.2111, <11> 9.8615, <12> 46.4488, <13> 1.7407, <14> 40.9653, <15> 31.0851, <16> 44.8605, <17> 48.6928, <18> 43.8168, <19> 45.8175, <20> 0.2279;
param capacity[MACHINE] := <1> 55.2305, <2> 55.2305, <3> 55.2305, <4> 55.2305, <5> 55.2305, <6> 55.2305, <7> 55.2305;

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
