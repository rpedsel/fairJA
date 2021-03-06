set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.2663, <2> 18.9276, <3> 24.4516, <4> 23.1674, <5> 24.3516, <6> 11.9337, <7> 13.1481, <8> 22.0771, <9> 21.7182, <10> 23.9311, <11> 24.5052, <12> 29.7859, <13> 27.3708, <14> 24.192, <15> 21.1837, <16> 28.497, <17> 27.2729, <18> 22.3581, <19> 25.045, <20> 27.7452;
param workload[JOB] := <1> 638.3859, <2> 358.254, <3> 597.8807, <4> 536.7284, <5> 593.0004, <6> 142.4132, <7> 172.8725, <8> 487.3983, <9> 471.6802, <10> 572.6975, <11> 600.5048, <12> 887.1998, <13> 749.1607, <14> 585.2529, <15> 448.7491, <16> 812.079, <17> 743.8111, <18> 499.8846, <19> 627.252, <20> 769.7961;
param capacity[MACHINE] := <1> 1210.1787, <2> 1210.1787, <3> 1210.1787, <4> 1210.1787, <5> 1210.1787, <6> 1210.1787, <7> 1210.1787;

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
