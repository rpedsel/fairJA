set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.4637, <2> 19.2508, <3> 17.5815, <4> 33.382, <5> 44.494, <6> 22.0295, <7> 3.3926, <8> 0.304, <9> 24.6822, <10> 33.1401, <11> 28.6343, <12> 15.0962, <13> 12.4634, <14> 44.0046, <15> 24.0632, <16> 20.0982, <17> 43.1226, <18> 4.6219, <19> 28.4775, <20> 22.0428;
param workload[JOB] := <1> 5.1443, <2> 4.3876, <3> 4.193, <4> 5.7777, <5> 6.6704, <6> 4.6936, <7> 1.8419, <8> 0.5514, <9> 4.9681, <10> 5.7567, <11> 5.3511, <12> 3.8854, <13> 3.5304, <14> 6.6336, <15> 4.9054, <16> 4.4831, <17> 6.5668, <18> 2.1499, <19> 5.3364, <20> 4.695;
param capacity[MACHINE] := <1> 11.4402, <2> 11.4402, <3> 11.4402, <4> 11.4402, <5> 11.4402, <6> 11.4402;

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
