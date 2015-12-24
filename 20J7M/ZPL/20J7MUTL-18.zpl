set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.6197, <2> 37.5057, <3> 10.4481, <4> 35.2095, <5> 19.2258, <6> 16.7574, <7> 40.033, <8> 25.2781, <9> 7.7428, <10> 42.5846, <11> 6.0419, <12> 32.594, <13> 46.3162, <14> 31.9911, <15> 40.7982, <16> 44.2886, <17> 12.4193, <18> 27.1343, <19> 32.0382, <20> 19.6236;
param workload[JOB] := <1> 21.6197, <2> 37.5057, <3> 10.4481, <4> 35.2095, <5> 19.2258, <6> 16.7574, <7> 40.033, <8> 25.2781, <9> 7.7428, <10> 42.5846, <11> 6.0419, <12> 32.594, <13> 46.3162, <14> 31.9911, <15> 40.7982, <16> 44.2886, <17> 12.4193, <18> 27.1343, <19> 32.0382, <20> 19.6236;
param capacity[MACHINE] := <1> 58.891, <2> 58.891, <3> 58.891, <4> 58.891, <5> 58.891, <6> 58.891, <7> 58.891;

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
