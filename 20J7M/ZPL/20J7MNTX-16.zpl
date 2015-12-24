set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.7458, <2> 24.7371, <3> 27.0807, <4> 23.339, <5> 16.1428, <6> 24.4148, <7> 27.9879, <8> 30.463, <9> 27.6818, <10> 26.8309, <11> 33.1762, <12> 18.586, <13> 24.5999, <14> 25.7078, <15> 31.2123, <16> 23.6877, <17> 21.75, <18> 26.6523, <19> 24.7685, <20> 17.5966;
param workload[JOB] := <1> 4.5548, <2> 4.9736, <3> 5.2039, <4> 4.831, <5> 4.0178, <6> 4.9411, <7> 5.2904, <8> 5.5193, <9> 5.2613, <10> 5.1799, <11> 5.7599, <12> 4.3111, <13> 4.9598, <14> 5.0703, <15> 5.5868, <16> 4.867, <17> 4.6637, <18> 5.1626, <19> 4.9768, <20> 4.1948;
param capacity[MACHINE] := <1> 10.642, <2> 10.642, <3> 10.642, <4> 10.642, <5> 10.642, <6> 10.642, <7> 10.642;

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
