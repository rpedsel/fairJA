set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.5233, <2> 2.3775, <3> 3.5609, <4> 32.0889, <5> 18.2884, <6> 40.3506, <7> 33.2508, <8> 37.6099, <9> 26.4844, <10> 16.4038, <11> 27.6709, <12> 37.3068, <13> 2.1751, <14> 19.0018, <15> 4.6897, <16> 40.8426, <17> 43.7298, <18> 16.6868, <19> 13.1395, <20> 13.4738;
param workload[JOB] := <1> 5.7899, <2> 1.5419, <3> 1.887, <4> 5.6647, <5> 4.2765, <6> 6.3522, <7> 5.7664, <8> 6.1327, <9> 5.1463, <10> 4.0502, <11> 5.2603, <12> 6.1079, <13> 1.4748, <14> 4.3591, <15> 2.1656, <16> 6.3908, <17> 6.6129, <18> 4.0849, <19> 3.6248, <20> 3.6707;
param capacity[MACHINE] := <1> 12.9085, <2> 12.9085, <3> 12.9085, <4> 12.9085, <5> 12.9085, <6> 12.9085, <7> 12.9085;

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
