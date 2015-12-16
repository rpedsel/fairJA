set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.087, <2> 23.6809, <3> 25.9073, <4> 17.2082, <5> 24.3197, <6> 27.2563, <7> 26.2092, <8> 24.826, <9> 25.8123, <10> 19.4079, <11> 35.4573, <12> 19.035, <13> 29.2808, <14> 21.1039, <15> 20.9322, <16> 23.4261, <17> 31.8075, <18> 30.5195, <19> 25.3315, <20> 22.7455;
param workload[JOB] := <1> 5.2045, <2> 4.8663, <3> 5.0899, <4> 4.1483, <5> 4.9315, <6> 5.2208, <7> 5.1195, <8> 4.9826, <9> 5.0806, <10> 4.4054, <11> 5.9546, <12> 4.3629, <13> 5.4112, <14> 4.5939, <15> 4.5752, <16> 4.8401, <17> 5.6398, <18> 5.5244, <19> 5.033, <20> 4.7692;
param capacity[MACHINE] := <1> 16.6256, <2> 16.6256, <3> 16.6256, <4> 16.6256, <5> 16.6256, <6> 16.6256;

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
