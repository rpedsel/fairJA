set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.0254, <2> 12.633, <3> 6.6969, <4> 36.1122, <5> 29.2232, <6> 40.7004, <7> 5.0174, <8> 22.8086, <9> 4.699, <10> 7.4665, <11> 1.7198, <12> 33.6487, <13> 24.3624, <14> 46.607, <15> 40.9053, <16> 32.3281, <17> 39.0101, <18> 29.0066, <19> 28.3929, <20> 43.2771;
param workload[JOB] := <1> 5.3875, <2> 3.5543, <3> 2.5878, <4> 6.0093, <5> 5.4058, <6> 6.3797, <7> 2.24, <8> 4.7758, <9> 2.1677, <10> 2.7325, <11> 1.3114, <12> 5.8007, <13> 4.9358, <14> 6.8269, <15> 6.3957, <16> 5.6858, <17> 6.2458, <18> 5.3858, <19> 5.3285, <20> 6.5785;
param capacity[MACHINE] := <1> 95.7353, <2> 95.7353, <3> 95.7353, <4> 95.7353, <5> 95.7353, <6> 95.7353, <7> 95.7353;

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
