set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.6869, <2> 19.8023, <3> 31.8694, <4> 36.8393, <5> 22.5692, <6> 24.3913, <7> 24.1787, <8> 39.7431, <9> 30.7579, <10> 26.9299, <11> 24.5061, <12> 26.6644, <13> 26.1477, <14> 29.7247, <15> 21.2132, <16> 28.1748, <17> 27.7158, <18> 28.2741, <19> 28.1208, <20> 21.5681;
param workload[JOB] := <1> 766.5644, <2> 392.1311, <3> 1015.6587, <4> 1357.134, <5> 509.3688, <6> 594.9355, <7> 584.6095, <8> 1579.514, <9> 946.0484, <10> 725.2195, <11> 600.5489, <12> 710.9902, <13> 683.7022, <14> 883.5578, <15> 449.9999, <16> 793.8194, <17> 768.1656, <18> 799.4247, <19> 790.7794, <20> 465.1829;
param capacity[MACHINE] := <1> 2202.4793, <2> 2202.4793, <3> 2202.4793, <4> 2202.4793, <5> 2202.4793, <6> 2202.4793, <7> 2202.4793;

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
