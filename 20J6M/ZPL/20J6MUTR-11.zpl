set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.675, <2> 9.4432, <3> 0.3276, <4> 17.0563, <5> 2.2661, <6> 46.5742, <7> 3.3232, <8> 41.779, <9> 39.7324, <10> 28.5882, <11> 31.5721, <12> 15.7774, <13> 22.731, <14> 25.3532, <15> 25.2864, <16> 40.2739, <17> 44.3821, <18> 22.5375, <19> 34.5973, <20> 33.155;
param workload[JOB] := <1> 1.3758, <2> 43.1543, <3> 7.2, <4> 3.5199, <5> 36.4977, <6> 17.5598, <7> 36.5829, <8> 44.3825, <9> 39.7116, <10> 4.7676, <11> 47.5799, <12> 18.6802, <13> 48.3685, <14> 21.8206, <15> 19.3807, <16> 34.2373, <17> 31.2828, <18> 44.4339, <19> 18.3146, <20> 44.2182;
param capacity[MACHINE] := <1> 70.3836, <2> 70.3836, <3> 70.3836, <4> 70.3836, <5> 70.3836, <6> 70.3836;

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
