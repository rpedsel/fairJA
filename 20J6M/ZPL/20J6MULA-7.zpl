set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.4382, <2> 36.3663, <3> 45.5489, <4> 3.6776, <5> 37.2788, <6> 44.3812, <7> 22.3024, <8> 39.3265, <9> 6.0195, <10> 44.4383, <11> 13.3486, <12> 32.1331, <13> 32.0568, <14> 31.5741, <15> 4.3964, <16> 22.1111, <17> 38.5663, <18> 37.8695, <19> 39.785, <20> 15.3109;
param workload[JOB] := <1> 698.9784, <2> 1322.5078, <3> 2074.7023, <4> 13.5247, <5> 1389.7089, <6> 1969.6909, <7> 497.397, <8> 1546.5736, <9> 36.2344, <10> 1974.7625, <11> 178.1851, <12> 1032.5361, <13> 1027.6384, <14> 996.9238, <15> 19.3283, <16> 488.9007, <17> 1487.3595, <18> 1434.099, <19> 1582.8462, <20> 234.4237;
param capacity[MACHINE] := <1> 3334.3869, <2> 3334.3869, <3> 3334.3869, <4> 3334.3869, <5> 3334.3869, <6> 3334.3869;

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
