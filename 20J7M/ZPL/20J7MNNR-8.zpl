set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.6423, <2> 16.0038, <3> 24.23, <4> 25.7203, <5> 23.5044, <6> 21.2231, <7> 32.7159, <8> 24.2218, <9> 19.7013, <10> 23.6336, <11> 23.6013, <12> 24.3905, <13> 23.8271, <14> 24.0511, <15> 18.1278, <16> 23.3439, <17> 25.8812, <18> 24.2675, <19> 23.2978, <20> 19.8709;
param workload[JOB] := <1> 40.8911, <2> 15.3711, <3> 16.8987, <4> 49.3877, <5> 49.6378, <6> 22.2863, <7> 1.4305, <8> 2.0622, <9> 48.9596, <10> 27.2197, <11> 24.3418, <12> 40.9389, <13> 27.0134, <14> 3.1128, <15> 16.0466, <16> 29.1925, <17> 47.3863, <18> 8.896, <19> 16.5895, <20> 13.3342;
param capacity[MACHINE] := <1> 500.9967, <2> 500.9967, <3> 500.9967, <4> 500.9967, <5> 500.9967, <6> 500.9967, <7> 500.9967;

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
