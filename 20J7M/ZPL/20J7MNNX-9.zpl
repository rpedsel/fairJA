set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.5238, <2> 24.416, <3> 23.4556, <4> 33.5093, <5> 18.6881, <6> 18.5988, <7> 27.7216, <8> 32.1092, <9> 24.8807, <10> 26.3129, <11> 31.6295, <12> 24.9499, <13> 23.6847, <14> 31.8525, <15> 21.6999, <16> 26.5587, <17> 18.9237, <18> 42.0049, <19> 19.8632, <20> 26.6766;
param workload[JOB] := <1> 4.9522, <2> 4.9413, <3> 4.8431, <4> 5.7887, <5> 4.323, <6> 4.3126, <7> 5.2651, <8> 5.6665, <9> 4.9881, <10> 5.1296, <11> 5.624, <12> 4.995, <13> 4.8667, <14> 5.6438, <15> 4.6583, <16> 5.1535, <17> 4.3501, <18> 6.4811, <19> 4.4568, <20> 5.1649;
param capacity[MACHINE] := <1> 101.6044, <2> 101.6044, <3> 101.6044, <4> 101.6044, <5> 101.6044, <6> 101.6044, <7> 101.6044;

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
