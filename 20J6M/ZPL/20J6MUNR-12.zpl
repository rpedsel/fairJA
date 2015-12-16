set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 48.5093, <2> 3.423, <3> 17.6558, <4> 40.2924, <5> 38.4279, <6> 43.9202, <7> 10.7147, <8> 32.2547, <9> 17.5946, <10> 26.3638, <11> 48.2045, <12> 13.8111, <13> 23.4072, <14> 4.916, <15> 8.1141, <16> 43.0902, <17> 16.5293, <18> 15.3661, <19> 25.1912, <20> 14.6863;
param workload[JOB] := <1> 36.3927, <2> 41.9582, <3> 11.9103, <4> 28.4794, <5> 3.3916, <6> 44.9222, <7> 0.5356, <8> 1.8195, <9> 35.3824, <10> 17.2888, <11> 47.0085, <12> 47.0632, <13> 45.2858, <14> 6.0276, <15> 46.9995, <16> 37.885, <17> 10.725, <18> 44.2577, <19> 44.6881, <20> 20.387;
param capacity[MACHINE] := <1> 572.4081, <2> 572.4081, <3> 572.4081, <4> 572.4081, <5> 572.4081, <6> 572.4081;

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
