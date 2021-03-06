set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.751, <2> 29.2366, <3> 49.3621, <4> 39.5757, <5> 12.7455, <6> 16.8972, <7> 15.7283, <8> 42.9639, <9> 12.5567, <10> 27.7096, <11> 28.4494, <12> 29.4119, <13> 10.7341, <14> 34.7884, <15> 1.4302, <16> 21.0116, <17> 21.6856, <18> 34.2058, <19> 7.9067, <20> 43.035;
param workload[JOB] := <1> 115.584, <2> 854.7788, <3> 2436.6169, <4> 1566.236, <5> 162.4478, <6> 285.5154, <7> 247.3794, <8> 1845.8967, <9> 157.6707, <10> 767.8219, <11> 809.3684, <12> 865.0599, <13> 115.2209, <14> 1210.2328, <15> 2.0455, <16> 441.4873, <17> 470.2652, <18> 1170.0368, <19> 62.5159, <20> 1852.0112;
param capacity[MACHINE] := <1> 2758.1781, <2> 2758.1781, <3> 2758.1781, <4> 2758.1781, <5> 2758.1781, <6> 2758.1781, <7> 2758.1781;

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
