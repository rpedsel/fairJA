set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.9285, <2> 38.7552, <3> 28.7723, <4> 17.1414, <5> 3.8783, <6> 1.073, <7> 16.1599, <8> 29.3876, <9> 41.7483, <10> 44.456, <11> 12.3837, <12> 4.8404, <13> 26.5585, <14> 26.4812, <15> 11.773, <16> 5.1533, <17> 15.7304, <18> 34.7312, <19> 37.7112, <20> 21.0735;
param workload[JOB] := <1> 18.3586, <2> 42.0432, <3> 3.8627, <4> 44.8614, <5> 28.2661, <6> 5.407, <7> 46.0817, <8> 21.9976, <9> 44.3705, <10> 48.9956, <11> 7.2685, <12> 15.7567, <13> 3.5033, <14> 33.1089, <15> 39.7294, <16> 35.2373, <17> 42.3252, <18> 27.4808, <19> 38.984, <20> 13.1862;
param capacity[MACHINE] := <1> 560.8247, <2> 560.8247, <3> 560.8247, <4> 560.8247, <5> 560.8247, <6> 560.8247;

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
