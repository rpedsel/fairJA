set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.3848, <2> 0.948, <3> 18.6142, <4> 43.9134, <5> 21.2533, <6> 34.3553, <7> 21.6597, <8> 31.004, <9> 37.8769, <10> 35.5162, <11> 42.9419, <12> 47.4646, <13> 39.2209, <14> 32.5473, <15> 0.0204, <16> 15.9222, <17> 24.5129, <18> 36.5244, <19> 22.6648, <20> 22.328;
param workload[JOB] := <1> 546.8489, <2> 0.8987, <3> 346.4884, <4> 1928.3867, <5> 451.7028, <6> 1180.2866, <7> 469.1426, <8> 961.248, <9> 1434.6596, <10> 1261.4005, <11> 1844.0068, <12> 2252.8883, <13> 1538.279, <14> 1059.3267, <15> 0.0004, <16> 253.5165, <17> 600.8823, <18> 1334.0318, <19> 513.6932, <20> 498.5396;
param capacity[MACHINE] := <1> 3079.3712, <2> 3079.3712, <3> 3079.3712, <4> 3079.3712, <5> 3079.3712, <6> 3079.3712;

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
