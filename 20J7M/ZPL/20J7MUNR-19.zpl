set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.7232, <2> 12.4296, <3> 48.0992, <4> 15.9567, <5> 14.4799, <6> 0.5756, <7> 45.7822, <8> 18.3799, <9> 49.423, <10> 0.4768, <11> 4.4685, <12> 0.5557, <13> 34.29, <14> 8.2236, <15> 13.0216, <16> 20.0297, <17> 44.8792, <18> 48.3351, <19> 49.6443, <20> 20.532;
param workload[JOB] := <1> 3.1205, <2> 0.4127, <3> 5.4194, <4> 5.0417, <5> 18.7602, <6> 15.0524, <7> 22.7289, <8> 19.1723, <9> 23.4399, <10> 27.0065, <11> 24.4842, <12> 27.8944, <13> 9.3797, <14> 30.3793, <15> 27.2038, <16> 43.5025, <17> 13.6086, <18> 48.1827, <19> 7.0715, <20> 4.4873;
param capacity[MACHINE] := <1> 376.3485, <2> 376.3485, <3> 376.3485, <4> 376.3485, <5> 376.3485, <6> 376.3485, <7> 376.3485;

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
