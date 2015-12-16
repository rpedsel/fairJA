set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.063, <2> 24.9794, <3> 23.5921, <4> 21.6307, <5> 25.9538, <6> 28.653, <7> 36.0318, <8> 23.1378, <9> 22.7822, <10> 30.5809, <11> 23.7401, <12> 29.273, <13> 28.3003, <14> 23.5555, <15> 22.9991, <16> 28.1677, <17> 20.622, <18> 13.5411, <19> 25.8536, <20> 24.3598;
param workload[JOB] := <1> 10.9367, <2> 11.2988, <3> 5.0003, <4> 35.9989, <5> 46.1227, <6> 32.7527, <7> 46.9583, <8> 41.7841, <9> 11.478, <10> 42.3842, <11> 29.8109, <12> 20.3012, <13> 6.2255, <14> 18.5853, <15> 10.3792, <16> 31.1526, <17> 41.2898, <18> 4.8735, <19> 14.5917, <20> 18.8118;
param capacity[MACHINE] := <1> 60.092, <2> 60.092, <3> 60.092, <4> 60.092, <5> 60.092, <6> 60.092;

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
