set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.2898, <2> 13.2817, <3> 45.6585, <4> 41.2952, <5> 21.6976, <6> 42.0979, <7> 11.3384, <8> 24.4885, <9> 11.9964, <10> 39.5314, <11> 43.4649, <12> 11.5003, <13> 37.3604, <14> 30.609, <15> 25.8389, <16> 42.9599, <17> 4.0637, <18> 3.4174, <19> 16.5585, <20> 38.9164;
param workload[JOB] := <1> 39.2898, <2> 13.2817, <3> 45.6585, <4> 41.2952, <5> 21.6976, <6> 42.0979, <7> 11.3384, <8> 24.4885, <9> 11.9964, <10> 39.5314, <11> 43.4649, <12> 11.5003, <13> 37.3604, <14> 30.609, <15> 25.8389, <16> 42.9599, <17> 4.0637, <18> 3.4174, <19> 16.5585, <20> 38.9164;
param capacity[MACHINE] := <1> 545.3648, <2> 545.3648, <3> 545.3648, <4> 545.3648, <5> 545.3648, <6> 545.3648;

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
