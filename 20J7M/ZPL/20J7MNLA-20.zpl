set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.8675, <2> 19.6395, <3> 31.8642, <4> 31.8969, <5> 28.7256, <6> 25.7054, <7> 24.1356, <8> 24.2982, <9> 28.1847, <10> 27.5568, <11> 27.7815, <12> 22.3138, <13> 33.7176, <14> 29.895, <15> 15.6089, <16> 14.8426, <17> 24.6343, <18> 30.5431, <19> 30.5076, <20> 23.4459;
param workload[JOB] := <1> 669.1276, <2> 385.71, <3> 1015.3272, <4> 1017.4122, <5> 825.1601, <6> 660.7676, <7> 582.5272, <8> 590.4025, <9> 794.3773, <10> 759.3772, <11> 771.8117, <12> 497.9057, <13> 1136.8765, <14> 893.711, <15> 243.6378, <16> 220.3028, <17> 606.8487, <18> 932.881, <19> 930.7137, <20> 549.7102;
param capacity[MACHINE] := <1> 2012.084, <2> 2012.084, <3> 2012.084, <4> 2012.084, <5> 2012.084, <6> 2012.084, <7> 2012.084;

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
