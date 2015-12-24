set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.3895, <2> 15.9643, <3> 33.5457, <4> 33.5857, <5> 29.318, <6> 25.9186, <7> 22.9163, <8> 15.6964, <9> 29.8021, <10> 23.9446, <11> 17.2701, <12> 27.2222, <13> 22.6028, <14> 24.2842, <15> 25.7706, <16> 25.2564, <17> 28.3976, <18> 25.3041, <19> 28.1918, <20> 24.672;
param workload[JOB] := <1> 415.7317, <2> 254.8589, <3> 1125.314, <4> 1127.9992, <5> 859.5451, <6> 671.7738, <7> 525.1568, <8> 246.377, <9> 888.1652, <10> 573.3439, <11> 298.2564, <12> 741.0482, <13> 510.8866, <14> 589.7224, <15> 664.1238, <16> 637.8857, <17> 806.4237, <18> 640.2975, <19> 794.7776, <20> 608.7076;
param capacity[MACHINE] := <1> 1390.7567, <2> 1390.7567, <3> 1390.7567, <4> 1390.7567, <5> 1390.7567, <6> 1390.7567, <7> 1390.7567;

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
