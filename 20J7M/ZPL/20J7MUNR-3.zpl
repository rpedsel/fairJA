set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.9119, <2> 13.97, <3> 25.8386, <4> 21.8273, <5> 10.4885, <6> 24.5301, <7> 8.3204, <8> 29.1171, <9> 13.0624, <10> 25.4648, <11> 45.0824, <12> 42.2182, <13> 17.4484, <14> 42.574, <15> 17.9586, <16> 46.2516, <17> 26.9214, <18> 31.7611, <19> 34.3579, <20> 35.1371;
param workload[JOB] := <1> 41.0361, <2> 30.3393, <3> 29.3984, <4> 23.4162, <5> 43.5359, <6> 9.5226, <7> 7.2772, <8> 28.8729, <9> 19.6372, <10> 24.0392, <11> 32.8171, <12> 7.008, <13> 48.2531, <14> 46.0849, <15> 11.7446, <16> 12.8945, <17> 47.1829, <18> 47.2652, <19> 8.4847, <20> 27.5522;
param capacity[MACHINE] := <1> 546.3622, <2> 546.3622, <3> 546.3622, <4> 546.3622, <5> 546.3622, <6> 546.3622, <7> 546.3622;

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
